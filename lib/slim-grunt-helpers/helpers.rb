# Required so that if you include only the helpers file, version is still there
require 'slim-grunt-helpers/version'
require 'slim-grunt-helpers/models'

module SlimGruntHelpers

  module Helpers

    def sg_enclose_newline
      %Q{\n#{ yield }\n}
    end

    # Options:
    # - `alt` which allows to set alternate paths which usemin should look into
    def sg_usemin_css(path, options={})
      usemin  = SlimGruntHelpers::Models::UseminCss.new
      options = { alt: nil }.merge!(options)

      alt = ''
      alt = "(#{ options[:alt] })" unless options[:alt].nil?

      text  = "\n<!-- build:css#{ alt } #{ path } -->\n"
      yield(usemin)
      usemin.each do |link|
        text << "#{ link }\n"
      end
      text << "\n<!-- endbuild -->"
    end

    # Options:
    # - `alt` which allows to set alternate paths which usemin should look into
    def sg_usemin_js(path, options={})
      usemin  = SlimGruntHelpers::Models::UseminJs.new
      options = { alt: nil }.merge!(options)

      alt = ''
      alt = "(#{ options[:alt] })" unless options[:alt].nil?

      text  = "\n<!-- build:js#{ alt } #{ path } -->\n"
      yield(usemin)
      usemin.each do |link|
        text << "#{ link }\n"
      end
      text << "\n<!-- endbuild -->"
    end
    
  end

end