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
end
