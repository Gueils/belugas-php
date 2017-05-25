require 'simplecov'
SimpleCov.start

$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'belugas/php'
require 'belugas/php/parser/base'
require 'belugas/php/parser/composer'
require 'belugas/php/parser/database'
require 'belugas/php/parser/framework'
require 'belugas/php/parser/framework_data'
require 'belugas/php/feature/builder'
require 'belugas/php/standard_names/base'
require 'belugas/php/fallback_versions/base'
require 'belugas/php/localizer'
