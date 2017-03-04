require 'belugas/php/parser/composer'

module Belugas
  module Php
    class Dispatcher

      def initialize(path)
        @requirements = Belugas::Php::Parser::Composer.new(path)
      end

      def render
        features.each do |feature|
          STDOUT.print feature.to_json
          STDOUT.print "\0"
        end
      end

      private

      def dependencies
        @dependencies ||= Belugas::Php::LibrariesCollection.new(@requirements.requirements).dependencies
      end

      def features
        @features ||= dependencies.map do |dependency|
          Belugas::Php::Feature::Builder.new(dependency).attributes
        end << python_feature
      end

      def python_feature
       @python_feature ||= {
          "type" => "feature",
          "name" => "Php",
          "version" => "2.7",
          "description" => "The application uses PHP code",
          "categories" => ["Language"]
        }
      end

    end
  end
end
