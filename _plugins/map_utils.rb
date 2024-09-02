# frozen_string_literal: true

class OsmLink < Liquid::Tag
  def initialize(tag_name, input, tokens)
    super
    @input = input
  end

  def render(context)
    lat, lon = context[@input]

    "https://www.openstreetmap.org/?mlat=#{lat}&mlon=#{lon}#map=19/#{lat}/#{lon}"
  end
end

class GeoLink < Liquid::Tag
  def initialize(tag_name, input, tokens)
    super
    @input = input
  end

  def render(context)
    lat, lon = context[@input]

    "geo:#{lat},#{lon}?z=19"
  end
end

Liquid::Template.register_tag('osm_link', OsmLink)
Liquid::Template.register_tag('geo_link', GeoLink)
