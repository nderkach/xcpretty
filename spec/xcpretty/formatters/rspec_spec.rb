# frozen_string_literal: true

require "spec_helper"
require "xcpretty"
require "xcpretty/formatters/rspec"

module XCPretty

  describe RSpec do

    before(:each) do
      @formatter = RSpec.new(false, false)
    end

    it "prints dots in the same line" do
      expect(@formatter.optional_newline).to eq("")
    end

    context "without colors" do

      it "prints dots for passing tests" do
        expect(@formatter.format_passing_test("sweez testz", "sample spec", "0.002")).to eq(".")
      end

      it "prints P for pending tests" do
        expect(@formatter.format_pending_test("sweez testz", "sample spec")).to eq("P")
      end

      it "prints F for failing tests" do
        expect(@formatter.format_failing_test(
          "///file", "NSNumber Specs", "adding numbers", "should add 2 numbers"
        )).to eq("F")
      end
    end

    context "with colors" do

      before { @formatter.colorize = true }

      it "prints green for passing tests" do
        expect(@formatter.format_passing_test("sweez testz", "sample spec", "0.002")).to be_colored :green
      end

      it "prints yellow for pending tests" do
        expect(@formatter.format_pending_test("sweez testz", "sample spec")).to be_colored :yellow
      end

      it "prints red for failing tests" do
        expect(@formatter.format_failing_test(
          "///file", "NSNumber Specs", "adding numbers", "should add 2 numbers"
        )).to be_colored :red
      end
    end
  end
end
