# frozen_string_literal: true

require 'parsi-date'
require 'bidify'

module Jekyll
  # Set of utility methods for Persian language
  module PersianUtils
    #
    # Convert Latin digits into Persian digits
    #
    # @param input [String] the given string to be manipulated
    #
    # @return [String] The string with converted digits
    #
    def to_persian_digit(input)
      input.tr('0123456789', '۰۱۲۳۴۵۶۷۸۹')
    end

    #
    # Convert Gregorian into Jalali date
    #
    # @param input [String] Gregorian date
    # @param format [String] standard strftime format
    #
    # @return [String] Jalali date
    #
    def to_jalali(input, format = '')
      jalali_date = input.to_parsi

      jalali_date.strftime(format)
    end

    #
    # Modify the parsed html content to support bidirectional text
    #
    # @param content [String] The html content
    #
    # @return [String] Bidified html content
    #
    def bidify(content)
      Bidify.bidify_html_string(content)
    end
  end
end

Liquid::Template.register_filter(Jekyll::PersianUtils)
