require 'slim-grunt-helpers/models/usemin'

module SlimGruntHelpers

  module Models

    class UseminJs < Usemin

      BASE_OPTIONS = {}.freeze

      protected

        def transform_link(link)
          text  = %Q{<script src="#{ link[:path] }"}
          link[:options].each do |key, value|
            if value == true
              text << %Q{ #{ key }}
            elsif value
              text << %Q{ #{ key }="#{ value }"}
            end
          end
          text << '></script>'

          text
        end

    end

  end

end