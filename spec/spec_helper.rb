# frozen_string_literal: true

$LOAD_PATH.unshift('.', __FILE__)
require "lib/xcpretty/ansi"
require "support/matchers/colors"
require "fixtures/constants"

# rubocop:disable Style/MixinUsage
include XCPretty::ANSI
# rubocop:enable Style/MixinUsage
