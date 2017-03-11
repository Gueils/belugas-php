module Belugas
  module Php
    class DependencyConstructor

      def initialize composer_path, database_path
        @composer_path = composer_path
        @database_path = database_path
      end

      def dependencies
        if @database_path.empty?
          [composer, framework]
        else
          [database, composer, framework]
        end
      end

      private

      attr_reader :composer_path, :database_path

      def composer
        Belugas::Php::Parser::Composer.new(composer_path)
      end

      def framework
        Belugas::Php::Parser::Framework.new(composer_path)
      end

      def database
        Belugas::Php::Parser::Database.new(database_path)
      end
    end
  end
end
