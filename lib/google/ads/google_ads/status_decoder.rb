require 'google/protobuf/well_known_types'

module Google
  module Ads
    module GoogleAds
      class StatusDecoder
        # decodes the details field from a Google::Rpc::Status instance to
        # an array of meaningful objects
        #
        # Return an Array of protobuf objects, typed depending on what was
        # in the passed object (which will mostly be Google::Protobuf::Any,
        # so the types could be any valid protobuf type)
        def self.decode(status)
          status.details.select { |detail|
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
