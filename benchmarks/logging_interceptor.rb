require 'benchmark/ips'
require 'google/ads/google_ads'
require 'google/ads/google_ads/logging_interceptor'
require 'google/ads/google_ads/v1/services/media_file_service_services_pb'

def make_fake_call
  Class.new do
    def initialize
      @wrapped = Struct.new(:peer).new("peer")
    end
  end.new
end

def make_request
  Google::Ads::GoogleAds::V1::Services::MutateMediaFilesRequest.new(
    customer_id: "123123123",
    operations: [
      Google::Ads::GoogleAds::V1::Services::MediaFileOperation.new(
        create: Google::Ads::GoogleAds::V1::Resources::MediaFile.new(
          image: Google::Ads::GoogleAds::V1::Resources::MediaImage.new(
            data: Google::Protobuf::BytesValue.new(value: File.open("test/fixtures/sam.jpg", "rb").read)
          )
        )
      )
    ]
  )
end

sio = StringIO.new
logger = Logger.new(sio)
li_inspect = Google::Ads::GoogleAds::LoggingInterceptor.new(logger, :r_inspect)
li_r_threequal = Google::Ads::GoogleAds::LoggingInterceptor.new(logger, :r_threequal)
li_r_bytes_inspect = Google::Ads::GoogleAds::LoggingInterceptor.new(logger, :r_bytes_inspect)

request = make_request
call = make_fake_call

proto_we_dont_inspect = Google::Ads::GoogleAds::V1::Services::GetMediaFileRequest.new

Benchmark.ips do |x|
  # Configure the number of seconds used during
  # the warmup phase (default 2) and calculation phase (default 5)
  x.config(:time => 5, :warmup => 2)

  x.report("inspect patch - inspect") do
    li_inspect.request_response(
      request: request,
      call: call,
      method: :doesnt_matter
    ) do
    end
  end

  x.report("threequal patch - inspect") do
    li_r_threequal.request_response(
      request: request,
      call: call,
      method: :doesnt_matter
    ) do
    end
  end

  x.report("proto recursion - inspect") do
    li_r_bytes_inspect.request_response(
      request: request,
      call: call,
      method: :doesnt_matter
    ) do
    end
  end

  x.report("inspect patch - no inspect") do
    li_inspect.request_response(
      request: proto_we_dont_inspect,
      call: call,
      method: :doesnt_matter
    ) do
    end
  end

  x.report("threequal patch - no inspect") do
    li_r_threequal.request_response(
      request: proto_we_dont_inspect,
      call: call,
      method: :doesnt_matter
    ) do
    end
  end

  x.report("proto recursion - no inspect") do
    li_r_bytes_inspect.request_response(
      request: proto_we_dont_inspect,
      call: call,
      method: :doesnt_matter
    ) do
    end
  end
end
