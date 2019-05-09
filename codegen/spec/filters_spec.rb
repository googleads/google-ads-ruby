require "spec_helper"
require "filters"

RSpec.describe "#filter_resources_for_google_ads" do
  let(:resource) { double(:resource, msgclass: msgclass) }
  let(:path) { __FILE__ }

  context "a matching resource" do
    let(:msgclass) {
      double(:msgclass, name: "Google::Ads::GoogleAds::V1::MatchingResource")
    }

    it "keeps the message class" do
      expect(filter_resources_for_google_ads([[resource, path]])).to eq(
        [[msgclass, path]]
      )
    end
  end

  context "an enum resource" do
    let(:msgclass) {
      double(:msgclass, name: "Google::Ads::GoogleAds::V1::ResourceEnum")
    }

    it "doesn't keep the message class" do
      expect(filter_resources_for_google_ads([[resource, path]])).to eq([])
    end
  end

  context "a resource not in the google ads namespace" do
    let(:msgclass) {
      double(:msgclass, name: "Faraday::HttpClient")
    }

    it "doesn't keep the message class" do
      expect(filter_resources_for_google_ads([[resource, path]])).to eq([])
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
      expect(filter_enums_for_google_ads([[enum_descriptor, path]])).to eq(
        [[enum_module, path]]
      )
    end
  end

  context "a non google ads enum" do
    let(:enum_module) {
      double(:enum_module, name: "NOTAGOOGLEADSENUM")
    }

    it "doesn't keep the enum module" do
      expect(filter_enums_for_google_ads([[enum_descriptor, path]])).to eq(
        []
      )
    end
  end
end

RSpec.describe "#filter_services_for_google_ads" do
  let(:service_class) { double(:service_class, name: name) }
  let(:path) { __FILE__ }

  context "a google ads service" do
    let(:name) { "Google::Ads::GoogleAds::V1::BeesService" }

    it "keeps the service class" do
      expect(filter_services_for_google_ads([[service_class, path]])).to eq(
        [[service_class, path]]
      )
    end
  end

  context "a non google ads service" do
    let(:name) { "RSpec::Core::ExampleGroup" }

    it "doesn't keep the service class" do
      expect(filter_services_for_google_ads([[service_class, path]])).to eq(
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
