# frozen_string_literal: true

Given(/^I have a file to compile$/) do
  add_run_input SAMPLE_COMPILE
end

Given(/^I have a file to compile with ccache$/) do
  add_run_input SAMPLE_COMPILE_CCACHE
end

Given(/^I have a xib to compile$/) do
  add_run_input SAMPLE_COMPILE_XIB
end

Given(/^I have a storyboard to compile$/) do
  add_run_input SAMPLE_COMPILE_STORYBOARD
end

Given(/^I have an asset catalog to compile$/) do
  add_run_input SAMPLE_COMPILE_ASSET_CATALOG
end

Given(/^I have a build directory to create$/) do
  add_run_input SAMPLE_CREATE_BUILD_DIRECTORY
end

Given(/^I have a directory to create$/) do
  add_run_input SAMPLE_MKDIR
end

Given(/^I have a product packaging to process$/) do
  add_run_input SAMPLE_PROCESS_PRODUCT_PACKAGING
end

Given(/^I have a file ditto$/) do
  add_run_input SAMPLE_DITTO
end

Given(/^I have a DTrace script to compile$/) do
  add_run_input SAMPLE_COMPILE_DTRACE_SCRIPT
end

Given(/^I have a PNG file to copy$/) do
  add_run_input SAMPLE_COPY_PNG_FILE
end

Given(/^I have a TIFF file to copy$/) do
  add_run_input SAMPLE_COPY_TIFF_FILE
end

Given(/^I have storyboards to link$/) do
  add_run_input SAMPLE_LINK_STORYBOARDS
end

Given(/^I have a note$/) do
  add_run_input SAMPLE_NOTE
end

Given(/^I have an auxiliary file to write$/) do
  add_run_input SAMPLE_WRITE_AUXILIARY_FILE
end

Given(/^I have a file to process$/) do
  add_run_input SAMPLE_FILE_PROCESSING
end

Given(/^I have an identity to sign$/) do
  add_run_input SAMPLE_SIGNING_IDENTITY
end

Given(/^I have a precompiled header$/) do
  add_run_input SAMPLE_PRECOMPILE
end

Given(/^I have an aggregate target to build$/) do
  add_run_input SAMPLE_AGGREGATE_TARGET
end

Given(/^I have a file to analyze$/) do
  add_run_input SAMPLE_ANALYZE
end

Given(/^I have a file to shallow analyze$/) do
  add_run_input SAMPLE_ANALYZE_SHALLOW
end

Given(/^I have a failing test in my suite$/) do
  add_run_input SAMPLE_OLD_SPECTA_FAILURE
end

Given(/^I have a swift fatal error in a test in my suite$/) do
  add_run_input SAMPLE_SWIFT_FATAL_ERROR_IN_TEST_MAKE_TESTS_RESTARTING
end

Given(/^all of my tests will pass in my suite$/) do
  3.times { add_run_input SAMPLE_OCUNIT_TEST }
end

Given(/^I have a passing test in my suite$/) do
  add_run_input SAMPLE_OCUNIT_TEST
end

Given(/^I have a slow\-ish test in my suite$/) do
  add_run_input SAMPLE_SLOWISH_TEST
end

Given(/^I have a slow test in my suite$/) do
  add_run_input SAMPLE_SLOW_TEST
end

Given(/^the tests have started running$/) do
  add_run_input SAMPLE_OCUNIT_TEST_RUN_BEGINNING
end

Given(/^I start a test suite$/) do
  add_run_input SAMPLE_OCUNIT_SUITE_BEGINNING
end

Given(/^the test suite has finished$/) do
  add_run_input SAMPLE_OCUNIT_SUITE_COMPLETION
  add_run_input SAMPLE_EXECUTED_TESTS
end

Given(/^I have a file to code sign$/) do
  add_run_input SAMPLE_CODESIGN
end

Given(/^I have a framework to code sign$/) do
  add_run_input SAMPLE_CODESIGN_FRAMEWORK
end

Given(/^I have a target which will not be code signed$/) do
  add_run_input SAMPLE_WILL_NOT_BE_CODE_SIGNED
end

Given(/^I have a file to preprocess$/) do
  add_run_input SAMPLE_PREPROCESS
end

Given(/^I have a file to copy with PBXCp/) do
  add_run_input SAMPLE_PBXCP
end

Given(/^podfile.lock wasn't in sync$/) do
  add_run_input SAMPLE_PODS_ERROR
end

Given(/^there was a syntax error$/) do
  add_run_input SAMPLE_COMPILE_ERROR
end

Given(/^there was a missing file$/) do
  add_run_input SAMPLE_FILE_MISSING_ERROR
end

Given(/^there were warnings in the code$/) do
  add_run_input SAMPLE_FORMAT_WARNING
end

Given(/^the linker has failed with undefined symbols$/) do
  add_run_input SAMPLE_UNDEFINED_SYMBOLS
end

Given(/^I have a pending test in my suite$/) do
  add_run_input SAMPLE_PENDING_KIWI_TEST
end

Given(/^I have a measuring test in my suite$/) do
  add_run_input SAMPLE_MEASURING_TEST
end

Given(/^I have a tiff file to validate$/) do
  add_run_input SAMPLE_TIFFUTIL
end

Given(/^I have a file to touch$/) do
  add_run_input SAMPLE_TOUCH
end

Given(/^I have a screenshot in the output folder/) do
  copy_file_to_screenshot_dir(SAMPLE_SCREENSHOT_FILE)
end

Given(/^I have an unrelated image in the output folder/) do
  copy_file_to_screenshot_dir(SAMPLE_UNRELATED_IMAGE_FILE)
end

Given(/^I have completed a build$/) do
  add_run_input SAMPLE_BUILD_SUCCEEDED
end

Given(/^I have completed a clean$/) do
  add_run_input SAMPLE_CLEAN_SUCCEEDED
end

Given(/^the provisioning profile doesn't support capability$/) do
  add_run_input SAMPLE_PROFILE_DOESNT_SUPPORT_CAPABILITY_ERROR
end

Given(/^the provisioning profile doesn't include entitlement$/) do
  add_run_input SAMPLE_PROFILE_DOESNT_INCLUDE_ENTITLEMENT_ERROR
end

Given(/^the target requires code signing$/) do
  add_run_input SAMPLE_CODE_SIGNING_IS_REQUIRED_ERROR
end

Given(/^the matching profile is missing$/) do
  add_run_input SAMPLE_NO_PROFILE_MATCHING_ERROR
end

Then(/^I should see a "(\w+)" completion message$/) do |phase|
  run_output.should start_with("▸ #{phase.capitalize} Succeeded")
end

Then(/^I should see text beginning with "(.*?)"$/) do |text|
  run_output.lines.to_a.detect { |line| line.start_with? text }.should_not be_nil
end

Then(/^I should see text containing "(.*?)" and beginning with "(.*?)"$/) do |inner, start|
  run_output.lines.to_a.detect { |line| line.start_with?(start) && line.include?(inner) }.should_not be_nil
end

Then(/^I should (green|red) text beginning with "(.*?)"$/) do |color, text|
  run_output.should start_with(send(color.to_sym, text))
end

Then(/^I should see a successful tiff validation message$/) do
  run_output.should start_with("[foo] ▸ Validating")
end

Then(/^I should see a successful touch message$/) do
  run_output.should start_with("[foo] ▸ Touching")
end

When(/^I pipe to xcpretty with "(.*?)"$/) do |flags|
  run_xcpretty(flags)
end

Then(/^I should see a successful compilation message$/) do
  run_output.should start_with("[foo] ▸ Compiling")
end

Then(/^I should see a successful precompilation message$/) do
  run_output.should start_with("[foo] ▸ Precompiling")
end

Then(/^I should see an aggregate target message$/) do
  run_output.should start_with("▸ Aggregate")
end

Then(/^I should see a successful analyze message$/) do
  run_output.should start_with("[foo] ▸ Analyzing")
end

Then(/^I should see a successful code signing message$/) do
  run_output.should start_with("[foo] ▸ Signing")
end

Then(/^I should see a target will not be code signed warning$/) do
  run_output.should include(yellow("⚠️  FrameworkName will not be code signed because its settings don't specify a development team."))
end

Then(/^I should see a successful preprocessing message$/) do
  run_output.should start_with("[foo] ▸ Preprocessing")
end

Then(/^I should see a successful copying message$/) do
  run_output.should start_with("[foo] ▸ Copying")
end

Then(/^I should see a yellow completion icon$/) do
  run_output.should start_with("[foo] " + yellow("▸"))
end

Then(/^I should see a failed test icon$/) do
  run_output.should start_with("F")
end

Then(/^I should see a passing test icon in ASCII$/) do
  run_output.should start_with(".")
end

Then(/^I should see a red failed test icon$/) do
  run_output.should include(red("F"))
end

Then(/^I should see a pending test icon in ASCII$/) do
  run_output.should start_with("P")
end

Then(/^I should see a yellow pending test icon$/) do
  run_output.should start_with(yellow("P"))
end

Then(/^I should see a measuring test icon in ASCII$/) do
  run_output.should start_with('T')
end

Then(/^I should see a yellow measuring test icon$/) do
  run_output.should start_with(yellow('T'))
end

Then(/^the final execution message should be (red|green)$/) do |color|
  last_line = run_output.lines.to_a.last
  last_line.should be_colored(color.to_sym)
end

Then(/^I should see a green passing test icon$/) do
  run_output.should include(green("."))
end

Then(/^I should see the name of a failed test$/) do
  run_output.should =~ FAILING_TEST_NAME_MATCHER
end

Then(/^I should see the path of a failed test$/) do
  run_output.should =~ TEST_PATH_MATCHER
end

Then(/^I should see the name of a passing test$/) do
  run_output.should =~ PASSING_TEST_NAME_MATCHER
end

Then(/^I should not see the path of a passing test$/) do
  run_output.should_not =~ TEST_PATH_MATCHER
end

Then(/^I should see that test suite has started$/) do
  run_output.should =~ TEST_RUN_START_MATCHER
end

Then(/^I should see the name of suite only$/) do
  run_output.should =~ TEST_SUITE_START_MATCHER
end

Then(/^I should see that the test suite finished$/) do
  run_output.strip.should =~ TEST_SUITE_COMPLETION_MATCHER
end

Then(/^I should see a red failed test mark$/) do
  run_output.should include(red("✗"))
end

Then(/^I should see a green passing test mark$/) do
  run_output.should include(green("✓"))
end

Then(/^I should see a non-utf prefixed output$/) do
  run_output.should start_with("    " + green("."))
end

Then(/^I should not see the name of the test group$/) do
  run_output.should_not include("RACTupleSpec")
end

Then(/^I should see a red error message$/) do
  run_output.should include(red("❌  error: ")[0..-5]) # trim \e[0m
end

Then(/^I should see that sandbox is not in sync with Podfile.lock$/) do
  run_output.should include("The sandbox is not in sync with the Podfile.lock")
end

Then(/^I should see which file is missing$/) do
  run_output.should include(SAMPLE_FILE_MISSING_ERROR.split('directory: ')[1].delete("'"))
end

Then(/^I should see a yellow warning message$/) do
  run_output.should include("#{yellow('⚠️  ')}/Users/supermarin/code/oss/ObjectiveSugar/Example/ObjectiveSugar/AppDelegate.m:19:31:")
  run_output.should include(yellow("format specifies type 'id' but the argument has type 'int' [-Wformat]"))
end

Then(/^I should see a red compilation error$/) do
  run_output.should include(red("expected identifier"))
end

Then(/^I should see a failed line$/) do
  run_output.should include("[[thread.lastMessage should] equal:thread.];")
end

Then(/^I should see a cyan cursor$/) do
  run_output.should include(cyan("                                                          ^"))
end

Then(/^I should see the undefined symbold message$/) do
  run_output.should include(red("❌  Undefined symbols for architecture x86_64"))
end

Then(/^I should see the symbol and reference that caused failure$/) do
  run_output.should include("_OBJC_CLASS_$_CABasicAnimation")
  run_output.should include("objc-class-ref in ATZRadialProgressControl.o")
end

Then(/^I should see the name of a pending test$/) do
  run_output.should =~ PENDING_TEST_NAME_MATCHER
end

Then(/^I should see the name of a measuring test$/) do
  run_output.should =~ MEASURING_TEST_NAME_MATCHER
end

Then(/^I should see the test time in yellow$/) do
  run_output.should include(yellow("0.026").to_s)
end

Then(/^I should see the test time in red$/) do
  run_output.should include(red("0.101").to_s)
end

Then(/^I should see text matching "(.*?)"$/) do |text|
  run_output.lines.to_a.last.strip.should == text
end

Then(/^I should see the profile doesn't support capability message$/) do
  run_output.should include("Provisioning profile \"Profile Name\" doesn't support the Push Notifications capability.")
end

Then(/^I should see the profile doesn't include entitlement message$/) do
  run_output.should include("Provisioning profile \"Profile Name\" doesn't include the aps-environment entitlement.")
end

Then(/^I should see the code signing is requried message$/) do
  run_output.should include("Code signing is required for product type 'Application' in SDK 'iOS 10.0'")
end

Then(/^I should see the no profile matching message$/) do
  run_output.should include("No profile matching 'TargetName' found:  Xcode couldn't find a profile matching 'TargetName'. Install the profile (by dragging and dropping it onto Xcode's dock item) or select a different one in the General tab of the target editor.")
end

Then(/^I should see the compiling asset catalog message$/) do
  run_output.should start_with("[foo] ▸ Compiling asset catalog")
end

Then(/^I should see the creating build directory message$/) do
  run_output.should start_with("[foo] ▸ Creating build directory")
end

Then(/^I should see the mkdir message$/) do
  run_output.should start_with("[foo] ▸ Mkdir")
end

Then(/^I should see the process product packaging message$/) do
  run_output.should start_with("[foo] ▸ Processing product packaging")
end

Then(/^I should see the ditto message$/) do
  run_output.should start_with("[foo] ▸ Ditto")
end

Then(/^I should see the compile DTrace script message$/) do
  run_output.should start_with("[foo] ▸ Compiling DTrace script")
end

Then(/^I should see the copy PNG file message$/) do
  run_output.should start_with("[foo] ▸ Copying PNG file")
end

Then(/^I should see the copy TIFF file message$/) do
  run_output.should start_with("[foo] ▸ Copying TIFF file")
end

Then(/^I should see the link storyboards message$/) do
  run_output.should start_with("[foo] ▸ Linking storyboards")
end

Then(/^I should see the note message$/) do
  run_output.should start_with("▸ Note:")
end

Then(/^I should see the write auxiliary file message$/) do
  run_output.should start_with("[foo] ▸ Writing auxiliary file")
end

Then(/^I should see the process file message$/) do
  run_output.should start_with("[foo] ▸ Processing")
end

Then(/^I should see the sign identity message$/) do
  run_output.should start_with("▸ Signing identity")
end
