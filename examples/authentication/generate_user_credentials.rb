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
# the Web application flow.
#
# This example will start a basic server that listens for requests at
# http://localhost:PORT, where PORT is the port specified below.

require 'googleauth'
require 'securerandom'
require 'uri'
require 'cgi'
require 'socket'

require 'json'

require 'optparse'

def generate_user_credential(path)
  json = JSON.load_file(path)
  creds, callback_uri, port = if !json["installed"].nil?
            [json["installed"], "http://#{SERVER}:#{PORT}", PORT]
          elsif !json["web"].nil?
            web_creds = json["web"]
            uri = json["web"]["redirect_uris"].first
            port = uri.split(":").last
            [web_creds, uri, port]
          else
            raise "No installed or web credentials found."
          end

  # Create an anti-forgery state token as described here:
  # https://developers.google.com/identity/protocols/OpenIDConnect#createxsrftoken
  state = SecureRandom.hex(16)

  client_id = Google::Auth::ClientId.new(
    creds["client_id"],
    creds["client_secret"],
  )

  # This example does not store credentials, so no TokenStore is needed.
  user_authorizer = Google::Auth::UserAuthorizer.new(
      client_id, SCOPE, nil, callback_uri)

  authorization_url = user_authorizer.get_authorization_url(state: state)
  printf("Paste this url in your browser:\n%s\n", authorization_url)
  printf("Waiting for authorization and callback...\n")
  printf("Listening at %s\n", callback_uri)
  response_params = get_authorization_code(port)

  # Confirm that the state in the response matches the state token used to
  # generate the authorization URL.
  unless state == response_params['state'][0]
    raise StandardError,
        'State returned from callback does not match the expected state'
  end

  user_credentials = user_authorizer.get_credentials_from_code(
      code: response_params['code'][0])
  printf("Your refresh token is: %s\n", user_credentials.refresh_token)

  printf("Copy your refresh token above into your google_ads_config.rb in your "\
      "home directory or use it when instantiating the library.\n")
end

def get_authorization_code(port)
  authorization_code = nil
  server = TCPServer.open(port)
  client = server.accept
  callback_request = client.readline
  # Use a regular expression to extract the request line from the first line of
  # the callback request, e.g.:
  #   GET /?code=AUTH_CODE&state=XYZ&scope=... HTTP/1.1
  matcher = /GET +([^ ]+)/.match(callback_request)
  response_params = CGI.parse(URI.parse(matcher[1]).query) unless matcher.nil?

  client.puts("HTTP/1.1 200 OK")
  client.puts("Content-Type: text/html")
  client.puts("")
  client.puts("<b>")
  if response_params['code'].nil?
    client.puts("Failed to retrieve authorization code.")
  else
    client.puts("Authorization code was successfully retrieved.")
  end
  client.puts("</b>")
  client.puts("<p>Please check the console output.</p>")
  client.close

  return response_params
end

if __FILE__ == $PROGRAM_NAME
  SCOPE = 'https://www.googleapis.com/auth/adwords'
  SERVER = '127.0.0.1'
  PORT = 8080

  # To fill in the values below, generate a client ID and client secret from the
  # Google Cloud Console (https://console.cloud.google.com) by creating
  # credentials for a Web application. Set the "Authorized redirect URIs" to:
  #   http://localhost:[PORT]

  options = {}
  # The following parameter(s) should be provided to run the example. You can
  # either specify these by changing the INSERT_XXX_ID_HERE values below, or on
  # the command line.
  #
  # Parameters passed on the command line will override any parameters set in
  # code.
  #
  # Running the example with -h will print the command line usage.
  options[:path] = 'INSERT_CLIENT_SECRETS_PATH_HERE'

  OptionParser.new do |opts|
    opts.banner = sprintf('Usage: %s [options]', File.basename(__FILE__))

    opts.separator ''
    opts.separator 'Options:'

    opts.on('-P', '--client-secrets-path CLIENT-SECRETS-PATH', String, 'Client Secrets Path') do |v|
      options[:path] = v
    end

    opts.separator ''
    opts.separator 'Help:'

    opts.on_tail('-h', '--help', 'Show this message') do
      puts opts
      exit
    end
  end.parse!

  generate_user_credential(
    options[:path],
  )
end
