# frozen_string_literal: true

require 'xcpretty/formatters/formatter'
require "xcpretty/formatters/simple"
require "fixtures/constants"

module XCPretty

    describe Simple do

      before(:each) do
        @formatter = Simple.new(false, false)
      end

      it "formats analyzing" do
        expect(@formatter.format_analyze("CCChip8DisplayView.m", 'path/to/file', "foo"))
            .to eq("[foo] > Analyzing CCChip8DisplayView.m")
      end

      it "formats build target/project/configuration with target" do
        expect(@formatter.format_build_target("The Spacer", "Pods", "Debug"))
            .to eq("> Building Pods/The Spacer [Debug]")
      end

      it "formats build target/project/configuration with target" do
        expect(@formatter.format_aggregate_target("Be Aggro", "AggregateExample", "Debug"))
            .to eq("> Aggregate AggregateExample/Be Aggro [Debug]")
      end

      it "formats analyze target/project/configuration with target" do
        expect(@formatter.format_analyze_target("The Spacer", "Pods", "Debug"))
            .to eq("> Analyzing Pods/The Spacer [Debug]")
      end

      it "formats clean target/project/configuration" do
        expect(@formatter.format_clean_target("Pods-ObjectiveSugar", "Pods", "Debug"))
            .to eq("> Cleaning Pods/Pods-ObjectiveSugar [Debug]")
      end

      it 'formats compiler warnings' do
        warning = 'warning: stuff is broken'
        expect(@formatter.format_warning(warning, 'foo')).to eq('[foo]     ' + warning)
      end

      it "formats compiling output" do
        expect(@formatter.format_compile("NSMutableArray+ObjectiveSugar.m", 'path/to/file', "foo"))
            .to eq("[foo] > Compiling NSMutableArray+ObjectiveSugar.m")
      end

      it "formats compiling metal output" do
        expect(@formatter.format_compile("MYMetalFile.metal", 'path/to/file', "foo"))
            .to eq("[foo] > Compiling MYMetalFile.metal")
      end

      it "formats compiling xib output" do
        expect(@formatter.format_compile_xib("MainMenu.xib", 'path/to/file', "foo"))
            .to eq("[foo] > Compiling MainMenu.xib")
      end

      it "formats compiling storyboard output" do
        expect(@formatter.format_compile_xib("Main.storyboard", 'path/to/file', "foo"))
            .to eq("[foo] > Compiling Main.storyboard")
      end

      it "formats compiling asset catalog output" do
        expect(@formatter.format_compile_asset_catalog("sample/Assets.xcassets", "foo"))
             .to eq("[foo] > Compiling asset catalog sample/Assets.xcassets")
      end

      it "formats creating build directory output" do
        expect(@formatter.format_create_build_directory(
          "/Users/bas.broek/Documents/GitHub/ios/third_party_dependencies/Pods/../build",
          "foo"
        )).to eq("[foo] > Creating build directory /Users/bas.broek/Documents/GitHub/ios/third_party_dependencies/Pods/../build")
      end

      it "formats mkdir output" do
        expect(@formatter.format_mkdir(
          "OnePasswordExtension.framework",
          "foo"
        )).to eq("[foo] > Mkdir OnePasswordExtension.framework")
      end

      it "formats process product packaging output" do
        expect(@formatter.format_process_product_packaging(
          "Foo.entitlements",
          "MobileApp.app",
          "foo"
        )).to eq("[foo] > Processing product packaging Foo.entitlements for app MobileApp.app")
      end

      it "formats ditto output" do
        expect(@formatter.format_ditto(
          "/Users/devel/Library/Developer/Xcode/DerivedData/MobileApp-aaohjqrvwtifihalptrdzutcoadu/Build/Intermediates/MobileApp.build/Debug-iphoneos/Masonry\ iOS.build/module.modulemap",
          "/Users/devel/Library/Developer/Xcode/DerivedData/MobileApp-aaohjqrvwtifihalptrdzutcoadu/Build/Intermediates/MobileApp.framework/Modules/module.modulemap",
          "foo"
        )).to eq("[foo] > Ditto /Users/devel/Library/Developer/Xcode/DerivedData/MobileApp-aaohjqrvwtifihalptrdzutcoadu/Build/Intermediates/MobileApp.build/Debug-iphoneos/Masonry\ iOS.build/module.modulemap /Users/devel/Library/Developer/Xcode/DerivedData/MobileApp-aaohjqrvwtifihalptrdzutcoadu/Build/Intermediates/MobileApp.framework/Modules/module.modulemap")
      end

      it "formats compile DTrace script output" do
        expect(@formatter.format_compile_dtrace_script("RACCompoundDisposableProvider.d", "foo"))
          .to eq("[foo] > Compiling DTrace script RACCompoundDisposableProvider.d")
      end

      it "formats copy PNG file output" do
        expect(@formatter.format_copy_png_file(
          "/Users/jenkins/.jenkins/workspace/temp/Repo/test_package/Debug-iphoneos/MyTarget.bundle/IMAGE.PNG",
          "VideoEngineBundle/IMAGE.PNG",
          "foo"
        )).to eq("[foo] > Copying PNG file /Users/jenkins/.jenkins/workspace/temp/Repo/test_package/Debug-iphoneos/MyTarget.bundle/IMAGE.PNG")
      end

      it "formats copy TIFF file output" do
        expect(@formatter.format_copy_tiff_file(
          "/Users/jenkins/.jenkins/workspace/temp/Repo/test_package/Debug-iphonesimulator/MobileApp.app/PlugIns/MobileAppTests.xctest/ImageCompressorInput.tiff",
          "MobileAppTests/Resources/ImageCompressorInput.tiff",
          "foo"
        )).to eq("[foo] > Copying TIFF file /Users/jenkins/.jenkins/workspace/temp/Repo/test_package/Debug-iphonesimulator/MobileApp.app/PlugIns/MobileAppTests.xctest/ImageCompressorInput.tiff")
      end

      it "formats link storyboards" do
        expect(@formatter.format_link_storyboards("foo"))
            .to eq("[foo] > Linking storyboards")
      end

      it "formats note" do
        expect(@formatter.format_note("detected encoding of input file as Unicode (UTF-8)"))
            .to eq("> Note: detected encoding of input file as Unicode (UTF-8)")
      end

      it "formats write auxiliary file" do
        expect(@formatter.format_write_auxiliary_file("Specta.hmap", "foo"))
            .to eq("[foo] > Writing auxiliary file Specta.hmap")
      end

      it "formats processing" do
        expect(@formatter.format_processing_file(
          "/Users/jenkins/.jenkins/workspace/temp/Repo/test_package/Debug-iphoneos/test_packageBundle/de.lproj/Localizable.strings",
          "foo"
        )).to eq("[foo] > Processing /Users/jenkins/.jenkins/workspace/temp/Repo/test_package/Debug-iphoneos/test_packageBundle/de.lproj/Localizable.strings")
      end

      it "formats signing identity" do
        expect(@formatter.format_signing_identity("Foo"))
            .to eq("> Signing identity \"Foo\"")
      end

      it 'formats copying header files' do
        expect(@formatter.format_copy_header_file('Source.h',
                                           'dir/Destination.h',
                                           'foo')).to eq('[foo] > Copying Source.h')
      end

      it 'formats copying plist files' do
        expect(@formatter.format_copy_plist_file("Source.plist",
                                          'dir/Destination.plist',
                                          'foo')).to eq('[foo] > Copying Source.plist')
      end

      it "formats copy resource" do
        expect(@formatter.format_cpresource("ObjectiveSugar/Default-568h@2x.png", "foo"))
            .to eq("[foo] > Copying ObjectiveSugar/Default-568h@2x.png")
      end

      it "formats Copy strings file" do
        expect(@formatter.format_copy_strings_file("InfoPlist.strings", "foo"))
            .to eq("[foo] > Copying InfoPlist.strings")
      end

      it "formats GenerateDSYMFile" do
        expect(@formatter.format_generate_dsym("ObjectiveSugarTests.octest.dSYM", "foo"))
            .to eq("[foo] > Generating 'ObjectiveSugarTests.octest.dSYM'")
      end

      it "formats info.plist processing" do
        expect(@formatter.format_process_info_plist("The Spacer-Info.plist", "The Spacer/The Spacer-Info.plist", "foo"))
            .to eq("[foo] > Processing The Spacer-Info.plist")
      end

      it "formats Linking" do
        expect(@formatter.format_linking("ObjectiveSugar", 'normal', 'i386', "foo"))
            .to eq("[foo] > Linking ObjectiveSugar")
      end

      it "formats metal Linking" do
        expect(@formatter.format_linking_metal("default.metallib", "foo"))
            .to eq("[foo] > Linking default.metallib")
      end

      it "formats Libtool" do
        expect(@formatter.format_libtool("libPods-ObjectiveSugarTests-Kiwi.a", "foo"))
            .to eq("[foo] > Building library libPods-ObjectiveSugarTests-Kiwi.a")
      end

      it "formats failing tests" do
        expect(@formatter.format_failing_test("RACCommandSpec", "enabled_signal_should_send_YES_while_executing_is_YES_and_allowsConcurrentExecution_is_YES", "expected: 1, got: 0", 'path/to/file'))
            .to eq("    x enabled_signal_should_send_YES_while_executing_is_YES_and_allowsConcurrentExecution_is_YES, expected: 1, got: 0")
      end

      it "formats passing tests" do
        expect(@formatter.format_passing_test("RACCommandSpec", "_tupleByAddingObject__should_add_a_non_nil_object", "0.001"))
            .to eq("    . _tupleByAddingObject__should_add_a_non_nil_object (0.001 seconds)")
      end

      it "formats pending tests" do
        expect(@formatter.format_pending_test("RACCommandSpec", "_tupleByAddingObject__should_add_a_non_nil_object"))
            .to eq("    P _tupleByAddingObject__should_add_a_non_nil_object [PENDING]")
      end

      it "formats measuring tests" do
        expect(@formatter.format_measuring_test("RACCommandSpec", "_tupleByAddingObject__should_add_a_non_nil_object", "0.001"))
            .to eq("    T _tupleByAddingObject__should_add_a_non_nil_object measured (0.001 seconds)")
      end

      it "formats build success output" do
        expect(@formatter.format_phase_success("BUILD")).to eq("> Build Succeeded")
      end

      it "formats clean success output" do
        expect(@formatter.format_phase_success("CLEAN")).to eq("> Clean Succeeded")
      end

      it "formats Phase Script Execution" do
        expect(@formatter.format_phase_script_execution("Check Pods Manifest.lock", "foo"))
            .to eq("[foo] > Running script 'Check Pods Manifest.lock'")
      end

      it "formats script rule execution" do
        expect(@formatter.format_script_rule_execution("Check Pods Manifest.lock", "folder/", "foo"))
            .to eq("[foo] > Running script rule Check Pods Manifest.lock")
      end

      it "formats precompiling output" do
        expect(@formatter.format_process_pch("Pods-CocoaLumberjack-prefix.pch", "foo"))
            .to eq("[foo] > Precompiling Pods-CocoaLumberjack-prefix.pch")
      end

      it "formats code signing" do
        expect(@formatter.format_codesign("build/Release/CocoaChip.app", "foo"))
            .to eq("[foo] > Signing build/Release/CocoaChip.app")
      end

      it "formats preprocessing a file" do
        expect(@formatter.format_preprocess("CocoaChip/CocoaChip-Info.plist", "foo"))
            .to eq("[foo] > Preprocessing CocoaChip/CocoaChip-Info.plist")
      end

      it "formats PBXCp" do
        expect(@formatter.format_pbxcp("build/Release/CocoaChipCore.framework", "foo"))
            .to eq("[foo] > Copying build/Release/CocoaChipCore.framework")
      end

      it "formats test run start" do
        expect(@formatter.format_test_run_started("ReactiveCocoaTests.octest(Tests)"))
            .to eq("Test Suite ReactiveCocoaTests.octest(Tests) started")
      end

      it "formats tests suite started" do
        expect(@formatter.format_test_suite_started("RACKVOWrapperSpec"))
            .to eq("RACKVOWrapperSpec")
      end

      it "formats Touch" do
        expect(@formatter.format_touch("/path/to/SomeFile.txt", "SomeFile.txt", "foo"))
            .to eq("[foo] > Touching SomeFile.txt")
      end

      it "formats TiffUtil" do
        expect(@formatter.format_tiffutil("unbelievable.tiff", "foo"))
            .to eq("[foo] > Validating unbelievable.tiff")
      end

      it 'formats Check Dependencies' do
        expect(@formatter.format_check_dependencies).to eq('> Check Dependencies')
      end
    end
end
