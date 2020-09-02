module Google
  module Ads
    module GoogleAds
      class Deprecation
        Error = Class.new(StandardError)
        def initialize(
          treat_deprecation_warnings_as_errors,
          warn_on_all_deprecations
        )
          @treat_deprecation_warnings_as_errors = treat_deprecation_warnings_as_errors
          @warn_on_all_deprecations = warn_on_all_deprecations
          @silenced_sites = {}
        end

        def deprecate(deprecation)
          return unless should_warn?
          if @treat_deprecation_warnings_as_errors
            raise Error, deprecation
          else
            Warning.warn("\n#{deprecation}. Called from: #{CallerFilter.first_non_google_ads_line}\n")
          end
        end

        private

        # Determines if we should issue a deprecation warning, silencing
        # on each user call site after the first warning.
        def should_warn?
          return true if @warn_on_all_deprecations

          if !@silenced_sites.include?(CallerFilter.first_non_google_ads_line)
            @silenced_sites[CallerFilter.first_non_google_ads_line] ||= true
            true
          else
            false
          end
        end
      end

      # @api private
      # Portions of this implementation were copied from RSpec, under the
      # MIT license: https://git.io/fjR7i
      class CallerFilter
        LIB_REGEX = /lib\/google\/ads\/google_ads/
        GRPC_REGEX = /lib\/(grpc|gapic)/
        STDLIB_REGEX = /lib\/ruby/
        IGNORE_REGEX = Regexp.union(
          LIB_REGEX,
          STDLIB_REGEX,
          GRPC_REGEX,
          "rubygems/core_ext/kernel_require.rb"
        )

        # This method finds the first line from the current stack trace that
        # doesn't originate from lib/google/ads/google_ads. It does this by
        # running backwards through the current stack trace in chunks. The
        # reason for this is that pulling the entire stack trace is O(n) on
        # the depth of the stack (which is in practice very expensive in Rails
        # applications, because rails ads a lot stack frames on to every
        # request).
        #
        # The chunking algorithm works by skipping a certain number of frames,
        # and then pulling a static number, consider a stack trace as folows,
        # where frame 17 is the one we're interested in, and we're actually,
        # thousands of frames deep.
        #                                          *
        # 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25
        #
        # the first iteration of this will skip frames 0-2 and pull frames
        # 3-7 (skip_frames = 3, increment = 5, 3 + 5 -1 = 7). Skipping is free,
        # and pulling chunks is O(n) on the size of the chunk.
        #
        #                                           *
        # 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25
        #       ^_______^
        #
        # if the relevant stack frame isn't found, skip is incremented, to
        # point at frame 8, and the increment is doubled, doubling the size
        # of the search window, causing it to point at frame 17
        #                                           *
        # 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25
        #                 ^________________________^
        #
        # here, we've performed 15 lookup operations to find the item we're
        # looking for, instead of 1000. The reason we use this chunk and doubling
        # strategy is that pulling stack frames has some fixed overhead, and so
        # in practice, doing a linear scan from frame 0 to the one we're interested
        # in is also slower than this methodology, even though the doubling
        # strategy may result in strictly more lookups thn necessary.
        def self.first_non_google_ads_line
          skip_frames = 3
          increment = 5
          loop do
            stack = caller_locations(skip_frames, increment)
            raise "No non-lib lines in stack" unless stack

            line = stack.find { |l| l.path !~ IGNORE_REGEX }
            return line.to_s if line

            skip_frames += increment
            increment   *= 2 # The choice of two here is arbitrary.
          end
        end
      end
    end
  end
end
