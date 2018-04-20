# Google Adwords API for Ruby

`google-ruby-adwords` uses [Google API extensions][google-gax] to provide an
easy-to-use client library for the [Google Adwords API][].

[google-gax]: https://github.com/googleapis/gax-ruby
[Google Adwords API]: https://developers.google.com/apis-explorer/#p/adwords/v0/

# Documentation for Users

## Getting started

google-ruby-adwords will allow you to connect to the [Google Adwords API][] and
access all its methods.

In order to achieve so you need to set up authentication as well as install the
library locally.

## Installation

Install this library using gem:

    $ [sudo] gem install google-ruby-adwords

Alternatively, if you prefer not to or can't use the hosted gem on RubyGems, you
can download the gem from the [Releases][] page and install it from the local
file:

    $ [sudo] gem install google-ruby-adwords-[version].gem

Or you can build it yourself from the source. After cloning the GitHub repo,
navigate to the `google-ruby-adwords` folder and run:

    $ [sudo] gem install bundler
    $ bundle install
    $ rake build
    $ gem install pkg/google-ruby-adwords-[version].gem

[Releases]: https://github.com/googleads/google-ruby-adwords/releases

## Setup Authentication

To authenticate your API calls, you need to specify your client ID, client
secret, and refresh token to the library in one of a few ways.

If you don't have a client ID or client secret yet, please see the
[Authorization guide][] to get those set up. Once you have those, the Ruby
library can help you use those to generate a refresh token.

See and run the [Authentication example][] to generate your refresh token.
Once this is generated, you can provide it to the library in a few different
ways.

The simplest is to copy the [adwords_config.rb][] to your home directory and
simply modify it to include the client ID, client secret, and refresh token.
The library will automatically read it from the home directory if instantiated
with no arguments:

    adwords = Google::Ads::Adwords::AdwordsClient.new

Alternatively, if you prefer to keep the file elsewhere, you can instantiate the
library by passing the path to where you keep this file:

    adwords = Google::Ads::Adwords::AdwordsClient.new('path/to/file.rb')

If you prefer not to store this information in a file at all, and would rather
pass the information programmatically at runtime, you can accomplish that this
way:

    adwords = Google::Ads::Adwords::AdwordsClient.new do |config|
      config.client_id = 'INSERT_CLIENT_ID_HERE'
      config.client_secret = 'INSERT_CLIENT_SECRET_HERE'
      config.reresh_token = 'INSERT_REFRESH_TOKEN_HERE'
    end

You can also modify these properties after instantiation by using the
`configure` method on the `AdwordsClient`, using the same structure as above.

[Authorization guide]: https://developers.google.com/adwords-new/guides/oauth
[Authentication example]: https://github.com/googleads/google-ruby-adwords/blob/master/examples/authentication/authenticate_in_standalone_application.rb
[adwords_config.rb]: https://github.com/googleads/google-ruby-adwords/blob/master/adwords_config.rb

## Usage

To include the gem in your code:

    require 'google/ads/adwords'

To fetch a specific service, for example ReportingService:

    adwords = Google::Ads::Adwords::AdwordsClient.new
    reporting_service = adwords.service(:Reporting)

See the provided [examples][] for more detailed demonstrations of how to use the
library.

[examples]: https://github.com/googleads/google-ruby-adwords/blob/master/examples

# Copyright/License Info

## License

Copyright 2017, Google Inc. All Rights Reserved.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at:

> [http://www.apache.org/licenses/LICENSE-2.0]()

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

## Authors

Author:

 - Danial Klimkin
 - Michael Cloonan

Maintainer:

 - Michael Cloonan
