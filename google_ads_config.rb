# This is an example configuration file for the Google Ads API Ruby client
# library.
# Please fill in the required fields and copy it to your home directory.

Google::Ads::GoogleAds::Config.new do |c|
  # These fields are required to make any API call
  c.client_id = 'INSERT_CLIENT_ID_HERE'
  c.client_secret = 'INSERT_CLIENT_SECRET_HERE'
  c.refresh_token = 'INSERT_REFRESH_TOKEN_HERE'
  c.developer_token = 'INSERT_DEVELOPER_TOKEN_HERE'

  # These fields are required only in some circumstances
  # Required for manager accounts only: Specify the login customer ID used to
  # authenticate API calls. This will be the customer ID of the authenticated
  # manager account. If you need to use different values for this field, then
  # make sure fetch a new copy of the service after each time you change the
  # value.
  # c.login_customer_id = 'INSERT_LOGIN_CUSTOMER_ID_HERE'

  # Logging-related fields. If you want to specify your own custom logger, then
  # call client.logger = your_logger, which will override all these options and
  # use your custom logger instead, exactly as you configured it.

  # By default, only log warnings or errors. You can change this to 'INFO' to
  # log all requests and responses from the server.
  # Valid values are 'FATAL', 'ERROR', 'WARN', 'INFO', and 'DEBUG'
  c.log_level = 'WARN'

  # The location where you want the logs to be recorded. This will be passed
  # along to the logger.
  # You can provide a filename as a String, an IO object like STDOUT or STDERR,
  # or an open file.
  c.log_target = STDOUT

  # Instead of specifying logging through level and target, you can also
  # pass a logger directly (for e.g. passing Rails.logger in a
  # config/initializer). The passed logger will override log_level and
  # log_target
  # c.logger = Logger.new(STDOUT)
end
