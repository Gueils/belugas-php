require 'belugas/php/parser/base'
require 'belugas/php/parser/composer'
require 'belugas/php/parser/database'
require 'belugas/php/parser/framework'
require 'belugas/php/feature/builder'

module Belugas
  module Php
    class Dispatcher
      def initialize(dependency_constructor)
        @dependency_constructor = dependency_constructor
      end

      def render
        features.each do |feature|
          STDOUT.print feature.to_json
          STDOUT.print "\0"
        end
      end

      private

      def features
        @features ||= @dependency_constructor.dependencies.map do |dependency|
          Belugas::Php::Feature::Builder.new(dependency).attributes
        end
      end
    end
  end
end
