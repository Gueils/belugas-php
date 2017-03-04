require "belugas/php/parser/base"
require 'belugas/php/parser/composer'
require 'belugas/php/parser/database'
require 'belugas/php/parser/framework'
require 'belugas/php/feature/builder'

module Belugas
  module Php
    class Dispatcher

      def initialize(composer_path, database_path)
        @composer = Belugas::Php::Parser::Composer.new(composer_path)
        @framework = Belugas::Php::Parser::Framework.new(composer_path)
        @database = Belugas::Php::Parser::Database.new(database_path)
      end

      def render
        features.each do |feature|
          STDOUT.print feature.to_json
          STDOUT.print "\0"
        end
      end

      private

      def dependencies
        [@database, @composer, @framework]
      end

      def features
        @features ||= dependencies.map do |dependency|
          Belugas::Php::Feature::Builder.new(dependency).attributes
        end 
      end
    end
  end
end
