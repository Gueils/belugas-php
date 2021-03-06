require 'belugas/php/standard_names/base'

module Belugas
  module Php
    module Feature
      class Builder
        def initialize(dependency)
          @dependency = dependency
        end

        def attributes
          {
            'type' => @dependency.type,
            'name' => @dependency.name,
            'version' => @dependency.version,
            'description' => @dependency.description,
            'content' => '',
            'categories' => @dependency.categories,
            'cue_locations' => [''],
            'engines' => ['belugas', 'belugas-php']
          }
        end
      end
    end
  end
end
