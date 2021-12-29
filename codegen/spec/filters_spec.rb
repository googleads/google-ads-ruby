require "spec_helper"
require "src/tracepoints"
require "src/filters"

RSpec.describe "#filter_resources_for_google_ads" do
  let(:resource) { double(:resource, msgclass: msgclass) }
  let(:path) { __FILE__ }

  context "a matching resource" do
    let(:msgclass) {
      double(:msgclass, name: "Google::Ads::GoogleAds::V1::MatchingResource")
    }

    it "keeps the message class" do
      expect(filter_resources_for_google_ads(:V1, [[resource, path]])).to eq(
        [[msgclass, path]]
      )
    end
  end

  context "an enum resource" do
    let(:msgclass) {
      double(:msgclass, name: "Google::Ads::GoogleAds::V1::ResourceEnum")
    }

    it "doesn't keep the message class" do
      expect(filter_resources_for_google_ads(:V1, [[resource, path]])).to eq([])
    end
  end

  context "a resource not in the google ads namespace" do
    let(:msgclass) {
      double(:msgclass, name: "Faraday::HttpClient")
    }

    it "doesn't keep the message class" do
      expect(filter_resources_for_google_ads(:V1, [[resource, path]])).to eq([])
    end
  end
end

RSpec.describe "#filter_enums_for_google_ads" do
  let(:enum_descriptor) { double(:enum_descriptor, enummodule: enum_module) }
  let(:path) { __FILE__ }

  context "a google ads enum" do
    let(:enum_module) {
      double(:enum_module, name: "Google::Ads::GoogleAds::V1::AnEnum")
    }

    it "keeps the enum module" do
      expect(filter_enums_for_google_ads(:V1, [[enum_descriptor, path]])).to eq(
        [[enum_module, path]]
      )
    end
  end

  context "a non google ads enum" do
    let(:enum_module) {
      double(:enum_module, name: "NOTAGOOGLEADSENUM")
    }

    it "doesn't keep the enum module" do
      expect(filter_enums_for_google_ads(:V1, [[enum_descriptor, path]])).to eq(
        []
      )
    end
  end
end

RSpec.describe "#filter_services_for_google_ads" do
  let(:service_class) { double(:service_class, name: name) }
  let(:path) { __FILE__ }

  let(:service) { TemplateService.new(service_class, path) }

  context "a google ads service" do
    let(:name) { "Google::Ads::GoogleAds::V1::BeesService::Client" }

    it "keeps the service class" do
      expect(filter_services_for_google_ads(:V1, [service])).to eq(
        [service]
      )
    end

    context "an operations client" do
      let(:name) { "Google::Ads::GoogleAds::V1::BeesService::Operations::Client" }

      it "doesn't keep the service class" do
        expect(filter_services_for_google_ads(:V1, [service])).to eq(
          []
        )
      end
    end
  end

  context "a non google ads service" do
    let(:name) { "RSpec::Core::ExampleGroup" }

    it "doesn't keep the service class" do
      expect(filter_services_for_google_ads(:V1, [service])).to eq(
        []
      )
    end
  end
end

RSpec.describe "#filter_resources_into_resources_and_operations" do
  let(:resource) { double(:resource, name: name) }
  let(:path) { __FILE__ }

  context "a request resource" do
    let(:name) { "FooRequest" }
    it "throws out the resource" do
      expect(
        filter_resources_into_resources_and_operations([[resource, path]])
      ).to eq([[], []])
    end
  end

  context "a response resource" do
    let(:name) { "FooResponse" }
    it "throws out the resource" do
      expect(
        filter_resources_into_resources_and_operations([[resource, path]])
      ).to eq([[], []])
    end
  end

  context "an operation" do
    let(:name) { "FooOperation" }
    it "filters in to the operations list" do
      expect(
        filter_resources_into_resources_and_operations([[resource, path]])
      ).to eq([[], [[resource, path]]])
    end
  end

  context "a resource" do
    let(:name) { "Foo" }

    it "filters in to the resources list" do
      expect(
        filter_resources_into_resources_and_operations([[resource, path]])
      ).to eq([[[resource, path]], []])
    end
  end
end

RSpec.describe "#cleanup_paths" do
  context "normal path" do
    let(:path) { "/Users/samphippen/dev/goog/google-ads-ruby/lib/google/ads/google_ads/v1/services/campaign_service_client.rb" }
    it "cleans up" do
      expect(cleanup_paths([
        [nil, path]
      ])).to eq([
        [nil, "google/ads/google_ads/v1/services/campaign_service_client.rb"]
      ])
    end
  end

  context "blaze path" do
    let(:path) { "/tmp/google-ads-ruby_zMomHhci2T/lib/google/ads/google_ads/v1/services/campaign_service_client.rb" }
    it "cleans up" do
      expect(cleanup_paths([
        [nil, path]
      ])).to eq([
        [nil, "google/ads/google_ads/v1/services/campaign_service_client.rb"]
      ])
    end
  end
end

RSpec.describe "#enhance_operations_with_classes" do
  let(:create_class) { spy(:create_class) }
  let(:update_class) { spy(:update_class) }
  let(:operation) {
    double(
      :operation,
      descriptor: [
        double(:create_class, name: "create", subtype: create_class),
        double(:update_class, name: "update", subtype: update_class),
      ]
    )
  }
  let(:path) { __FILE__ }

  it "correctly sets all the attributes" do
    op = enhance_operations_with_classes([[operation, path]]).first

    expect(op).to have_attributes(
      operation: operation,
      update_class: update_class,
      create_class: create_class,
      path: path,
    )
  end
end
