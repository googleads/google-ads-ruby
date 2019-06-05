# This is an example configuration file for the Google Ads API Ruby client
# library.
# Copy it to your home directory and fill in all the required values.

Google::Ads::GoogleAds::Config.new do |c|
  # The developer token is required to authenticate that you are allowed to
  # make API calls.
  c.developer_token = 'INSERT_DEVELOPER_TOKEN_HERE'

  # Authentication tells the API that you are allowed to make changes to the
  # specific account you're trying to access.
  # The default method of authentication is to use a refresh token, client id,
  # and client secret to generate an access token.
  c.client_id = 'INSERT_CLIENT_ID_HERE'
  c.client_secret = 'INSERT_CLIENT_SECRET_HERE'
  c.refresh_token = 'INSERT_REFRESH_TOKEN_HERE'

  # You can also authenticate using a service account. If "keyfile" is
  # specified below, then service account authentication will be assumed and
  # the above authentication fields ignored. Read more about service account
  # authentication here:
  # https://developers.google.com/google-ads/api/docs/oauth/service-accounts
  # c.keyfile = 'path/to/keyfile.json'
  # c.impersonate = 'INSERT_EMAIL_ADDRESS_TO_IMPERSONATE_HERE'

  # Alternatively, you may specify your own custom authentication, which can be:
  # A `Google::Auth::Credentials` uses a the properties of its represented
  # keyfile for authenticating requests made by this client.
  # A `String` will be treated as the path to the keyfile to be used for the
  # construction of credentials for this client.
  # A `Hash` will be treated as the contents of a keyfile to be used for the
  # construction of credentials for this client.
  # A `GRPC::Core::Channel` will be used to make calls through.
  # A `GRPC::Core::ChannelCredentials` for the setting up the RPC client. The
  # channel credentials should already be composed with a
  # `GRPC::Core::CallCredentials` object.
  # A `Proc` will be used as an updater_proc for the Grpc channel. The proc
  # transforms the metadata for requests, generally, to give OAuth credentials.
  # To use one of these methods, uncomment the following line and add some code
  # to look up one of the authentication methods listed above. If set, the
  # authentication field will override the client_id, client_secret, and
  # refresh_token fields above.
  # c.authentication = INSERT_AUTHENTICATION_METHOD_HERE

  # Required for manager accounts only: Specify the login customer ID used to
  # authenticate API calls. This will be the customer ID of the authenticated
  # manager account. If you need to use different values for this field, then
  # make sure fetch a new copy of the service after each time you change the
  # value.
  # c.login_customer_id = 'INSERT_LOGIN_CUSTOMER_ID_HERE'

  # Logging-related fields. You may also specify a logger after instantiation
  # by using client.logger=.

  # By default, only log warnings or errors. You can change this to 'INFO' to
  # log all requests and responses from the server.
  # Valid values are 'FATAL', 'ERROR', 'WARN', 'INFO', and 'DEBUG'
  c.log_level = 'WARN'

  # The location where you want the logs to be recorded. This will be passed
  # along to the logger.
  # You can provide a filename as a String, an IO object like STDOUT or STDERR,
  # or an open file.
  c.log_target = STDOUT

  # Instead of specifying logging through level and target, you can also pass a
  # logger directly (e.g. passing Rails.logger in a config/initializer). The
  # passed logger will override log_level and log_target.
  # c.logger = Logger.new(STDOUT)
end
