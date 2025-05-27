# Copyright 2023 Google LLC
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

require 'minitest/autorun'
require 'stringio'
require_relative '../argument_parser' # Adjust path as necessary

class TestArgumentParser < Minitest::Test
  def setup
    # Common setup for tests if needed
    @original_stdout = $stdout
    $stdout = StringIO.new # Capture puts for help messages
  end

  def teardown
    $stdout = @original_stdout
  end

  def test_parse_arguments_customer_id_only
    args = ['-c', '1234567890']
    options = ArgumentParser.parse_arguments(args)
    assert_equal '1234567890', options[:customer_id]
  end

  def test_parse_arguments_customer_id_with_hyphens
    args = ['-c', '123-456-7890']
    options = ArgumentParser.parse_arguments(args)
    assert_equal '1234567890', options[:customer_id]
  end

  def test_parse_arguments_manager_customer_id
    args = ['-m', '098-765-4321']
    options = ArgumentParser.parse_arguments(args)
    assert_equal '0987654321', options[:manager_customer_id]
  end

  def test_parse_arguments_email_address
    args = ['-e', 'test@example.com']
    options = ArgumentParser.parse_arguments(args)
    assert_equal 'test@example.com', options[:email_address]
  end

  def test_parse_arguments_access_role
    args = ['-a', 'ADMIN']
    options = ArgumentParser.parse_arguments(args)
    assert_equal 'ADMIN', options[:access_role]
  end

  def test_parse_arguments_start_date
    args = ['--start-date', '20230101']
    options = ArgumentParser.parse_arguments(args)
    assert_equal '20230101', options[:start_date]
  end

  def test_parse_arguments_end_date
    args = ['--end-date', '20231231']
    options = ArgumentParser.parse_arguments(args)
    assert_equal '20231231', options[:end_date]
  end

  def test_parse_arguments_all_options
    args = [
      '-c', '111-222-3333',
      '-m', '444-555-6666',
      '-e', 'user@example.com',
      '-a', 'STANDARD',
      '--start-date', '20230115',
      '--end-date', '20230215'
    ]
    options = ArgumentParser.parse_arguments(args)
    assert_equal '1112223333', options[:customer_id]
    assert_equal '4445556666', options[:manager_customer_id]
    assert_equal 'user@example.com', options[:email_address]
    assert_equal 'STANDARD', options[:access_role]
    assert_equal '20230115', options[:start_date]
    assert_equal '20230215', options[:end_date]
  end

  def test_parse_arguments_help_short
    # Mock exit and puts to test help output
    mock_exit_called = false
    ArgumentParser.define_singleton_method(:exit) { |_code| mock_exit_called = true; throw :exit_called }

    # Suppress puts from OptionParser to $stdout for this test
    original_stdout = $stdout
    $stdout = StringIO.new

    catch(:exit_called) do
      ArgumentParser.parse_arguments(['-h'])
    end
    
    $stdout = original_stdout # Restore stdout

    assert mock_exit_called, "Exit should have been called for -h"
    # We can't easily check the content of OptionParser's default help message here
    # without more complex mocking of OptionParser itself.
    # The main thing is that it attempts to exit.
  end

  def test_parse_arguments_help_long
    mock_exit_called = false
    ArgumentParser.define_singleton_method(:exit) { |_code| mock_exit_called = true; throw :exit_called }
    original_stdout = $stdout
    $stdout = StringIO.new
    
    catch(:exit_called) do
      ArgumentParser.parse_arguments(['--help'])
    end

    $stdout = original_stdout
    assert mock_exit_called, "Exit should have been called for --help"
  end

  def test_access_role_enum_constant
    expected_roles = {
      ADMIN: :ADMIN,
      BILLING: :BILLING,
      EMAIL_ONLY: :EMAIL_ONLY,
      READ_ONLY: :READ_ONLY,
      STANDARD: :STANDARD,
    }
    assert_equal expected_roles, ArgumentParser::ACCESS_ROLE_ENUM
    assert ArgumentParser::ACCESS_ROLE_ENUM.frozen?, "ACCESS_ROLE_ENUM should be frozen"
  end

  # Note: The ArgumentParser itself doesn't enforce required arguments or validate
  # access roles; that logic is in the individual scripts.
  # So, we don't test "Invalid or missing required arguments" or "Invalid access_role values"
  # directly in the parser's tests, as it's designed to be flexible.
  # The parser's job is just to parse what's given based on its defined options.
end
