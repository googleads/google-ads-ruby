35.1.0
-----
- Made grpc versioning more permissive.

35.0.0
-----
 - Compatibility with v21, v20.1, v19.2 of the API: https://developers.google.com/google-ads/api/docs/release-notes
 - Removed support for v18.
 - Updated examples to include the `containsEuPoliticalAdvertising` field on campaign creation.
 - Pinned grpc version 1.73.0. See [issue#524](https://github.com/googleads/google-ads-ruby/issues/524) for background. This is a temporary workaround that will be removed in the future.

34.2.0
-----
 - Added a minimum version for standard
 - Removed allocation_tracer
 - Updated gapic-common to 1.0.1

34.1.0
-----
 - Updated activesupport version to 7.1
 - Increased upper bound for google-protobuf and gapic-common dependencies

34.0.0
-----
 - Compatibility with v20 of the API: https://developers.google.com/google-ads/api/docs/release-notes
 - Removed support for v17.

33.1.0
-----
 - Improved the logging format to include more information and increase human readability.
 - Updated Ruby version in .gemspec file to require a minimum version of 3.0.0

33.0.0
------
 - Compatibility with v19.1 of the API: https://developers.google.com/google-ads/api/docs/release-notes

32.0.0
------
 - Compatibility with v19 of the API: https://developers.google.com/google-ads/api/docs/release-notes
 - Removed support for v16.

31.0.0
------
 - Compatibility with v18 of the API: https://developers.google.com/google-ads/api/docs/release-notes
 - Removed support for v15.

30.0.0
------
 - Compatibility with v17.1 of the API: https://developers.google.com/google-ads/api/docs/release-notes

29.0.0
------
 - Compatibility with v17 of the API: https://developers.google.com/google-ads/api/docs/release-notes

28.0.0
------
 - Compatibility with v16.1 of the API: https://developers.google.com/google-ads/api/docs/release-notes
 - Removed support for v14.

27.0.0
------
 - Compatibility with v16 of the API: https://developers.google.com/google-ads/api/docs/release-notes

26.0.0
------
 - Removed support for v13.

25.0.1
------
 - Updated dependencies to support new gRPC features

25.0.0
------
 - Compatibility with v15 of the API: https://developers.google.com/google-ads/api/docs/release-notes

24.0.0
------
 - Removed support for v12.

23.0.0
------
 - Compatibility with v14 of the API: https://developers.google.com/google-ads/api/docs/release-notes

22.1.0
------
- Compatibility with v13.1 of the API: https://developers.google.com/google-ads/api/docs/release-notes

22.0.0
------
- Removed support for v11.

21.0.0
------
 - Compatibility with v13 of the API: https://developers.google.com/google-ads/api/docs/release-notes
 - Removed support for v10.

20.0.0
------
 - Compatibility with v12 of the API: https://developers.google.com/google-ads/api/docs/release-notes

19.0.0
------
 - Removed support for v9.

18.1.0
------
 - Compatibility with v11.1 of the API: https://developers.google.com/google-ads/api/docs/release-notes

18.0.0
------
 - Compatibility with v11 of the API: https://developers.google.com/google-ads/api/docs/release-notes
 - Field mask util was updated to support empty top-level fields with
 subfields. For a full overview of the field mask util, see:
 https://developers.google.com/google-ads/api/docs/client-libs/ruby/field-masks

17.0.0
------
 - Compatibility with v10.1 of the API: https://developers.google.com/google-ads/api/docs/release-notes
 - Removed support for v8.

16.0.0
------
 - Compatibility with v10.0 of the API: https://developers.google.com/google-ads/api/docs/release-notes
 - Removed support for v7.

15.0.0
------
 - Compatibility with v9.0 of the API: https://developers.google.com/google-ads/api/docs/release-notes

14.0.0
------
 - Compatibility with v8.1 of the API: https://developers.google.com/google-ads/api/docs/release-notes
 - Removed support for v6.

13.0.0
------
 - Removed support for v5.

12.0.2
------
 - Fixed a missing type in path lookup util.

12.0.1
------
 - Fixed an issue in the gem factories files.

12.0.0
------
 - Compatibility with v8 of the API: https://developers.google.com/google-ads/api/docs/release-notes

11.0.0
------
 - Compatibility with v7 of the API: https://developers.google.com/google-ads/api/docs/release-notes
 - Removed support for v4.

10.0.0
------
 - Removing support for old-style positional arguments. If you were still
 using these, see this article for migration instructions:
 https://developers.google.com/google-ads/api/docs/client-libs/ruby/migration

9.0.0
-----
 - Compatibility with v6.1 of the API: https://developers.google.com/google-ads/api/docs/release-notes
 - Removed support for v3.

8.1.0
-----
 - Added support for loading configuration from environment variables in
	 addition to existing methods.
 - Added support for creating operations to support block syntax like we do
	 for resources.

8.0.0
-----
 - Compatibility with v6 of the API: https://developers.google.com/google-ads/api/docs/release-notes
 - Removed support for v2.

7.0.0
-----
 - Compatibility with v5 of the API: https://developers.google.com/google-ads/api/docs/release-notes
 - Updated internals of the client library to a new version of gapic. The
 change requires you to specify keyword arguments instead of positional
 arguments for all values passed for all service calls, including customer ID
 and operation. We have included a translator layer in our library that will
 patch existing calls, but will be deprecated in the future.
 For complete details, see:
 https://developers.google.com/google-ads/api/docs/client-libs/ruby/migration

6.0.0
-----
 - Compatability with v4 of the API: https://developers.google.com/google-ads/api/docs/release-notes

5.1.0
-----
 - Adding support for Google Ads API v3_1.

5.0.0
-----
 - Compatability with v3 of the API: https://developers.google.com/google-ads/api/docs/release-notes

4.0.0
-----
 - Change supported Ruby versions (>= 2.5)

3.2.0
-----
 - Adding support for Google Ads API v2_2.

3.1.0
-----
 - Adding support for Google Ads API v2_1.

3.0.1
-----
 - Add an insecure channel config flag

3.0.0
-----
 - Compatability with v2 of the API: https://developers.google.com/google-ads/api/docs/release-notes
 - Removed the symbol based lookup util, favoring a method based one:
   ```ruby
   # instead of
   client.service(:Campaign)
   client.resource(:Campaign)
   client.operation(:Campaign)
   # we now use
   client.service.campaign
   client.resource.campaign
   client.operation.campaign
   ```

   however, path method helpers still use a symbol based lookup:
   ```ruby
   client.path(:V1).campaign(...)
   client.path(:V2).campaign(...)
   ```

   see https://developers.google.com/google-ads/api/docs/client-libs/ruby/factories
   for full documentation
 - Moved default version of the API to v2, to continue using v1, apply
   the version number to your factories calls:
   ```ruby
   client.service.v1.campaign
   client.operation.v1.campaign
   ```

2.4.1
-----
  - Updated default inbound metadata size to allow for larger metadata
    server responses.

2.4.0
-----
  - Added config keys to support service accounts for authentication.
  - Added deprecation framework and deprecation warnings for old-style
    lookup util usage.
  - Updated default timeouts for all services to values that should
    result in fewer DEADLINE_EXCEEDED exceptions.

2.3.0
-----
  - Add autoboxing fields that set value wrappers from primitives

2.2.1
-----
  - Fix support for long running operations.

2.2.0
-----
  - Adding support for Google Ads API v1_3.

2.1.1
-----
  - Fix "factories" implementation for Google's build system.

2.1.0
-----
  - Add "factories" impelmentation

2.0.0
-----
  - Adding support for Google Ads API v1_2.
  - Removing support for Google Ads API v0.

1.1.1
-----
  - Add `ExtensionFeedItem` as an operation look up
  - Fixes various broken resource types

1.1.0
-----
  - Adding support for Google Ads API v1_1.
  - Refactored proto and path lookup utils to be accessible before client
    instantiation.
  - Numerous fixes to logging, including support for logging large images and
    partial failure errors.
  - New partial failure decoder utility.

1.0.0
-----
  - Adding support for Google Ads API v1.
  - Adding support for versioned path and proto lookup utils.
  - Fix to logging interceptor for customer service requests.

0.8.0
-----
  - Adding support for Google Ads API v0_7.

0.7.1
-----
  - Adding support for logging requests/responses.

0.7.0
-----
  - Adding support for Google Ads API v0_6.
  - Adding configuration file support for login_customer_id.

0.6.0
-----
  - Adding support for Google Ads API v0_5.

0.5.0
-----
  - Adding support for Google Ads API v0_4.
  - The namespace Googleads, with the path pattern "googleads", has changed to
    GoogleAds, with the path "google_ads".  The gem name is unchanged.
  - The GoogleAdsClient has been renamed.
  - The default config file has been renamed as "google_ads_config.rb".

0.4.0
-----
  - Adding support for Google Ads API v0_3.

0.3.0
-----
  - Adding support for Google Ads API v0_2.
  - Bumping dependency for google-gax to 1.3 to match generated service clients.

0.2.0
-----
  - Adding support for Google Ads API v0_1.

0.1.0
-----
  - Initial release with support for Google Ads API v0.
