require "spec_helper"
require "src/template_service"

RSpec.describe TemplateService do
  subject(:service) { TemplateService.new(gapic_client_class, path) }

  let(:gapic_client_class) {
    double(
      :klass,
      name: "Google::Ads::GoogleAds::V15::Services::GoogleAdsService::Client",
    )
  }

  let(:path) { "in the real world this would be a file path" }

  describe "#factory_method_name" do
    it "correctly drops _service_client" do
      expect(service.factory_method_name).not_to include("_service_client")
    end
  end

  describe "#rpc_request_type_for" do
    let(:input) { double(:input_klass) }

    before do
      # require returns true, so let's just stub it here
      allow(service).to receive(:require).with(path).and_return(true)
      stub_const(
        "Google::Ads::GoogleAds::V15::Services::GoogleAdsService::Service",
        double(
          :fake_service_klass,
          rpc_descs: {Search: double(input: input)}
        )
      )
    end

    it "finds the right rpc type" do
      expect(service.rpc_request_type_for(:search)).to eq(input)
    end
  end
end
