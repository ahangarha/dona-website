# frozen_string_literal: true

require 'json'

module Jekyll
  module JSONParseFilter
    def parse_json(input)
      JSON.parse(input)
    end
  end
end

Liquid::Template.register_filter(Jekyll::JSONParseFilter)
