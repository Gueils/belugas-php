require 'pry'
module Belugas
  module Php
    module Parser
      class Database
        attr_reader :content
        DATABASE_MATCHES_REGEX = /(?:(?<gq>['])(?<name>[a-zA-Z0-9\-_\.]+)\k<gq>|%q<(?<name>[a-zA-Z0-9\-_\.]+)>)/
        DB_CONNECTION = "'DB_CONNECTION'"

        def initialize(path)
          @content = File.read(path)
        end

        def name
          position = database_matches.index(DB_CONNECTION) + 1
          database_matches[position].tr("'","")
        end

        def version
          "1234"
        end

        private

        def database_matches
          @database_matches ||= content.gsub(DATABASE_MATCHES_REGEX).to_a
        end
          
      end
    end
  end
end
