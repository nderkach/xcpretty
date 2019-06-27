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
require 'lib/xcpretty/reporters/reporter'
require 'lib/xcpretty/reporters/junit'
require 'lib/xcpretty/reporters/html'
require 'lib/xcpretty/reporters/json_compilation_database'

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

JSON_DB_FIXTURE_COMMAND_COUNT = 557

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

def html_report
  @html_report ||= REXML::Document.new(File.open(XCPretty::HTML::FILEPATH, 'r').read.sub("<!DOCTYPE html>", ""))
end

def html_report_body
  html_report.root.get_elements('//body').first
end

def html_test_suites
  parent = html_report_body.get_elements("//*[@id='test-suites']/").first
  parent.elements.to_a.select do |e|
    e.attributes['class']&.include?('test-suite')
  end
end

def json_db
  @json_db ||= JSON.parse(File.open(custom_report_path, 'r').read)
end

def junit_report
  REXML::Document.new(File.open(XCPretty::JUnit::FILEPATH, 'r').read)
end

def junit_report_root
  junit_report.root.elements.to_a.first
end

def custom_report
  @custom_report ||= File.open(XCPretty::Reporter::FILEPATH, 'r').read
end

def custom_report_path
  @custom_report_path ||= begin
    @custom_report_file1 = Tempfile.new('custom_report_path')
    @custom_report_file1.path
  end
end

def other_custom_report_path
  @other_custom_report_path ||= begin
    @custom_report_file2 = Tempfile.new('custom_report_path')
    @custom_report_file2.path
  end
end

def copy_file_to_screenshot_dir(screenshot_file)
  @screenshot_file_path = "#{XCPretty::HTML::SCREENSHOT_DIR}/#{screenshot_file}"
  FileUtils.cp("features/assets/#{screenshot_file}", @screenshot_file_path)
end

Before do
  self.colorize = true
end

After do
  @run_input  = ""
  @run_output = ""
  @custom_report_file1&.unlink
  @custom_report_file2&.unlink
  @html_report = nil
  @json_db = nil
  FileUtils.rm_rf(XCPretty::JUnit::FILEPATH)
  FileUtils.rm_rf(XCPretty::HTML::FILEPATH)
  FileUtils.rm_rf(XCPretty::JSONCompilationDatabase::FILEPATH)
  FileUtils.rm_rf(XCPretty::Reporter::FILEPATH)
  File.delete(@screenshot_file_path) if @screenshot_file_path
end
