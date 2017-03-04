module Belugas
  module Php
    module Parser
      class Base
        attr_reader :content

        def initialize(path)
          @content = File.read(path)
        end

        def name
          ""
        end

        def version
          ""
        end

        def categories
          []
        end

        def description
          "The application uses #{name.upcase}"
        end

        def type
          "feature"
        end
      end
    end
  end
end
