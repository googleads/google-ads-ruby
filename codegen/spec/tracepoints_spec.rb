require "spec_helper"
require "tracepoints"
require "google/protobuf"

RSpec.describe "#with_tracepoints" do
  let(:potential_resources) { [] }
  let(:potential_services) { [] }
  let(:potential_enums) { [] }

  it "writes resources to the potential_resources array when they are looked up from a protobuf descriptor" do
    resource_name = "ExampleResource"
    expect {
      with_tracepoints(
        potential_resources: potential_resources,
        potential_services: potential_services,
        potential_enums: potential_enums,
      ) do
        build_proto_resource(resource_name)
      end
    }.to change { potential_resources }.from(be_empty).to([
      # Check we got the proto descriptor back that we expected
      [
        an_instance_of(Google::Protobuf::Descriptor).and(
          have_attributes(name: resource_name)
        ),
        __FILE__,
      ],
    ])
  end

  it "writes enums to the potential_enums array when they are looked up from an enum descriptor" do
    enum_name = "ExampleEnum"

    expect {
      with_tracepoints(
        potential_resources: potential_resources,
        potential_services: potential_services,
        potential_enums: potential_enums,
      ) do
        build_proto_enum(enum_name)
      end
    }.to change { potential_enums }.from(be_empty).to([
      # Check we got the proto descriptor back that we expected
      [
        an_instance_of(Google::Protobuf::EnumDescriptor).and(
          have_attributes(name: enum_name)
        ),
        __FILE__,
      ],
    ])
  end

  it "writes client classes to the potential_classes array when they are created" do
    allow_any_instance_of(TracePoint).to receive(:path).and_return("_client.rb")

    expect {
      with_tracepoints(
        potential_resources: potential_resources,
        potential_services: potential_services,
        potential_enums: potential_enums,
      ) do
        class FooClient
        end
      end
    }.to change { potential_services }.from(be_empty).to([
      [
        have_attributes(name: "FooClient").and(be_an_instance_of(Class)),
        "_client.rb",
      ],
    ])
  end

  def build_proto_resource(resource_name)
    Google::Protobuf::DescriptorPool.generated_pool.build do
      add_message resource_name do
      end
    end

    Google::Protobuf::DescriptorPool.generated_pool.lookup(resource_name)
  end

  def build_proto_enum(enum_name)
    Google::Protobuf::DescriptorPool.generated_pool.build do
      add_enum enum_name do
        value :UNSPECIFIED, 0
      end
    end

    Google::Protobuf::DescriptorPool.generated_pool.lookup(enum_name)
  end
end
