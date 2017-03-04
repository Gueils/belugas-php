require 'belugas/php/parser/composer'

module Belugas
  module Php
    class Dispatcher

      def initialize(path)
        @composer = Belugas::Php::Parser::Composer.new(path)
        @database = Belugas::Php::Parser::Database.new(path)
        @framework = Belugas::Php::Parser::Framework.new(path)
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
