# frozen_string_literal: true

require "xcpretty/printer"
require 'xcpretty/formatters/formatter'
require 'xcpretty/formatters/simple'

module XCPretty
  describe Printer do

    before(:each) do
      allow(STDOUT).to receive(:print) { |text| text }

      @printer = Printer.new(colorize: true, unicode: true, formatter: DummyFormatter)
    end

    it "prints to stdout" do
      expect(STDOUT).to receive(:print).with("hey ho let's go\n")
      @printer.pretty_print("hey ho let's go")
    end

    it "doesn't print empty lines" do
      expect(STDOUT).not_to receive(:print)
      @printer.pretty_print("")
    end

    it "prints with newlines only when needed" do
      @printer.formatter.optional_newline = ""

      expect(STDOUT).to receive(:print).with("hey ho let's go")
      @printer.pretty_print("hey ho let's go")
    end

    it "makes a formatter with unicode and colorized flags" do
      expect(@printer.formatter.colorize?).to be_truthy
      expect(@printer.formatter.use_unicode?).to be_truthy
    end

  end
end

module XCPretty
  class DummyFormatter < Formatter

    def initialize(unicode, colorize)
      @use_unicode = unicode
      @colorize = colorize
      @newline = "\n"
    end

    def pretty_format(text)
      text
    end

    def optional_newline
      @newline
    end

    def optional_newline=(newline)
      @newline = newline
    end
  end
end
