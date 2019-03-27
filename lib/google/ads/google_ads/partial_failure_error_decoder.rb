module Google
  module Ads
    module GoogleAds
      class PartialFailureErrorDecoder
        # decodes a partial_failure_error (Google::Rpc::Status instance) to
        # an array of meaningful error protos
        #
        # Return an Array of protobuf objects, typed depending on what was
        # in the passed object (which will mostly be Google::Protobuf::Any,
        # so the types could be any valid protobuf type)
        def self.decode(partial_failure_error)
          partial_failure_error.details.select { |detail|
            Google::Protobuf::Any === detail
          }.map { |detail|
            type = Google::Protobuf::DescriptorPool.generated_pool.lookup(
              detail.type_name
            ).msgclass
            detail.unpack(type)
          }
        end
      end
    end
  end
end
