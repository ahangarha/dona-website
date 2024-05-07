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

    #
    # Get icon for different services
    #
    # @author Mostafa Ahangarga <<ahangraha@riseup.net>>
    #
    class Icon < Liquid::Tag
      def initialize(tag_name, args, tokens)
        super

        @icon_name, @svg_attributes = args.downcase.split(' ', 2)

        @icons = {}
      end

      def render(context)
        @icon_name = context['icon_name']

        icon(@icon_name)
      end

      private

      def icon(name)
        load_icon(name.split('_').first) || load_icon('default')
      end

      def load_icon(name)
        return @icons[name] unless @icons[name].nil?

        file_path = File.join(File.dirname(__FILE__), "media_utils_icons/#{name}.svg")

        file_data = ''

        File.open(file_path) do |file|
          file_data = file.read
        end

        @icons[name] = file_data.sub('<svg', "<svg #{@svg_attributes}")

        @icons[name]
      rescue Errno::ENOENT
        nil
      end
    end
  end
end

Liquid::Template.register_tag('embed_video', Jekyll::MediaUtils::EmbedVideo)
Liquid::Template.register_tag('icon', Jekyll::MediaUtils::Icon)
