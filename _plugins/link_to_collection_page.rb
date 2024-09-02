# frozen_string_literal: true

module Jekyll
  #
  # Collection of methods for linking to collection pages
  module LinkToCollectionPage
    #
    # Generate ancher link to given member name if their page exist
    #
    # @param name [String] the full_name of the member
    # @param html_attributes [String] optional html attributes
    #
    # @return [String] the ancher link to given member name if their page exist, otherwise the given name
    #
    def link_to_member_page(name, html_attributes = '')
      site = @context.registers[:site]
      members = site.collections['members']

      the_member = members.docs.select { |m| m.data['full_name'] == name }.first

      return name unless the_member

      <<~HTML
        <a href="#{the_member.url}" #{html_attributes}>
          #{name}
        </a>
      HTML
    end

    #
    # Generate ancher link to given member name if their page exist
    #
    # @param name [String|Array<String>] the full_name of the member or members
    # @param html_attributes [String] optional html attributes
    #
    # @return [String|Array<String>] the ancher link to given member name if their page exist, otherwise the given name
    #
    def linkify_names(names, html_attributes = '')
      return link_to_member_page(names, html_attributes) unless names.is_a? Array

      names.map do |name|
        link_to_member_page(name, html_attributes)
      end
    end
  end
end

Liquid::Template.register_filter(Jekyll::LinkToCollectionPage)
