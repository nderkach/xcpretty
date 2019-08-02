# frozen_string_literal: true

require 'xcpretty/syntax'

module XCPretty
  describe Syntax do
    it 'syntax highlights given code' do
      code = 'self.color = [UIColor redColor];'
      snippet = Snippet.new(code, 'test.m')
      output = Syntax.highlight(snippet)

      stripped_output = output.gsub(/(?:(?:\u001b\[)|\u009b)(?:(?:[0-9]{1,3})?(?:;[0-9]{0,3})*?[A-M|f-m])|\u001b[A-M]/, '')
      expect(stripped_output).to eq(code)
    end

    it 'uses Objective-C lexer for Objective-C' do
      expect(Syntax.find_lexer('test.m', '')).to eq(Rouge::Lexers::ObjectiveC)
      expect(Syntax.find_lexer('test.h', '')).to eq(Rouge::Lexers::ObjectiveC)
    end

    it 'uses Swift lexer for Swift' do
      expect(Syntax.find_lexer('test.swift', '')).to eq(Rouge::Lexers::Swift)
    end

    it 'uses Ruby lexer for Ruby' do
      expect(Syntax.find_lexer('test.rb', '')).to eq(Rouge::Lexers::Ruby)
      expect(Syntax.find_lexer('test.ruby', '')).to eq(Rouge::Lexers::Ruby)
    end

    it 'uses C++ lexer for C++' do
      expect(Syntax.find_lexer('test.cpp', '')).to eq(Rouge::Lexers::Cpp)
      expect(Syntax.find_lexer('test.cc', '')).to eq(Rouge::Lexers::Cpp)
      expect(Syntax.find_lexer('test.c++', '')).to eq(Rouge::Lexers::Cpp)
      expect(Syntax.find_lexer('test.cxx', '')).to eq(Rouge::Lexers::Cpp)
      expect(Syntax.find_lexer('test.hpp', '')).to eq(Rouge::Lexers::Cpp)
      expect(Syntax.find_lexer('test.h++', '')).to eq(Rouge::Lexers::Cpp)
      expect(Syntax.find_lexer('test.hxx', '')).to eq(Rouge::Lexers::Cpp)
    end
  end
end
