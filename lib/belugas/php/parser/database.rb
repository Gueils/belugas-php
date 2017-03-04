module Belugas
  module Php
    module Parser
      class Database < Base
        DATABASE_MATCHES_REGEX = /(?:(?<gq>['])(?<name>[a-zA-Z0-9\-_\.]+)\k<gq>|%q<(?<name>[a-zA-Z0-9\-_\.]+)>)/
        DB_CONNECTION = "'DB_CONNECTION'"


        def name
          position = database_matches.index(DB_CONNECTION) + 1
          database_matches[position].tr("'","")
        end

        def categories
          ["Database"]
        end

        private

        def database_matches
          @database_matches ||= content.gsub(DATABASE_MATCHES_REGEX).to_a
        end
          
      end
    end
  end
end
