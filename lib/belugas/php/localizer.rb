module Belugas
  module Php
    class Localizer
      def initialize(directory_path)
        @directory_path = directory_path
      end

      def composer_path
        "#{directory_path}/composer.json"
      end

      def database_path
        if files_for_database.empty?
          ''
        else
          files_for_database.split("\n").first
        end
      end

      private

      attr_reader :directory_path

      def files_for_database
        @files_for_database ||= `#{command_search}`
      end

      def command_search
        "find #{directory_path} -type d | find #{directory_path} -name 'database.php'"
      end
    end
  end
end


