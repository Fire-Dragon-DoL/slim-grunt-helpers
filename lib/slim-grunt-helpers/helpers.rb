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
    # - `absolute` which ensures all files are prepended with '/' when true
    def sg_usemin_css(path, options={})
      usemin  = SlimGruntHelpers::Models::UseminCss.new
      options = { alt: nil, absolute: false }.merge!(options)

      alt = ''
      alt = "(#{ options[:alt] })" unless options[:alt].nil?

      text  = "\n<!-- build:css#{ alt } #{ path } -->\n"
      yield(usemin)
      usemin.each(options) do |link|
        text << "#{ link }\n"
      end
      text << "<!-- endbuild -->\n"
    end

    # Options:
    # - `alt` which allows to set alternate paths which usemin should look into
    # - `absolute` which ensures all files are prepended with '/' when true
    def sg_usemin_js(path, options={})
      usemin  = SlimGruntHelpers::Models::UseminJs.new
      options = { alt: nil, absolute: false }.merge!(options)

      alt = ''
      alt = "(#{ options[:alt] })" unless options[:alt].nil?

      text  = "\n<!-- build:js#{ alt } #{ path } -->\n"
      yield(usemin)
      usemin.each(options) do |link|
        text << "#{ link }\n"
      end
      text << "<!-- endbuild -->\n"
    end

    def sg_empty_href
      'javascript:void(0);'
    end
    
  end

end