# -*- ruby -*-
# encoding: utf-8
#
# Copyright:: Copyright 2017, Google Inc. All Rights Reserved.
#
# License:: Licensed under the Apache License, Version 2.0 (the "License");
#           you may not use this file except in compliance with the License.
#           You may obtain a copy of the License at
#
#           http://www.apache.org/licenses/LICENSE-2.0
#
#           Unless required by applicable law or agreed to in writing, software
#           distributed under the License is distributed on an "AS IS" BASIS,
#           WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or
#           implied.
#           See the License for the specific language governing permissions and
#           limitations under the License.

require_relative 'lib/google/ads/google_ads/version.rb'

Gem::Specification.new do |s|
  s.name          = 'google-ads-googleads'
  s.version       = Google::Ads::GoogleAds::CLIENT_LIB_VERSION
  s.authors       = ['Google Inc']
  s.description   = '%s is a Google Ads API client library for Ruby' % s.name
  s.email         = ['adwordsapiadvisor+michael@google.com']
  s.files = Dir.glob(File.join('lib', '**', '*.rb')) +
      Dir.glob(File.join('lib', '**', '*.json')) +
      %w(Rakefile README.md ChangeLog google_ads_config.rb THIRD-PARTY-LICENCES.txt)
  s.homepage = 'https://github.com/googleads/google-ads-ruby'
  s.license = 'Apache-2.0'
  s.platform = Gem::Platform::RUBY
  s.require_paths = ['lib']
  s.required_ruby_version = '>= 2.5.0'
  s.summary = 'Google client library for the Google Ads API'

  s.add_dependency 'gapic-common', '~> 0.6.0'
  s.add_dependency 'google-protobuf', ['>= 3.19.4', '< 4.0']

  s.add_development_dependency 'bundler', ["> 1.9", "< 3"]
  s.add_development_dependency 'rake', '~> 13.0'

  s.add_development_dependency 'minitest', '~> 5.10'
end
