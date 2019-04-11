require 'singleton'
module Google
  module Ads
    module GoogleAds
      DeprecationError = Class.new(StandardError)
      class DeprecationManager
        include Singleton

        def deprecated!(warning,  at_version, alternate=nil)
          caller_lines = caller[1..3].map { |x| " "*2 + x }.join("\n")
          if Google::Ads::GoogleAds::CLIENT_LIB_VERSION >= at_version || Google::Ads::GoogleAds::Config.treat_deprecations_as_errors
            dep = "#{warning} was removed in version #{at_version} and is no longer available"
            if alternate
              dep += " please consider using #{alternate} instead"
            end
            dep += "\nCalled from: \n" + caller_lines
            raise DeprecationError.new(dep)
          else
            dep = "#{warning} have been deprecated, and will be removed in version #{at_version}"
            if alternate
              dep += " please consider using #{alternate} instead"
            end
            dep += "\nCalled from: \n" + caller_lines

            Kernel.warn(dep)
          end
        end
      end
    end
  end
end
