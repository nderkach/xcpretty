# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path('../..', __dir__)

require 'tempfile'
require 'spec/fixtures/constants'
require 'spec/support/matchers/colors'
require 'lib/xcpretty/ansi'
require 'lib/xcpretty/version'
require 'lib/xcpretty/syntax'
require 'rexml/document'
require 'lib/xcpretty/formatters/formatter'

begin
  require 'json'
rescue LoadError
  require 'vendor/json_pure/parser'
end

# rubocop:disable Style/MixinUsage
include XCPretty::ANSI
# rubocop:enable Style/MixinUsage

TEST_RUN_START_MATCHER = /Test Suite .+ started/.freeze
TEST_SUITE_COMPLETION_MATCHER = /Executed \d+ tests, with \d+ failures \(\d+ unexpected\) in \d+\.\d+ \(\d+\.\d+\) seconds/.freeze
TEST_SUITE_START_MATCHER = /[\w]*(Spec|Tests)$/.freeze
TEST_PATH_MATCHER = %r{[\w/\-\s]+:\d+}.freeze
PASSING_TEST_NAME_MATCHER = %r{\w+\s\(\d+\.\d+\sseconds\)}.freeze
PENDING_TEST_NAME_MATCHER = %r{\w+\s\[PENDING\]}.freeze
FAILING_TEST_NAME_MATCHER = %r{\w+, expected:}.freeze
MEASURING_TEST_NAME_MATCHER = %r{\w+\smeasured\s\(\d+\.\d+\sseconds\)}.freeze

def run_xcpretty(flags)
  input_file = Tempfile.new('xcpretty_input')
  File.open(input_file.path, 'w') do |file|
    file.print run_input
  end
  @run_output = %x(cat '#{input_file.path}' | bin/xcpretty #{flags})
  input_file.unlink
end

def add_run_input(text)
  run_input << "\n#{text}"
end

def run_input
  @run_input ||= +''
end

def run_output
  @run_output ||= ''
end

Before do
  self.colorize = true
end

After do
  @run_input  = ""
  @run_output = ""
end
