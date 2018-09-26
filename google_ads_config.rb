# This is an example configuration file for the Google Ads API Ruby client
# library.
# Please fill in the required fields and copy it to your home directory.

Google::Ads::GoogleAds::Config.new do |c|
  c.client_id = 'INSERT_CLIENT_ID_HERE'
  c.client_secret = 'INSERT_CLIENT_SECRET_HERE'
  c.refresh_token = 'INSERT_REFRESH_TOKEN_HERE'
  c.developer_token = 'INSERT_DEVELOPER_TOKEN_HERE'
end
