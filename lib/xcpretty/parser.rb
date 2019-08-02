# frozen_string_literal: true

module XCPretty

  module Matchers
    # $1 build_target
    IN_TARGET_MATCHER = /\s\(in target:\s(.*)\)$/.freeze

    # @regex Captured groups
    # $1 file_path
    # $2 file_name
    ANALYZE_MATCHER = /^Analyze(?:Shallow)?\s(.*\/(.*\.(?:m|mm|cc|cpp|c|cxx)))\s*/.freeze

    # @regex Captured groups
    # $1 target
    # $2 project
    # $3 configuration
    BUILD_TARGET_MATCHER = /^=== BUILD TARGET\s(.*)\sOF PROJECT\s(.*)\sWITH.*CONFIGURATION\s(.*)\s===/.freeze

    # @regex Captured groups
    # $1 target
    # $2 project
    # $3 configuration
    AGGREGATE_TARGET_MATCHER = /^=== BUILD AGGREGATE TARGET\s(.*)\sOF PROJECT\s(.*)\sWITH.*CONFIGURATION\s(.*)\s===/.freeze

    # @regex Captured groups
    # $1 target
    # $2 project
    # $3 configuration
    ANALYZE_TARGET_MATCHER = /^=== ANALYZE TARGET\s(.*)\sOF PROJECT\s(.*)\sWITH.*CONFIGURATION\s(.*)\s===/.freeze

    # @regex Nothing returned here for now
    CHECK_DEPENDENCIES_MATCHER = /^Check dependencies/.freeze

    # @regex Captured groups
    # $1 command path
    # $2 arguments
    SHELL_COMMAND_MATCHER = /^\s{4}(cd|setenv|(?:[\w\/:\\\s\-.]+?\/)?[\w\-]+)\s(.*)$/.freeze

    # @regex Nothing returned here for now
    CLEAN_REMOVE_MATCHER = /^Clean.Remove/.freeze

    # @regex Captured groups
    # $1 target
    # $2 project
    # $3 configuration
    CLEAN_TARGET_MATCHER = /^=== CLEAN TARGET\s(.*)\sOF PROJECT\s(.*)\sWITH CONFIGURATION\s(.*)\s===/.freeze

    # @regex Captured groups
    # $1 = file
    CODESIGN_MATCHER = /^CodeSign\s((?:\\ |[^ ])*)$/.freeze

    # @regex Captured groups
    # $1 = file
    CODESIGN_FRAMEWORK_MATCHER = /^CodeSign\s(.*\.framework)\/Versions/.freeze

    # @regex Captured groups
    # $1 file_path
    # $2 file_name (e.g. KWNull.m)
    COMPILE_MATCHER = /^Compile[\w]+\s.+?\s((?:\\ |[^ ])+\/((?:\\ |[^ ])+\.(?:m|mm|c|cc|cpp|cxx|swift)))\s.*/.freeze

    # @regex Captured groups
    # $1 compiler_command
    # $2 file_path
    COMPILE_COMMAND_MATCHER = /^\s*(.*clang\s.*\s\-c\s(.*\.(?:m|mm|c|cc|cpp|cxx))\s.*\.o)$/.freeze

    # @regex Captured groups
    # $1 file_path
    # $2 file_name (e.g. KWNull.metal)
    COMPILE_METAL_MATCHER = /^CompileMetalFile\s((?:\\ |[^ ])+\/((?:\\ |[^ ])+\.(?:metal)))\s.*/.freeze

    # @regex Captured groups
    # $1 file_path
    # $2 file_name (e.g. MainMenu.xib)
    COMPILE_XIB_MATCHER = /^CompileXIB\s(.*\/(.*\.xib))/.freeze

    # @regex Captured groups
    # $1 file_path
    # $2 file_name (e.g. Main.storyboard)
    COMPILE_STORYBOARD_MATCHER = /^CompileStoryboard\s(.*\/([^\/].*\.storyboard))/.freeze

    # @regex Captured groups
    # $1 file_path
    COMPILE_ASSET_CATALOG_MATCHER = /^CompileAssetCatalog\s(?:\\ |[^ ])+\s((?:\\ |[^ ])+\.xcassets)/.freeze

    # @regex Captured groups
    # $1 source file
    # $2 target file
    COPY_HEADER_MATCHER = /^CpHeader\s(.*\.h)\s(.*\.h)/.freeze

    # @regex Captured groups
    # $1 source file
    # $2 target file
    COPY_PLIST_MATCHER = /^CopyPlistFile\s(.*\.plist)\s(.*\.plist)/.freeze

    # @regex Captured groups
    # $1 file
    COPY_STRINGS_MATCHER = /^CopyStringsFile.*\/(.*.strings)/.freeze

    # @regex Captured groups
    # $1 resource
    CPRESOURCE_MATCHER = /^CpResource\s(.*)\s\//.freeze

    # @regex Captured groups
    #
    EXECUTED_MATCHER = /^\s*Executed/.freeze

    # @regex Captured groups
    # $1 = file
    # $2 = test_suite
    # $3 = test_case
    # $4 = reason
    FAILING_TEST_MATCHER = /^\s*([^:]+:\d+):\serror:\s[\+\-]\[([^\s]*)\s([^\]]*)\]\s:(?:\s'.*'\s\[FAILED\],)?\s(.*)/.freeze

    # @regex Captured groups
    # $1 = file
    # $2 = reason
    UI_FAILING_TEST_MATCHER = /^\s{4}t = \s+\d+\.\d+s\s+Assertion Failure: (.*:\d+): (.*)$/.freeze

    # @regex Captured groups
    RESTARTING_TESTS_MATCHER = /^Restarting after unexpected exit or crash in.+$/.freeze

    # @regex Captured groups
    # $1 = dsym
    GENERATE_DSYM_MATCHER = /^GenerateDSYMFile \/.*\/(.*\.dSYM)/.freeze

    # @regex Captured groups
    # $1 = library
    LIBTOOL_MATCHER = /^Libtool.*\/(.*\.a)/.freeze

    # @regex Captured groups
    # $1 = target
    # $2 = build_variants (normal, profile, debug)
    # $3 = architecture
    LINKING_MATCHER = /^Ld \/?.*\/(.*?) (.*) (.*)$/.freeze

    # @regex Captured groups
    # $1 = target
    LINKING_METAL_MATCHER = /^MetalLink \/?.*\/(.*?)$/.freeze

    # @regex Captured groups
    # $1 = suite
    # $2 = test_case
    # $3 = time
    TEST_CASE_PASSED_MATCHER = /^\s*Test Case\s'-\[(.*)\s(.*)\]'\spassed\s\((\d*\.\d{3})\sseconds\)/.freeze

    # @regex Captured groups
    # $1 = suite
    # $2 = test_case
    TEST_CASE_STARTED_MATCHER = /^Test Case '-\[(.*) (.*)\]' started.$/.freeze

    # @regex Captured groups
    # $1 = suite
    # $2 = test_case
    TEST_CASE_PENDING_MATCHER = /^Test Case\s'-\[(.*)\s(.*)PENDING\]'\spassed/.freeze

    # @regex Captured groups
    # $1 = suite
    # $2 = test_case
    # $3 = time
    TEST_CASE_MEASURED_MATCHER = /^[^:]*:[^:]*:\sTest Case\s'-\[(.*)\s(.*)\]'\smeasured\s\[Time,\sseconds\]\saverage:\s(\d*\.\d{3}),/.freeze

    PHASE_SUCCESS_MATCHER = /^\*\*\s(.*)\sSUCCEEDED\s\*\*/.freeze

    # @regex Captured groups
    # $1 = script_name
    PHASE_SCRIPT_EXECUTION_MATCHER = /^PhaseScriptExecution\s((\\\ |\S)*)\s/.freeze

    # @regex Captured groups
    # $1 = file
    PROCESS_PCH_MATCHER = /^ProcessPCH\s.*\s(.*.pch)/.freeze

    # @regex Captured groups
    # $1 file_path
    PROCESS_PCH_COMMAND_MATCHER = /^\s*.*\/usr\/bin\/clang\s.*\s\-c\s(.*)\s\-o\s.*/.freeze

    # @regex Captured groups
    # $1 = file
    PREPROCESS_MATCHER = /^Preprocess\s(?:(?:\\ |[^ ])*)\s((?:\\ |[^ ])*)$/.freeze

    # @regex Captured groups
    # $1 = file
    PBXCP_MATCHER = /^PBXCp\s((?:\\ |[^ ])*)/.freeze

    # @regex Captured groups
    # $1 = file_path
    # $2 = file_name
    PROCESS_INFO_PLIST_MATCHER = /^ProcessInfoPlistFile\s.*\.plist\s(.*\/+(.*\.plist))/.freeze

    # @regex Captured groups
    # $1 file_path
    RULE_SCRIPT_EXECUTION_MATCHER = /^RuleScriptExecution\s(.*?[^\\])\s/.freeze

    # @regex Captured groups
    # $1 = suite
    # $2 = time
    TESTS_RUN_COMPLETION_MATCHER = /^\s*Test Suite '(?:.*\/)?(.*[ox]ctest.*)' (finished|passed|failed) at (.*)/.freeze

    # @regex Captured groups
    # $1 = suite
    # $2 = time
    TEST_SUITE_STARTED_MATCHER = /^\s*Test Suite '(?:.*\/)?(.*[ox]ctest.*)' started at(.*)/.freeze

    # @regex Captured groups
    # $1 test suite name
    TEST_SUITE_START_MATCHER = /^\s*Test Suite '(.*)' started at/.freeze

    # @regex Captured groups
    # $1 file_name
    TIFFUTIL_MATCHER = /^TiffUtil\s(.*)/.freeze

    # @regex Captured groups
    # $1 file_path
    # $2 file_name
    TOUCH_MATCHER = /^Touch\s(.*\/(.+))/.freeze

    # @regex Captured groups
    # $1 file_path
    WRITE_FILE_MATCHER = /^write-file\s(.*)/.freeze

    # @regex Captured groups
    WRITE_AUXILIARY_FILES = /^Write auxiliary files/.freeze

    # @regex Captured groups
    # $1 = directory name
    CREATE_BUILD_DIRECTORY_MATCHER = /^CreateBuildDirectory\s(?:.*\/)?(.+)$/.freeze

    # @regex Captured groups
    # $1 = directory name
    MKDIR_MATCHER = /^MkDir\s(?:.*\/)?(.+)$/.freeze

    # @regex Captured groups
    # $1 = entitlements
    # $2 = package name
    PROCESS_PRODUCT_PACKAGING_MATCHER = /^ProcessProductPackaging\s"((?:\\"|[^"])*)"\s.+\/(.+)$/.freeze

    # @regex Captured groups
    # $1 source file
    # $2 target file
    DITTO_MATCHER = /^Ditto\s((?:\\ |[^ ])+)\s((?:\\ |[^ ])+?)$/.freeze

    # @regex Captured groups
    # $1 file_name
    COMPILE_DTRACE_SCRIPT_MATCHER = /^CompileDTraceScript\s.*\/(.+)$/.freeze

    # @regex Captured groups
    # $1 source file
    # $2 target file
    COPY_PNG_FILE_MATCHER = /^CopyPNGFile\s((?:\\ |[^ ])+)\s((?:\\ |[^ ])+)$/.freeze

    # @regex Captured groups
    # $1 source file
    # $2 target file
    COPY_TIFF_FILE_MATCHER = /^CopyTiffFile\s((?:\\ |[^ ])+)\s((?:\\ |[^ ])+)$/.freeze

    # @regex Captured groups
    LINK_STORYBOARDS_MATCHER = /^LinkStoryboards/.freeze

    # @regex Captured groups
    # $1 note content
    NOTE_MATCHER = /^note: (.*)$/.freeze

    # @regex Captured groups
    # $1 auxiliary file name
    WRITE_AUXILIARY_FILE_MATCHER = /^WriteAuxiliaryFile\s.*\/(.+)$/.freeze

    # @regex Captured groups
    # $1 file path
    PROCESSING_FILE_MATCHER = /^Processing\s(.+)$/.freeze

    # @regex Captured groups
    # $1 identity
    SIGNING_IDENTITY_MATCHER = /^Signing Identity:\s*"(.*)"$/.freeze

    module Warnings
      # $1 = file_path
      # $2 = file_name
      # $3 = reason
      COMPILE_WARNING_MATCHER = /^(\/[^:]*\/([^:]*):\d*:\d*):\swarning:\s(.*)$/.freeze

      # $1 = ld prefix
      # $2 = warning message
      LD_WARNING_MATCHER = /^(ld: )warning: (.*)/.freeze

      # @regex Captured groups
      # $1 = whole warning
      GENERIC_WARNING_MATCHER = /^warning:\s(.*)$/.freeze

      # @regex Captured groups
      # $1 = whole warning
      WILL_NOT_BE_CODE_SIGNED_MATCHER = /^(.* will not be code signed because .*)$/.freeze
    end

    module Runtime
      # $1 = reason
      THREAD_SANITIZER_HEADER_MATCHER = /^.*WARNING: ThreadSanitizer: (.*)$/.freeze

      # $1 = reason
      ADDRESS_SANITIZER_HEADER_MATCHER = /^[\d=]*ERROR: AddressSanitizer: (.*)$/.freeze

      # $1 = file
      # $2 = reason
      UNDEFINED_BEHAVIOR_SANITIZER_HEADER_MATCHER = /^(?:\/.+\/([^:]*:\d*:\d*)): runtime error:\s(.*)$/.freeze

      # $1 = reason
      THREAD_SANITIZER_SUMMARY_MATCHER = /^.*SUMMARY: ThreadSanitizer: (.*)$/.freeze

      # $1 = reason
      ADDRESS_SANITIZER_SUMMARY_MATCHER = /^.*SUMMARY: AddressSanitizer: (.*)$/.freeze

      UNDEFINED_BEHAVIOR_SANITIZER_SUMMARY_MATCHER = UNDEFINED_BEHAVIOR_SANITIZER_HEADER_MATCHER

      THREAD_SANITIZER_FOOTER_MATCHER = /^.*SUMMARY: ThreadSanitizer: (.*)$/.freeze

      ADDRESS_SANITIZER_FOOTER_MATCHER = /^[\d=]*ABORTING$/.freeze

      UNDEFINED_BEHAVIOR_SANITIZER_FOOTER_MATCHER = UNDEFINED_BEHAVIOR_SANITIZER_HEADER_MATCHER
    end

    module Errors
      # @regex Captured groups
      # $1 = whole error
      CLANG_ERROR_MATCHER = /^(clang: error:.*)$/.freeze

      # @regex Captured groups
      # $1 = whole error
      CHECK_DEPENDENCIES_ERRORS_MATCHER = /^(Code\s?Sign error:.*|Code signing is required for product type .* in SDK .*|No profile matching .* found:.*|Provisioning profile .* doesn't .*|Swift is unavailable on .*|.?Use Legacy Swift Language Version.*)$/.freeze

      # @regex Captured groups
      # $1 = whole error
      PROVISIONING_PROFILE_REQUIRED_MATCHER = /^(.*requires a provisioning profile.*)$/.freeze

      # @regex Captured groups
      # $1 = whole error
      NO_CERTIFICATE_MATCHER = /^(No certificate matching.*)$/.freeze

      # @regex Captured groups
      # $1 = file_path
      # $2 = file_name
      # $3 = reason
      COMPILE_ERROR_MATCHER = /^(\/.+\/([^:]*):\d*:\d*):\s(?:fatal\s)?error:\s(.*)$/.freeze

      # @regex Captured groups
      # $1 cursor (with whitespaces and tildes)
      CURSOR_MATCHER = /^([\s~]*\^[\s~]*)$/.freeze

      # @regex Captured groups
      # $1 = whole error.
      # it varies a lot, not sure if it makes sense to catch everything separately
      FATAL_ERROR_MATCHER = /^(fatal error:.*)$/.freeze

      # @regex Captured groups
      # $1 = whole error.
      # $2 = file path
      FILE_MISSING_ERROR_MATCHER = /^<unknown>:0:\s(error:\s.*)\s'(\/.+\/.*\..*)'$/.freeze

      # @regex Captured groups
      # $1 = whole error
      LD_ERROR_MATCHER = /^(ld:.*)/.freeze

      # @regex Captured groups
      # $1 file path
      LINKER_DUPLICATE_SYMBOLS_LOCATION_MATCHER = /^\s+(\/.*\.o[\)]?)$/.freeze

      # @regex Captured groups
      # $1 reason
      LINKER_DUPLICATE_SYMBOLS_HEADER_MATCHER = /^(duplicate symbol .*):$/.freeze

      # @regex Captured groups
      # $1 reason
      LINKER_DUPLICATE_SYMBOLS_FOOTER_MATCHER = /^(ld: .* duplicate symbol(?:s)? for architecture .*)/.freeze

      # @regex Captured groups
      # $1 symbol location
      LINKER_UNDEFINED_SYMBOL_LOCATION_MATCHER = /^(.* in .*\.o.*)$/.freeze

      # @regex Captured groups
      # $1 reason
      LINKER_UNDEFINED_SYMBOLS_HEADER_MATCHER = /^(Undefined symbols for architecture .*):$/.freeze

      # @regex Captured groups
      # $1 reason
      LINKER_UNDEFINED_SYMBOLS_FOOTER_MATCHER = /^(ld: symbol\(s\) not found for architecture .*)/.freeze

      # @regex Captured groups
      # $1 reason
      PODS_ERROR_MATCHER = /^(error:\s.*)/.freeze

      # @regex Captured groups
      # $1 = reference
      SYMBOL_REFERENCED_FROM_MATCHER = /\s+"(.*)", referenced from:$/.freeze

      # @regex Captured groups
      # $1 = error reason
      MODULE_INCLUDES_ERROR_MATCHER = /^\<module-includes\>:.*?:.*?:\s(?:fatal\s)?(error:\s.*)$/.freeze

      # @regex Captured groups
      # $1 = whole error
      CCACHE_ERROR_MATCHER = /^(ccache: error:.*)$/.freeze

      # @regex Captured groups
      # $1 = whole error
      LLVM_ERROR_MATCHER = /^(LLVM ERROR:.*)$/.freeze
    end
  end

  class Parser

    include Matchers
    include Matchers::Errors
    include Matchers::Warnings
    include Matchers::Runtime

    attr_reader :formatter

    def initialize(formatter)
      @formatter = formatter
    end

    def parse(text)
      update_test_state(text)
      update_error_state(text)
      update_linker_failure_state(text)
      update_runtime_error_state(text)

      return format_compile_error if should_format_error?
      return format_compile_warning if should_format_warning?
      return format_undefined_duplicate_symbols if should_format_undefined_duplicate_symbols?
      return format_runtime_error if should_format_runtime_error?

      if IN_TARGET_MATCHER.match(text)
        build_target = $1
        text = text.sub(IN_TARGET_MATCHER, '')
      end

      case text
      when ANALYZE_MATCHER
        formatter.format_analyze($2, $1, build_target)
      when BUILD_TARGET_MATCHER
        formatter.format_build_target($1, $2, $3)
      when AGGREGATE_TARGET_MATCHER
        formatter.format_aggregate_target($1, $2, $3)
      when ANALYZE_TARGET_MATCHER
        formatter.format_analyze_target($1, $2, $3)
      when CLEAN_REMOVE_MATCHER
        formatter.format_clean_remove
      when CLEAN_TARGET_MATCHER
        formatter.format_clean_target($1, $2, $3)
      when COPY_STRINGS_MATCHER
        formatter.format_copy_strings_file($1, build_target)
      when CHECK_DEPENDENCIES_MATCHER
        formatter.format_check_dependencies
      when CLANG_ERROR_MATCHER
        formatter.format_error($1)
      when CODESIGN_FRAMEWORK_MATCHER
        formatter.format_codesign($1, build_target)
      when CODESIGN_MATCHER
        formatter.format_codesign($1, build_target)
      when CHECK_DEPENDENCIES_ERRORS_MATCHER
        formatter.format_error($1)
      when PROVISIONING_PROFILE_REQUIRED_MATCHER
        formatter.format_error($1)
      when NO_CERTIFICATE_MATCHER
        formatter.format_error($1)
      when COMPILE_MATCHER
        formatter.format_compile($2, $1, build_target)
      when COMPILE_COMMAND_MATCHER
        formatter.format_compile_command($1, $2, build_target)
      when COMPILE_METAL_MATCHER
        formatter.format_compile_metal($2, $1, build_target)
      when COMPILE_XIB_MATCHER
        formatter.format_compile_xib($2, $1, build_target)
      when COMPILE_STORYBOARD_MATCHER
        formatter.format_compile_storyboard($2, $1, build_target)
      when COMPILE_ASSET_CATALOG_MATCHER
        formatter.format_compile_asset_catalog($1, build_target)
      when COPY_HEADER_MATCHER
        formatter.format_copy_header_file($1, $2, build_target)
      when COPY_PLIST_MATCHER
        formatter.format_copy_plist_file($1, $2, build_target)
      when CPRESOURCE_MATCHER
        formatter.format_cpresource($1, build_target)
      when EXECUTED_MATCHER
        format_summary_if_needed(text)
      when RESTARTING_TESTS_MATCHER
        formatter.format_failing_test(@test_suite, @test_case, "Test crashed", "n/a")
      when UI_FAILING_TEST_MATCHER
        formatter.format_failing_test(@test_suite, @test_case, $2, $1)
      when FAILING_TEST_MATCHER
        formatter.format_failing_test($2, $3, $4, $1)
      when FATAL_ERROR_MATCHER
        formatter.format_error($1)
      when FILE_MISSING_ERROR_MATCHER
        formatter.format_file_missing_error($1, $2)
      when GENERATE_DSYM_MATCHER
        formatter.format_generate_dsym($1, build_target)
      when LD_WARNING_MATCHER
        formatter.format_ld_warning($1 + $2)
      when LD_ERROR_MATCHER
        formatter.format_error($1)
      when LIBTOOL_MATCHER
        formatter.format_libtool($1, build_target)
      when LINKING_MATCHER
        formatter.format_linking($1, $2, $3, build_target)
      when LINKING_METAL_MATCHER
        formatter.format_linking_metal($1, build_target)
      when MODULE_INCLUDES_ERROR_MATCHER
        formatter.format_error($1)
      when TEST_CASE_MEASURED_MATCHER
        formatter.format_measuring_test($1, $2, $3)
      when TEST_CASE_PENDING_MATCHER
        formatter.format_pending_test($1, $2)
      when TEST_CASE_PASSED_MATCHER
        formatter.format_passing_test($1, $2, $3)
      when PODS_ERROR_MATCHER
        formatter.format_error($1)
      when PROCESS_INFO_PLIST_MATCHER
        formatter.format_process_info_plist(*unescaped($2, $1), build_target)
      when PHASE_SCRIPT_EXECUTION_MATCHER
        formatter.format_phase_script_execution(*unescaped($1), build_target)
      when PHASE_SUCCESS_MATCHER
        formatter.format_phase_success($1)
      when PROCESS_PCH_MATCHER
        formatter.format_process_pch($1, build_target)
      when PROCESS_PCH_COMMAND_MATCHER
        formatter.format_process_pch_command($1, build_target)
      when PREPROCESS_MATCHER
        formatter.format_preprocess($1, build_target)
      when PBXCP_MATCHER
        formatter.format_pbxcp($1, build_target)
      when RULE_SCRIPT_EXECUTION_MATCHER
        formatter.format_script_rule_execution(*unescaped(File.basename($1), $1), build_target)
      when TESTS_RUN_COMPLETION_MATCHER
        formatter.format_test_run_finished($1, $3)
      when TEST_SUITE_STARTED_MATCHER
        ignore = @ignore_test_suite_started_message
        @ignore_test_suite_started_message = false
        ignore ? formatter.format_other(text) : formatter.format_test_run_started($1)
      when TEST_SUITE_START_MATCHER
        formatter.format_test_suite_started($1)
      when TIFFUTIL_MATCHER
        formatter.format_tiffutil($1, build_target)
      when TOUCH_MATCHER
        formatter.format_touch($1, $2, build_target)
      when WRITE_FILE_MATCHER
        formatter.format_write_file($1)
      when WRITE_AUXILIARY_FILES
        formatter.format_write_auxiliary_files
      when CREATE_BUILD_DIRECTORY_MATCHER
        formatter.format_create_build_directory($1, build_target)
      when MKDIR_MATCHER
        formatter.format_mkdir($1, build_target)
      when PROCESS_PRODUCT_PACKAGING_MATCHER
        formatter.format_process_product_packaging($1, $2, build_target)
      when DITTO_MATCHER
        formatter.format_ditto($1, $2, build_target)
      when COMPILE_DTRACE_SCRIPT_MATCHER
        formatter.format_compile_dtrace_script($1, build_target)
      when COPY_PNG_FILE_MATCHER
        formatter.format_copy_png_file($1, $2, build_target)
      when COPY_TIFF_FILE_MATCHER
        formatter.format_copy_tiff_file($1, $2, build_target)
      when LINK_STORYBOARDS_MATCHER
        formatter.format_link_storyboards(build_target)
      when NOTE_MATCHER
        formatter.format_note($1)
      when WRITE_AUXILIARY_FILE_MATCHER
        formatter.format_write_auxiliary_file($1, build_target)
      when PROCESSING_FILE_MATCHER
        formatter.format_processing_file($1, build_target)
      when SIGNING_IDENTITY_MATCHER
        formatter.format_signing_identity($1)
      when SHELL_COMMAND_MATCHER
        formatter.format_shell_command($1, $2)
      when GENERIC_WARNING_MATCHER
        formatter.format_warning($1)
      when WILL_NOT_BE_CODE_SIGNED_MATCHER
        formatter.format_will_not_be_code_signed($1)
      when CCACHE_ERROR_MATCHER
        formatter.format_error($1)
      when LLVM_ERROR_MATCHER
        formatter.format_error($1)
      else
        formatter.format_other(text)
      end
    end

    private

    def update_test_state(text)
      case text
      when TEST_SUITE_STARTED_MATCHER
        unless @ignore_test_suite_started_message
          @tests_done = false
          @formatted_summary = false
          @failures_per_suite = {}
        end
      when TEST_CASE_STARTED_MATCHER
        @test_suite = $1
        @test_case = $2
      when TESTS_RUN_COMPLETION_MATCHER
        @tests_done = true
      when FAILING_TEST_MATCHER
        store_failure(file: $1, test_suite: $2, test_case: $3, reason: $4)
      when UI_FAILING_TEST_MATCHER
        store_failure(file: $1, test_suite: @test_suite, test_case: @test_case, reason: $2)
      when RESTARTING_TESTS_MATCHER
        # Because this is a restart of test suite that was already started, ignore the upcoming started message.
        @ignore_test_suite_started_message = true
        store_failure(file: "n/a", test_suite: @test_suite, test_case: @test_case, reason: "Test crashed")
      end
    end

    # @ return Hash { :file_name, :file_path, :reason, :line }
    def update_error_state(text)
      update_error = lambda {
        current_issue[:reason]    = $3
        current_issue[:file_path] = $1
        current_issue[:file_name] = $2
      }
      if text =~ COMPILE_ERROR_MATCHER
        @formatting_error = true
        update_error.call
      elsif text =~ COMPILE_WARNING_MATCHER
        @formatting_warning = true
        update_error.call
      elsif text =~ CURSOR_MATCHER
        current_issue[:cursor]    = $1.chomp
      elsif @formatting_error || @formatting_warning
        current_issue[:line]      = text.chomp
      end
    end

    def update_linker_failure_state(text)
      if text =~ LINKER_UNDEFINED_SYMBOLS_HEADER_MATCHER ||
         text =~ LINKER_DUPLICATE_SYMBOLS_HEADER_MATCHER
        current_linker_failure[:message] = $1
        @formatting_linker_failure = true
      end

      if text =~ LINKER_DUPLICATE_SYMBOLS_HEADER_MATCHER
        current_linker_failure[:message] = "Duplicate symbols found"
      end
      return unless @formatting_linker_failure

      case text
      when LINKER_DUPLICATE_SYMBOLS_HEADER_MATCHER
        current_linker_failure[:body] << $1.rstrip
      when SYMBOL_REFERENCED_FROM_MATCHER
        current_linker_failure[:body] << $1.rstrip
      when LINKER_UNDEFINED_SYMBOL_LOCATION_MATCHER
        current_linker_failure[:body] << $1.rstrip
      when LINKER_DUPLICATE_SYMBOLS_LOCATION_MATCHER
        current_linker_failure[:body] << "    " + $1.rstrip.split("/").last
      end

      if text =~ LINKER_UNDEFINED_SYMBOLS_FOOTER_MATCHER ||
         text =~ LINKER_DUPLICATE_SYMBOLS_FOOTER_MATCHER
        current_linker_failure[:complete] = true
      end
    end

    def update_runtime_error_state(text)
      case text
      when THREAD_SANITIZER_HEADER_MATCHER
        @formatting_runtime_error = true
        current_runtime_issue[:sanitizer] = "ThreadSanitizer"
      when ADDRESS_SANITIZER_HEADER_MATCHER
        @formatting_runtime_error = true
        current_runtime_issue[:sanitizer] = "AddressSanitizer"
      when UNDEFINED_BEHAVIOR_SANITIZER_HEADER_MATCHER
        @formatting_runtime_error = true
        current_runtime_issue[:sanitizer] = "UndefinedBehaviorSanitizer"
      end

      return unless @formatting_runtime_error

      if text =~ THREAD_SANITIZER_SUMMARY_MATCHER
        current_runtime_issue[:reason] = $1
      elsif text =~ ADDRESS_SANITIZER_SUMMARY_MATCHER
        current_runtime_issue[:reason] = $1
      elsif text =~ UNDEFINED_BEHAVIOR_SANITIZER_SUMMARY_MATCHER
        current_runtime_issue[:reason] = $2
      end

      case text
      when THREAD_SANITIZER_FOOTER_MATCHER
        current_runtime_issue[:complete] = true
      when ADDRESS_SANITIZER_FOOTER_MATCHER
        current_runtime_issue[:complete] = true
      when UNDEFINED_BEHAVIOR_SANITIZER_FOOTER_MATCHER
        current_runtime_issue[:info] << $1
        current_runtime_issue[:complete] = true
      else
        current_runtime_issue[:info] << text
      end
    end

    # TODO: clean up the mess around all this
    def should_format_error?
      @formatting_error && error_or_warning_is_present
    end

    def should_format_warning?
      @formatting_warning && error_or_warning_is_present
    end

    def should_format_runtime_error?
      @formatting_runtime_error && runtime_error_is_complete
    end

    def runtime_error_is_complete
      current_runtime_issue[:complete]
    end

    def error_or_warning_is_present
      current_issue[:reason] && current_issue[:cursor] && current_issue[:line]
    end

    def should_format_undefined_duplicate_symbols?
      current_linker_failure[:complete]
    end

    def current_issue
      @current_issue ||= {}
    end

    def current_linker_failure
      @current_linker_failure ||= {files: [], body: []}
    end

    def current_runtime_issue
      @current_runtime_issue ||= {info: +""}
    end

    def format_compile_error
      error = current_issue.dup
      @current_issue = {}
      @formatting_error = false
      formatter.format_compile_error(error[:file_name],
                                     error[:file_path],
                                     error[:reason],
                                     error[:line],
                                     error[:cursor])
    end

    def format_compile_warning
      warning = current_issue.dup
      @current_issue = {}
      @formatting_warning = false
      formatter.format_compile_warning(warning[:file_name],
                                       warning[:file_path],
                                       warning[:reason],
                                       warning[:line],
                                       warning[:cursor])
    end

    def format_runtime_error
      runtime_error = current_runtime_issue.dup
      @current_runtime_issue = nil
      @formatting_runtime_error = false
      formatter.format_runtime_error(runtime_error[:sanitizer],
                                     runtime_error[:reason],
                                     runtime_error[:info])
    end

    def format_undefined_duplicate_symbols
      result = formatter.format_undefined_duplicate_symbols(
        current_linker_failure[:message],
        current_linker_failure[:body]
      )
      reset_linker_format_state
      result
    end

    def reset_linker_format_state
      @current_linker_failure = nil
      @formatting_linker_failure = false
    end

    def store_failure(file: nil, test_suite: nil, test_case: nil, reason: nil)
      failures_per_suite[test_suite] ||= []
      failures_per_suite[test_suite] << {
        file_path: file,
        reason: reason,
        test_case: test_case
      }
    end

    def failures_per_suite
      @failures_per_suite ||= {}
    end

    def format_summary_if_needed(executed_message)
      return "" unless should_format_summary?

      @formatted_summary = true
      formatter.format_test_summary(executed_message, failures_per_suite)
    end

    def should_format_summary?
      @tests_done && !@formatted_summary
    end

    def unescaped(*escaped_values)
      escaped_values.map { |v| v.delete('\\') }
    end

  end
end
