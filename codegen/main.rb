DIR = File.dirname(__FILE__)
GEM_ROOT = File.expand_path("..", DIR)
$: << DIR

require 'src/tracepoints'
require 'src/filters'
require 'src/rendering'

potential_resources = []
potential_enums = []
potential_services = []
with_tracepoints(
  potential_resources: potential_resources,
  potential_enums: potential_enums,
  potential_services: potential_services,
) do
  module Google
    module Ads
      module GoogleAds
        module V1
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
        end
      end
    end
  end

  # setup load path to include the directory with lib in it
  $: << GEM_ROOT

  Dir["#{GEM_ROOT}/lib/google/ads/google_ads/v1/resources/*.rb"].each do |fn|
    require fn.gsub("#{GEM_ROOT}/lib/", "")
  end

  Dir["#{GEM_ROOT}/lib/google/ads/google_ads/v1/services/*.rb"].each do |fn|
    require fn.gsub("#{GEM_ROOT}/lib/", "")
  end

  Dir["#{GEM_ROOT}/lib/google/ads/google_ads/v1/enums/*.rb"].each do |fn|
    require fn.gsub("#{GEM_ROOT}/lib/", "")
  end

  Dir["#{GEM_ROOT}/lib/google/ads/google_ads/v1/common/*.rb"].each do |fn|
    require fn.gsub("#{GEM_ROOT}/lib/", "")
  end

  Dir["#{GEM_ROOT}/lib/google/ads/google_ads/v1/errors/*.rb"].each do |fn|
    require fn.gsub("#{GEM_ROOT}/lib/", "")
  end
end
resources = filter_resources_for_google_ads(potential_resources)
resources, operations = filter_resources_in_to_resources_and_operations(resources)
enums = filter_enums_for_google_ads(potential_enums)
services = filter_services_for_google_ads(potential_services)

factories_dir = File.join(GEM_ROOT, "lib", "google", "ads", "google_ads", "factories")
`mkdir -p #{factories_dir}`
render_template(
  File.join(DIR, "templates", "resources.rb.erb"),
  File.join(factories_dir, "resources.rb"),
  {resources: resources}
)

render_template(
  File.join(DIR, "templates", "services.rb.erb"),
  File.join(factories_dir, "services.rb"),
  {services: services}
)
