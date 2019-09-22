# frozen_string_literal: true

require 'shellwords'

module XCPretty

  class Simple < Formatter

    PASS = "✓"
    FAIL = "✗"
    PENDING = "⧖"
    COMPLETION = "▸"
    MEASURE = '◷'

    ASCII_PASS = "."
    ASCII_FAIL = "x"
    ASCII_PENDING = "P"
    ASCII_COMPLETION = ">"
    ASCII_MEASURE = 'T'

    INDENT = "    "

    def format_analyze(file_name, file_path, build_target)
      format("Analyzing", file_name, build_target: build_target)
    end

    def format_build_target(target, project, configuration)
      format("Building", "#{project}/#{target} [#{configuration}]")
    end

    def format_aggregate_target(target, project, configuration)
      format("Aggregate", "#{project}/#{target} [#{configuration}]")
    end

    def format_analyze_target(target, project, configuration)
      format("Analyzing", "#{project}/#{target} [#{configuration}]")
    end

    def format_clean_target(target, project, configuration)
      format("Cleaning", "#{project}/#{target} [#{configuration}]")
    end

    def format_compile(file_name, file_path, build_target)
      format("Compiling", file_name, build_target: build_target)
    end

    def format_compile_swift_sources(build_target)
      format("Compiling Swift sources", build_target: build_target)
    end

    def format_compile_swift(build_target)
      format("Compiling Swift to bytecode", build_target: build_target)
    end

    def format_precompile_swift_bridging_header(build_target)
      format("Precompiling Swift bridging header", build_target: build_target)
    end

    def format_swift_code_generation_command(file_path, build_target)
      format("Generating object file from", File.basename(file_path),
             build_target: build_target)
    end

    def format_merge_swift_module_command(module_path, build_target)
      format("Merging Swift module", File.basename(module_path), build_target: build_target)
    end

    def format_copy_swift_libs(app_path, build_target)
      format("Copying Swift libs for", File.basename(app_path),
             build_target: build_target)
    end

    def format_compile_metal(file_name, file_path, build_target)
      format("Compiling", file_name, build_target: build_target)
    end

    def format_compile_xib(file_name, file_path, build_target)
      format("Compiling", file_name, build_target: build_target)
    end

    def format_compile_storyboard(file_name, file_path, build_target)
      format("Compiling", file_name, build_target: build_target)
    end

    def format_compile_asset_catalog(file_path, build_target)
      format("Compiling asset catalog", file_path, build_target: build_target)
    end

    def format_copy_header_file(source, target, build_target)
      format("Copying", File.basename(source), build_target: build_target)
    end

    def format_sym_link(source, target, build_target)
      format("SymLink", File.basename(source), build_target: build_target)
    end

    def format_create_build_directory(directory_path, build_target)
      format("Creating build directory", directory_path, build_target: build_target)
    end

    def format_mkdir(directory_name, build_target)
      format("Mkdir", directory_name, build_target: build_target)
    end

    def format_process_product_packaging(entitlements, package_name, build_target)
      format("Processing product packaging", "#{entitlements} for app #{package_name}",
             build_target: build_target)
    end

    def format_ditto(source_file, target_file, build_target)
      format("Ditto", "#{source_file} #{target_file}", build_target: build_target)
    end

    def format_compile_dtrace_script(file_name, build_target)
      format("Compiling DTrace script", file_name, build_target: build_target)
    end

    def format_copy_png_file(source_file, target_file, build_target)
      format("Copying PNG file", source_file, build_target: build_target)
    end

    def format_copy_tiff_file(source_file, target_file, build_target)
      format("Copying TIFF file", source_file, build_target: build_target)
    end

    def format_link_storyboards(build_target)
      format("Linking storyboards", build_target: build_target)
    end

    def format_note(note_content)
      format("Note:", note_content)
    end

    def format_write_auxiliary_file(file_name, build_target)
      format("Writing auxiliary file", file_name, build_target: build_target)
    end

    def format_processing_file(file_path, build_target)
      format("Processing", file_path, build_target: build_target)
    end

    def format_signing_identity(identity)
      format("Signing identity", "\"#{identity}\"")
    end

    def format_provisioning_profile(profile)
      format("Provisioning profile", "\"#{profile}\"")
    end

    def format_copy_plist_file(source, target, build_target)
      format("Copying", File.basename(source), build_target: build_target)
    end

    def format_copy_strings_file(file, build_target)
      format("Copying", file, build_target: build_target)
    end

    def format_cpresource(resource, build_target)
      format("Copying", resource, build_target: build_target)
    end

    def format_script_rule_execution(file_name, file_path, build_target)
      format("Running script rule", file_name.to_s, build_target: build_target)
    end

    def format_generate_dsym(dsym, build_target)
      format("Generating '#{dsym}'", build_target: build_target)
    end

    def format_libtool(library, build_target)
      format("Building library", library, build_target: build_target)
    end

    def format_linking(target, build_variants, arch, build_target)
      format("Linking", target, build_target: build_target)
    end

    def format_linking_metal(target, build_target)
      format("Linking", target, build_target: build_target)
    end

    def format_failing_test(suite, test_case, reason, file)
      INDENT + format_test("#{test_case}, #{reason}", :fail)
    end

    def format_passing_test(suite, test_case, time)
      INDENT + format_test("#{test_case} (#{colored_time(time)} seconds)",
                           :pass)
    end

    def format_pending_test(suite, test_case)
      INDENT + format_test("#{test_case} [PENDING]", :pending)
    end

    def format_measuring_test(suite, test_case, time)
      INDENT + format_test(
        "#{test_case} measured (#{colored_time(time)} seconds)", :measure
      )
    end

    def format_phase_success(phase_name)
      format(phase_name.capitalize, "Succeeded")
    end

    def format_phase_script_execution(script_name, build_target)
      format("Running script", "'#{script_name}'", build_target: build_target)
    end

    def format_process_info_plist(file_name, file_path, build_target)
      format("Processing", file_name, build_target: build_target)
    end

    def format_process_pch(language, file, build_target)
      format("Precompiling #{language}", file, build_target: build_target)
    end

    def format_strip(file, build_target)
      format("Stripping", file, build_target: build_target)
    end

    def format_chown(owner, file, build_target)
      format("chown #{owner}", file, build_target: build_target)
    end

    def format_chmod(mode, file, build_target)
      format("chmod #{mode}", file, build_target: build_target)
    end

    def format_validate(file, build_target)
      format("Validating", file, build_target: build_target)
    end

    def format_codesign(file, build_target)
      format("Signing", file, build_target: build_target)
    end

    def format_preprocess(file, build_target)
      format("Preprocessing", file, build_target: build_target)
    end

    def format_pbxcp(file, build_target)
      format("Copying", file, build_target: build_target)
    end

    def format_test_run_started(name)
      heading("Test Suite", name, "started")
    end

    def format_test_suite_started(name)
      heading("", name, "")
    end

    def format_touch(file_path, file_name, build_target)
      format("Touching", file_name, build_target: build_target)
    end

    def format_tiffutil(file_name, build_target)
      format("Validating", file_name, build_target: build_target)
    end

    def format_warning(message, build_target)
      warning = INDENT + yellow(message)
      build_target ? "[" + build_target + "] " + warning : warning
    end

    def format_check_dependencies
      format('Check Dependencies')
    end

    private

    def heading(prefix, text, description)
      [prefix, white(text), description].join(" ").strip
    end

    def format(command, argument_text="", success=true, build_target: nil)
      symbol = status_symbol(success ? :completion : :fail)
      formatted_text = [symbol, white(command), argument_text].join(" ").strip

      build_target ? "[" + build_target + "] " + formatted_text : formatted_text
    end

    def format_test(test_case, status)
      [status_symbol(status), test_case].join(" ").strip
    end

    def status_symbol(status)
      case status
      when :pass
        green(use_unicode? ? PASS : ASCII_PASS)
      when :fail
        red(use_unicode? ? FAIL : ASCII_FAIL)
      when :pending
        yellow(use_unicode? ? PENDING : ASCII_PENDING)
      when :error
        red(use_unicode? ? ERROR : ASCII_ERROR)
      when :completion
        yellow(use_unicode? ? COMPLETION : ASCII_COMPLETION)
      when :measure
        yellow(use_unicode? ? MEASURE : ASCII_MEASURE)
      else
        ""
      end
    end

    def colored_time(time)
      case time.to_f
      when 0..0.025
        time
      when 0.026..0.100
        yellow(time)
      else
        red(time)
      end
    end

  end
end
