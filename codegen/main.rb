DIR = File.dirname(__FILE__)
GEM_ROOT = File.expand_path("..", DIR)
$: << DIR

require 'src/tracepoints'
require 'src/filters'
require 'src/rendering'

require 'google/ads/google_ads/api_versions'

module Google
  module Ads
    module GoogleAds
    end
  end
end
Google::Ads::GoogleAds::KNOWN_API_VERSIONS.each do |version|
  Google::Ads::GoogleAds.const_set("#{version.to_s.upcase}", Module.new do
    module Common
    end
    module Enums
    end
    module Errors
    end
    module Resources
    end
    module Services
    end
  end)

  potential_resources = []
  potential_enums = []
  potential_services = []
  with_tracepoints(
    potential_resources: potential_resources,
    potential_enums: potential_enums,
    potential_services: potential_services,
  ) do

    # setup load path to include the directory with lib in it
    $: << GEM_ROOT

    Dir["#{GEM_ROOT}/lib/google/ads/google_ads/#{version.to_s.downcase}/resources/*.rb"].each do |fn|
      require fn.gsub("#{GEM_ROOT}/lib/", "")
    end

    Dir["#{GEM_ROOT}/lib/google/ads/google_ads/#{version.to_s.downcase}/services/*.rb"].each do |fn|
      require fn.gsub("#{GEM_ROOT}/lib/", "")
    end

    Dir["#{GEM_ROOT}/lib/google/ads/google_ads/#{version.to_s.downcase}/enums/*.rb"].each do |fn|
      require fn.gsub("#{GEM_ROOT}/lib/", "")
    end

    Dir["#{GEM_ROOT}/lib/google/ads/google_ads/#{version.to_s.downcase}/common/*.rb"].each do |fn|
      require fn.gsub("#{GEM_ROOT}/lib/", "")
    end

    Dir["#{GEM_ROOT}/lib/google/ads/google_ads/#{version.to_s.downcase}/errors/*.rb"].each do |fn|
      require fn.gsub("#{GEM_ROOT}/lib/", "")
    end
  end

  resources = filter_resources_for_google_ads(version, potential_resources)
  resources = cleanup_paths(resources, :RESOURCE)
  resources, operations = filter_resources_into_resources_and_operations(resources)
  resources = deduplicate_resources(resources)

  enums = filter_enums_for_google_ads(version, potential_enums)
  enums = cleanup_paths(enums, :ENUM)

  services = filter_services_for_google_ads(version, potential_services)

  operations = enhance_operations_with_classes(operations)

  factories_dir = File.join(GEM_ROOT, "lib", "google", "ads", "google_ads", "factories", version.to_s.downcase)
  `mkdir -p #{factories_dir}`
  render_template(
    File.join(DIR, "templates", "resources.rb.erb"),
    File.join(factories_dir, "resources.rb"),
    {resources: resources, version: version}
  )

  render_template(
    File.join(DIR, "templates", "services.rb.erb"),
    File.join(factories_dir, "services.rb"),
    {services: services, version: version}
  )

  render_template(
    File.join(DIR, "templates", "enums.rb.erb"),
    File.join(factories_dir, "enums.rb"),
    {enums: enums, version: version}
  )

  render_template(
    File.join(DIR, "templates", "operations.rb.erb"),
    File.join(factories_dir, "operations.rb"),
    {operations: operations, version: version}
   )
end

gads_dir = File.join(GEM_ROOT, "lib", "google", "ads", "google_ads")
render_template(
    File.join(DIR, "templates", "factories.rb.erb"),
    File.join(gads_dir, "factories.rb"),
    {versions: Google::Ads::GoogleAds::KNOWN_API_VERSIONS}
)
