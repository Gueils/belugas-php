module Belugas
  module Php
    module Feature
      class Builder

        def initialize(dependency)
          @dependency = dependency
        end

        def attributes
          {
            "type" => @dependency.type,
            "name" => standard_name,
            "version" => @dependency.version,
            "description" => @dependency.description,
            "content" => "",
            "categories" => @dependency.categories,
            "cue_locations" => [""],
            "engines" => ["belugas", "belugas-php"]
          }
        end

        def standard_name
          Belugas::Php::StandardNames::Base::NAMES[@dependency.name]
        end
      end
    end
  end
end
