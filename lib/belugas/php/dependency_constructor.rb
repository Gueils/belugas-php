module Belugas
  module Php
    class DependencyConstructor
      def initialize(composer_path, database_path)
        @composer_path = composer_path
        @database_path = database_path
      end

      def dependencies
        build_dependencies.compact
      end

      private

      attr_reader :composer_path, :database_path

      def build_dependencies
        if @database_path.empty?
          [composer, framework]
        else
          [database, composer, framework]
        end
      end

      def composer
        Belugas::Php::Parser::Composer.new(composer_path)
      end

      def framework
        framework = Belugas::Php::Parser::Framework.new(composer_path)
        framework if framework.available?
      end

      def database
        Belugas::Php::Parser::Database.new(database_path)
      end

    end
  end
end
