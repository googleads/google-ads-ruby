# Google Ads Client Library for Ruby

`google-ads-googleads` uses [Google API extensions][google-gax] to provide an
easy-to-use client library for the [Google Ads API][].

[google-gax]: https://github.com/googleapis/gax-ruby
[Google Ads API]: https://developers.google.com/google-ads/api

# Documentation for Users

**For thorough documentation of all features and utilities, visit our
[Developers site Ruby guide][].**

[Developers site Ruby guide]: https://developers.google.com/google-ads/api/docs/client-libs/ruby/

## Getting started

`google-ads-googleads` will allow you to connect to the
[Google Ads API][] and access all its methods.

## Installation

The recommended way to install is using [bundler][].

Add a line to your `Gemfile`:

    gem "google-ads-googleads", "~> x.y.z"

Then run:

    $ bundle install
    
This will cause bundler to update your `Gemfile.lock` locking to the exact
version of the gem, and all dependencies of the gem that were installed.
Using the pessimistic version operator `"~> x.y.z"` will cause `bundle
update` to only install new versions in the `x.y.*` series, which will
make it so you must manually opt into new versions.

You can then update to a new version of the gem by updating the `Gemfile`.

### Other Installation Options

If you are not using bundler, you can use one of these options.

1. Install this library using gem:

       $ [sudo] gem install google-ads-googleads

1. Download the gem from the [Releases][] page and install it from the local
file:

       $ [sudo] gem install google-ads-googleads-[version].gem

[Releases]: https://github.com/googleads/google-ads-ruby/releases
[bundler]: https://bundler.io/

## Set Up Authentication

To authenticate your API calls, you need to specify your client ID, client
secret, refresh token, and developer token to the library.

1. See the [Developer token guide][] to obtain your developer token, if you
   don't already have one.

1. See the [Authorization guide][] to generate a client ID and client secret,
   if you don't already have them.

1. Run the [Authentication example][] to generate your refresh token.

1. Copy [google_ads_config.rb][] to your home directory and modify it to include
the client ID, client secret, and refresh token.

The client will automatically read it from the home directory if instantiated
with no arguments:

    client = Google::Ads::GoogleAds::GoogleAdsClient.new

Alternatively, if you prefer to keep the file elsewhere, you can instantiate the
client by passing the path to where you keep this file:

    client = Google::Ads::GoogleAds::GoogleAdsClient.new('path/to/google_ads_config.rb')

If you prefer not to store this information in a file at all, and would rather
pass the information programmatically at runtime, you can accomplish that this
way:

    client = Google::Ads::GoogleAds::GoogleAdsClient.new do |config|
      config.client_id = 'INSERT_CLIENT_ID_HERE'
      config.client_secret = 'INSERT_CLIENT_SECRET_HERE'
      config.refresh_token = 'INSERT_REFRESH_TOKEN_HERE'
      config.developer_token = 'INSERT_DEVELOPER_TOKEN_HERE'
    end

Find out more at the [Configuration guide][].

[Developer token guide]: https://developers.google.com/google-ads/api/docs/first-call/dev-token
[Authorization guide]: https://developers.google.com/google-ads/api/docs/oauth/overview
[Authentication example]: https://github.com/googleads/google-ads-ruby/blob/master/examples/authentication/authenticate_in_standalone_application.rb
[google_ads_config.rb]: https://github.com/googleads/google-ads-ruby/blob/master/google_ads_config.rb
[Configuration guide]: https://developers.google.com/google-ads/api/docs/client-libs/ruby/configuration

## Usage

To include the gem in your code:

    require 'google/ads/google_ads'

To fetch a specific service, for example CampaignService:

    client = Google::Ads::GoogleAds::GoogleAdsClient.new
    campaign_service = client.service(:Campaign)

See the provided [examples][] for more detailed demonstrations of how to use the
library.

[examples]: https://github.com/googleads/google-ads-ruby/blob/master/examples

## Logging

See the [Logging guide][].

[Logging guide]: https://developers.google.com/google-ads/api/docs/client-libs/ruby/logging

# Authors

Author:

 - Danial Klimkin
 - Michael Cloonan

Maintainer:

 - Michael Cloonan
 - Sam Phippen
