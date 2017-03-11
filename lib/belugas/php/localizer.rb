module Belugas
  module Php
    class Localizer

      def initialize directory_path
        @directory_path = directory_path
      end

      def composer_path
        "#{directory_path}/composer.json"
      end

      def database_path
        files = `#{search_path}`
        if files.empty?
          ""
        else
          files.split("\n").first
        end
      end

      private

      attr_reader :directory_path

      def search_path
        "find #{directory_path} -type d | find #{directory_path} -name 'database.php'"
      end
    end
  end
end
