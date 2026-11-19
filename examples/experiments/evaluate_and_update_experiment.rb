#!/usr/bin/env ruby
# Encoding: utf-8
#
# Copyright 2026 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     https://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
# Retrieves performance metrics for an experiment, evaluates the performance,
# and takes action on the experiment accordingly.
#
# It shows how to query statistical significance metrics for the experiment,
# and how to execute actions such as promoting, ending, or graduating an experiment.

require 'optparse'
require 'google/ads/google_ads'

# Constants for decision making
# Choose a confidence level based on your specific needs.
# - The p-value (probability value) is the probability that the observed performance
#   difference between control and treatment occurred by random chance rather than due
#   to the changes in the experiment. A lower p-value represents higher confidence.
# - For example, a p-value threshold of 0.05 corresponds to a 95% confidence level
#   (the academic standard for statistical significance).
P_VALUE_THRESHOLD = 0.05 # 95% confidence level

def evaluate_and_update_experiment(customer_id, experiment_id)
  # GoogleAdsClient will read a config file from
  # ENV['HOME']/google_ads_config.rb when called without parameters
  client = Google::Ads::GoogleAds::GoogleAdsClient.new

  # Query to retrieve the experiment.
  # Notice that we request the statistical metrics (for example, p-value, point estimate,
  # margin of error) which are populated based on the treatment arm.
  query = <<~QUERY
    SELECT
      experiment.resource_name,
      experiment.name,
      experiment.experiment_id,
      experiment.type,
      metrics.conversions_absolute_change_p_value,
      metrics.conversions_absolute_change_point_estimate,
      metrics.conversions_absolute_change_margin_of_error,
      metrics.clicks_p_value,
      metrics.clicks_point_estimate,
      metrics.clicks_margin_of_error
    FROM experiment
    WHERE experiment.experiment_id = #{experiment_id}
  QUERY

  results = client.service.google_ads.search(
    customer_id: customer_id,
    query: query,
  )

  experiment_found = false
  # There should be at most one row.
  results.each do |row|
    experiment_found = true
    puts "Found experiment: #{row.experiment.name}"
    puts "  Resource Name: #{row.experiment.resource_name}"

    evaluate_experiment(client, customer_id, row)
  end

  unless experiment_found
    puts "No experiment found for experiment ID: #{experiment_id}"
  end
end

# [START evaluate_and_update_experiment_1]
def evaluate_experiment(client, customer_id, row)
  # This function evaluates performance metrics and immediately takes action
  # to update the experiment's status (promote, end, or graduate) if
  # statistical significance thresholds are met.
  metrics = row.metrics
  experiment_resource_name = row.experiment.resource_name

  has_conv_metrics = !metrics.nil? &&
                     metrics.has_conversions_absolute_change_p_value? &&
                     metrics.has_conversions_absolute_change_point_estimate? &&
                     metrics.has_conversions_absolute_change_margin_of_error?
  has_click_metrics = !metrics.nil? &&
                      metrics.has_clicks_p_value? &&
                      metrics.has_clicks_point_estimate? &&
                      metrics.has_clicks_margin_of_error?

  # 1. Evaluate conversion success as a primary success signal if available.
  # - Point Estimate: Represents the estimated average lift or difference in conversions.
  # - Margin of Error: Outlines the confidence interval bounds. Note that the margin_of_error
  #   provided by the API is calculated for a preset confidence level which is set based on the experiment type.
  # - Lower Bound: (Point Estimate - Margin of Error). If this value is above 0,
  #   we have statistical significance that performance has improved.
  if has_conv_metrics
    conv_p_value = metrics.conversions_absolute_change_p_value
    conv_lift = metrics.conversions_absolute_change_point_estimate
    conv_error = metrics.conversions_absolute_change_margin_of_error
    conv_lower_bound = conv_lift - conv_error

    if conv_p_value <= P_VALUE_THRESHOLD
      if conv_lower_bound > 0
        puts sprintf(
          "Significant Success: Conversions increased. Even at the lower " \
          "bound, the lift is %.2f. Promoting changes.",
          conv_lower_bound,
        )
        promote_experiment(client, customer_id, experiment_resource_name)
        return
      elsif (conv_lift + conv_error) < 0
        puts sprintf(
          "Significant Decline: Even the upper bound (%.2f) is below zero. " \
          "Ending experiment.",
          conv_lift + conv_error,
        )
        end_experiment(client, customer_id, experiment_resource_name)
        return
      end
    end
  end

  # 2. Evaluate click volume as a secondary signal.
  # This is helpful as an early indicator or for lower-volume accounts.
  if has_click_metrics
    click_p_value = metrics.clicks_p_value
    click_lift = metrics.clicks_point_estimate
    click_error = metrics.clicks_margin_of_error
    click_lower_bound = click_lift - click_error

    if click_p_value <= P_VALUE_THRESHOLD && click_lower_bound > 0
      # We have a directional winner: high confidence in more traffic,
      # but not enough data to confirm conversion impact yet.
      puts sprintf("Click volume is significantly up (+%.1f%%).", click_lift * 100)

      # Graduation is only supported for separate campaign experiments, not
      # intra-campaign experiments where there is no separate treatment campaign.
      experiment_type = row.experiment.type
      if experiment_type != :ADOPT_BROAD_MATCH_KEYWORDS && experiment_type != :ADOPT_AI_MAX
        puts "Graduating treatment campaign for further manual analysis."
        graduate_experiment(client, customer_id, experiment_resource_name)
      else
        puts "Intra-campaign trial detected: graduation is not supported. " \
             "Continuing to run the experiment to gather more conversion data."
      end
      return
    end
  end

  # 3. Print status if no action was taken.
  if has_conv_metrics || has_click_metrics
    conv_status = if has_conv_metrics
      sprintf(
        "Conversions (p=%.2f, lift=%.2f +/- %.2f)",
        metrics.conversions_absolute_change_p_value,
        metrics.conversions_absolute_change_point_estimate,
        metrics.conversions_absolute_change_margin_of_error,
      )
    else
      "Conversions (not populated)"
    end

    click_status = if has_click_metrics
      sprintf(
        "Clicks (p=%.2f, lift=%.2f +/- %.2f)",
        metrics.clicks_p_value,
        metrics.clicks_point_estimate,
        metrics.clicks_margin_of_error,
      )
    else
      "Clicks (not populated)"
    end

    puts "Inconclusive: No significant action taken. #{conv_status}, #{click_status}. " \
         "Allowing the experiment to continue running."
  else
    puts "Conversion and click performance metrics are not yet populated. " \
         "Allowing the experiment to continue running."
  end
end
# [END evaluate_and_update_experiment_1]

def promote_experiment(client, customer_id, experiment_resource_name)
  # This method returns a long running operation (LRO).
  # - To block until the operation is complete: call operation.wait_until_done!
  # - For non-blocking status checks: use operation.done?
  # - For manual polling or persistent tracking: store operation.name
  #
  # For more information on handling LROs, see:
  # https://developers.google.com/google-ads/api/docs/concepts/long-running-operations
  operation = client.service.experiment.promote_experiment(
    resource_name: experiment_resource_name,
  )
  puts "Started promotion for experiment: #{experiment_resource_name}"
  puts "The promotion is running asynchronously. You can track its progress " \
       "using the long-running operation: #{operation.name}"
  puts "Best Practice: If the promotion fails, you can retrieve the full list " \
       "of errors by calling ExperimentService.ListExperimentAsyncErrors."
end

def end_experiment(client, customer_id, experiment_resource_name)
  client.service.experiment.end_experiment(
    experiment: experiment_resource_name,
  )
  puts "Successfully ended experiment: #{experiment_resource_name}"
end

def graduate_experiment(client, customer_id, experiment_resource_name)
  # 1. Create a new campaign budget for the graduating campaign.
  budget_operation = client.operation.create_resource.campaign_budget do |b|
    b.name = "Graduated Experiment Budget #{(Time.new.to_f * 1000).to_i}"
    b.amount_micros = 50_000_000 # $50.00/day budget
    b.delivery_method = :STANDARD
  end

  response = client.service.campaign_budget.mutate_campaign_budgets(
    customer_id: customer_id,
    operations: [budget_operation],
  )
  budget_resource_name = response.results.first.resource_name
  puts "Created new standalone campaign budget with resource name: #{budget_resource_name}"

  # 2. Query the experiment_arm to retrieve the treatment campaign's resource name.
  # The treatment arm has control set to false.
  query = <<~QUERY
    SELECT
      experiment_arm.campaigns
    FROM experiment_arm
    WHERE experiment_arm.experiment = '#{experiment_resource_name}'
      AND experiment_arm.control = FALSE
  QUERY

  search_response = client.service.google_ads.search(
    customer_id: customer_id,
    query: query,
  )

  # Find the resource name of the treatment campaign.
  treatment_campaign_resource_name = nil
  search_response.each do |row|
    if row.experiment_arm.campaigns.any?
      treatment_campaign_resource_name = row.experiment_arm.campaigns.first
      break
    end
  end

  # Verify that a treatment campaign was found.
  unless treatment_campaign_resource_name
    puts "Could not find the treatment campaign associated with this experiment."
    return
  end

  # 3. Build the budget mapping and execute the graduation request.
  budget_mapping = client.resource.campaign_budget_mapping do |m|
    m.experiment_campaign = treatment_campaign_resource_name
    m.campaign_budget = budget_resource_name
  end

  client.service.experiment.graduate_experiment(
    experiment: experiment_resource_name,
    campaign_budget_mappings: [budget_mapping],
  )
  puts "Successfully graduated experiment campaign #{treatment_campaign_resource_name} " \
       "with new budget #{budget_resource_name}"
end

if __FILE__ == $0
  options = {}

  # Running the example with -h will print the command line usage.
  OptionParser.new do |opts|
    opts.banner = sprintf('Usage: %s [options]', File.basename(__FILE__))

    opts.separator ''
    opts.separator 'Options:'

    opts.on('-c', '--customer-id CUSTOMER-ID', String, 'Customer ID') do |v|
      options[:customer_id] = v
    end

    opts.on('-e', '--experiment-id EXPERIMENT-ID', String, 'Experiment ID') do |v|
      options[:experiment_id] = v
    end

    opts.separator ''
    opts.separator 'Help:'

    opts.on_tail('-h', '--help', 'Show this message') do
      puts opts
      exit
    end
  end.parse!

  begin
    evaluate_and_update_experiment(
      options.fetch(:customer_id).tr("-", ""),
      options.fetch(:experiment_id).tr("-", ""),
    )
  rescue Google::Ads::GoogleAds::Errors::GoogleAdsError => e
    e.failure.errors.each do |error|
      STDERR.printf("Error with message: %s\n", error.message)
      if error.location
        error.location.field_path_elements.each do |field_path_element|
          STDERR.printf("\tOn field: %s\n", field_path_element.field_name)
        end
      end
      error.error_code.to_h.each do |k, v|
        next if v == :UNSPECIFIED
        STDERR.printf("\tType: %s\n\tCode: %s\n", k, v)
      end
    end
    raise
  end
end
