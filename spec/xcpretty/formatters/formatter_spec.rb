# frozen_string_literal: true

require 'xcpretty'
require 'fixtures/constants'

module XCPretty

  describe Formatter do

    before(:each) do
      @formatter = Formatter.new(true, true)
    end

    it "initializes with unicode" do
      expect(@formatter.use_unicode?).to be true
    end

    it "initializes with color" do
      expect(@formatter.colorize?).to be true
    end

    it "outputs to new lines by default" do
      expect(@formatter.optional_newline).to eq("\n")
    end

    it "formats cocoapods errors" do
      expect(@formatter.format_error("The sandbox is not in sync..."))
        .to eq("\n#{@formatter.red("❌  The sandbox is not in sync...")}\n\n")
    end

    it "formats compiling errors" do
      expect(@formatter.format_compile_error("file", "path/to/file", "expected valid syntax",
                                      "[a should",
                                      "         ^")).to eq(
%Q(
#{@formatter.red('❌  ')}path/to/file: #{@formatter.red("expected valid syntax")}

[a should
#{@formatter.cyan("         ^")}

))
    end

    it "formats file missing errors" do
      expect(@formatter.format_file_missing_error("error: no such file or directory:",
                                                  "/path/to/file.swift")).to eq(
        "\n#{@formatter.red(
          '❌  error: no such file or directory:'
        )} /path/to/file.swift\n\n")
    end

    it "formats compiling warnings" do
      reason = "format specifies type 'id' but the argument has type 'int' [-Wformat]"

      expect(@formatter.format_compile_warning("file", "path/to/file", reason,
                                               %Q(    NSLog(@"alsdkflsakdj %@", 1);),
                                               %Q(                         ~~   ^))).to eq(
%Q(
#{@formatter.yellow('⚠️  ')}path/to/file: #{@formatter.yellow(reason)}

    NSLog(@"alsdkflsakdj %@", 1);
#{@formatter.cyan("                         ~~   ^")}

)
                                               )
    end

    it "formats linker warnings" do
      expect(@formatter.format_ld_warning("ld: embedded dylibs/frameworks only run on iOS 8 or later"))
          .to eq(@formatter.yellow("⚠️  ld: embedded dylibs/frameworks only run on iOS 8 or later").to_s)
    end

    it "formats linker undefined symbols by default" do
      expect(@formatter.format_undefined_duplicate_symbols(
        "Undefined symbols for architecture x86_64",
        [
          'Symbol: _OBJC_CLASS_$_CABasicAnimation',
          'Referenced from: objc-class-ref in ATZRadialProgressControl.o'
        ]
      )).to eq(%Q(
#{@formatter.red("❌  Undefined symbols for architecture x86_64")}
> Symbol: _OBJC_CLASS_$_CABasicAnimation
> Referenced from: objc-class-ref in ATZRadialProgressControl.o
))
    end

    it "formats linker duplicate symbols by default" do
      expect(@formatter.format_undefined_duplicate_symbols(
        "duplicate symbol _OBJC_IVAR_$ClassName._ivarName in",
        [
          '/Users/username/Library/Developer/Xcode/DerivedData/App-arcyyktezaigixbocjwfhsjllojz/Build/Intermediates/App.build/Debug-iphonesimulator/App.build/Objects-normal/i386/ClassName.o',
          '/Users/username/Library/Developer/Xcode/DerivedData/App-arcyyktezaigixbocjwfhsjllojz/Build/Products/Debug-iphonesimulator/libPods.a(DuplicateClassName.o)'
        ]
      )).to eq(%Q(
#{@formatter.red("❌  duplicate symbol _OBJC_IVAR_$ClassName._ivarName in")}
> /Users/username/Library/Developer/Xcode/DerivedData/App-arcyyktezaigixbocjwfhsjllojz/Build/Intermediates/App.build/Debug-iphonesimulator/App.build/Objects-normal/i386/ClassName.o
> /Users/username/Library/Developer/Xcode/DerivedData/App-arcyyktezaigixbocjwfhsjllojz/Build/Products/Debug-iphonesimulator/libPods.a(DuplicateClassName.o)
))
    end

    it "formats will not be code signed warnings" do
      expect(@formatter.format_will_not_be_code_signed(SAMPLE_WILL_NOT_BE_CODE_SIGNED))
          .to eq(@formatter.yellow("⚠️  FrameworkName will not be code signed because its settings don't specify a development team.").to_s)
    end

    it "formats failures per suite" do
        allow(Syntax).to receive(:highlight) { |snippet| snippet.contents }

        first_path = File.expand_path('spec/fixtures/NSStringTests.m:46')
        second_path = File.expand_path('spec/fixtures/NSStringTests.m:57')

        failures = {
          'CarSpec' => [{
            file_path: first_path,
            reason: "just doesn't work",
            test_case: 'Starting the car'
          }],
          'StringSpec' => [{
            file_path: second_path,
            reason: "doesn't split",
            test_case: 'Splitting the string'
          }],
          'UI spec' => [{
            file_path: "<unknown.m>:0",
            reason: "ui test failed",
            test_case: 'yolo'
          }]
        }
        expect(@formatter.format_test_summary(SAMPLE_EXECUTED_TESTS, failures)).to eq(%Q(

CarSpec
  Starting the car, #{@formatter.red("just doesn't work")}
  #{@formatter.cyan(first_path)}
  ```
        it(@"converts snake_cased to CamelCased", ^{
            [[[@"snake_case" camelCase] should] equal:@"SnakeCase"];
        });
  ```

StringSpec
  Splitting the string, #{@formatter.red("doesn't split")}
  #{@formatter.cyan(second_path)}
  ```
    it(@"-strip strips whitespaces and newlines from both ends", ^{
        [[[@"  Look mo, no empties!   " strip] should] equal:@"Look mo, no empties!"];
    });
  ```

UI spec
  yolo, #{@formatter.red("ui test failed")}
  #{@formatter.cyan("<unknown.m>:0")}


#{@formatter.red(SAMPLE_EXECUTED_TESTS)}))
    end
  end
end
