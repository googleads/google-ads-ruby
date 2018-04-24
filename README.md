# Google Ads Client Library for Ruby

`google-ads-googleads` uses [Google API extensions][google-gax] to provide an
easy-to-use client library for the [Google Ads API][].

[google-gax]: https://github.com/googleapis/gax-ruby
[Google Ads API]: https://developers.google.com/google-ads/api

# Documentation for Users

## Getting started

`google-ads-googleads` will allow you to connect to the
[Google Ads API][] and access all its methods.

In order to achieve so you need to set up authentication as well as install the
library locally.

## Installation

Install this library using gem:

    $ [sudo] gem install google-ads-googleads

Alternatively, if you prefer not to or can't use the hosted gem on RubyGems, you
can download the gem from the [Releases][] page and install it from the local
file:

    $ [sudo] gem install google-ads-googleads-[version].gem

Or you can build it yourself from the source. After cloning the GitHub repo,
navigate to the `google-ads-ruby` folder and run:

    $ rake build
    $ gem install pkg/google-ads-googleads-[version].gem

[Releases]: https://github.com/googleads/google-ads-ruby/releases

## Set Up Authentication

To authenticate your API calls, you need to specify your client ID, client
secret, refresh token, and developer token to the library in one of a few ways.

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

    adwords = Google::Ads::Googleads::GoogleadsClient.new

Alternatively, if you prefer to keep the file elsewhere, you can instantiate the
library by passing the path to where you keep this file:

    adwords = Google::Ads::Googleads::GoogleadsClient.new('path/to/file.rb')

If you prefer not to store this information in a file at all, and would rather
pass the information programmatically at runtime, you can accomplish that this
way:

    adwords = Google::Ads::Googleads::GoogleadsClient.new do |config|
      config.client_id = 'INSERT_CLIENT_ID_HERE'
      config.client_secret = 'INSERT_CLIENT_SECRET_HERE'
      config.refresh_token = 'INSERT_REFRESH_TOKEN_HERE'
      config.developer_token = 'INSERT_DEVELOPER_TOKEN_HERE'
    end

You can also modify these properties after instantiation by using the
`configure` method on the `AdwordsClient`, using the same structure as above.

[Authorization guide]: https://developers.google.com/google-ads/api/docs/oauth/overview
[Authentication example]: https://github.com/googleads/google-ads-ruby/blob/master/examples/authentication/authenticate_in_standalone_application.rb
[adwords_config.rb]: https://github.com/googleads/google-ads-ruby/blob/master/googleads_config.rb

## Usage

To include the gem in your code:

    require 'google/ads/googleads'

To fetch a specific service, for example CampaignService:

    adwords = Google::Ads::Googleads::GoogleadsClient.new
    campaign_service = adwords.service(:Campaign)

See the provided [examples][] for more detailed demonstrations of how to use the
library.

[examples]: https://github.com/googleads/google-ads-ruby/blob/master/examples

# Authors

Author:

 - Danial Klimkin
 - Michael Cloonan

Maintainer:

 - Michael Cloonan
