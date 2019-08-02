# frozen_string_literal: true

require 'xcpretty/snippet'

module XCPretty

  describe Snippet do

    it "gets the snippet out of the file path" do
      path = File.expand_path('spec/fixtures/NSStringTests.m:36')
      expect(Snippet.from_filepath(path).contents).to eq(
<<-HEREDOC
    it(@"-split: splits with delimiter string, not just a char", ^{
        [[[@"one / two / three" split:@" / "] should] equal:@[@"one", @"two", @"three"]];
    });
HEREDOC
      )
    end

    it 'saves the file path' do
      path = File.expand_path('spec/fixtures/NSStringTests.m:36')
      expect(Snippet.from_filepath(path).file_path).to eq(path)
    end

    it "doesn't crash when there's nothing to read" do
      path = File.expand_path('spec/fixtures/NSStringTests.m:64')
      expect(Snippet.from_filepath(path).contents).to eq("\nSPEC_END\n")
    end

    it "doesn't crash if file path is invalid" do
      path = 'invalid-path'
      expect(Snippet.from_filepath(path).contents).to eq('')
    end

    it "doesn't crash if a failure is on the first line" do
      path = File.expand_path('spec/fixtures/NSStringTests.m:0')
      expect(Snippet.from_filepath(path).contents)
          .to eq("//\n//  NSStringTests.m\n//  SampleProject\n")
    end

    it "doesn't crash if the file has only 1 line" do
      path = File.expand_path('spec/fixtures/oneliner.m:0')
      expect(Snippet.from_filepath(path).contents).to eq("[[[@1 should] equal] @3];\n")
    end

  end
end
