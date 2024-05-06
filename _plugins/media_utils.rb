# frozen_string_literal: true

module Jekyll
  module MediaUtils
    #
    # Generate iframe for embed video url
    class EmbedVideo < Liquid::Tag
      def initialize(tag_name, url, tokens)
        super
        @url = url.strip
      end

      def render(_)
        <<~HTML
          <iframe
            src="#{@url}"
            class="w-full aspect-video bg-gray-200"
            frameborder="0"
            webkitallowfullscreen="true"
            mozallowfullscreen="true"
            allowfullscreen>
          </iframe>
        HTML
      end
    end
  end
end

Liquid::Template.register_tag('embed_video', Jekyll::MediaUtils::EmbedVideo)
