#!/usr/bin/env ruby
# Encoding: utf-8
#
# Copyright 2018 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     https://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
# This example will create an OAuth2 refresh token for the Google Ads API using
# the Native/Installed application flow.
#
# This example is meant to be run from the command line and requires user input.

require 'googleauth'
require 'optparse'

def authenticate_in_standalone_application(client_id, client_secret)
  client_id = Google::Auth::ClientId.new(client_id, client_secret)

  # This example does not store credentials, so no TokenStore is needed.
  user_authorizer = Google::Auth::UserAuthorizer.new(
      client_id, SCOPE, nil, CALLBACK_URI)

  authorization_url = user_authorizer.get_authorization_url()
  printf("Paste this url in your browser:\n%s\n", authorization_url)

  printf("Type the code you received here: ")
  authorization_code = gets.chomp

  user_credentials =
      user_authorizer.get_credentials_from_code(code: authorization_code)
  printf("Your refresh token is: %s\n", user_credentials.refresh_token)

  printf("Copy your refresh token above into your googleads_config.rb in your "\
      "home directory or use it when instantiating the library.\n")
end

if __FILE__ == $PROGRAM_NAME
  CALLBACK_URI = 'urn:ietf:wg:oauth:2.0:oob'
  SCOPE = 'https://www.googleapis.com/auth/adwords'

  options = {}
  # The following parameter(s) should be provided to run the example. You can
  # either specify these by changing the INSERT_XXX_ID_HERE values below, or on
  # the command line.
  #
  # Parameters passed on the command line will override any parameters set in
  # code.
  #
  # Running the example with -h will print the command line usage.
  options[:client_id] = 'INSERT_CLIENT_ID_HERE'
  options[:client_secret] = 'INSERT_CLIENT_SECRET_HERE'

  OptionParser.new do |opts|
    opts.banner = sprintf('Usage: %s [options]', File.basename(__FILE__))

    opts.separator ''
    opts.separator 'Options:'

    opts.on('-I', '--client-id CLIENT-ID', String, 'Client ID') do |v|
      options[:client_id] = v
    end

    opts.on('-S', '--client-secret CLIENT-SECRET', String,
        'Client Secret') do |v|
      options[:client_secret] = v
    end

    opts.separator ''
    opts.separator 'Help:'

    opts.on_tail('-h', '--help', 'Show this message') do
      puts opts
      exit
    end
  end.parse!

  authenticate_in_standalone_application(options[:client_id],
      options[:client_secret])
end
