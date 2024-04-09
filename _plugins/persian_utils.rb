# frozen_string_literal: true
require 'parsi-date'

module Jekyll
  # Set of utility methods for Persian language
  module PersianUtils
    def to_persian_digit(input)
      input.tr('0123456789', '۰۱۲۳۴۵۶۷۸۹')
    end

    def to_jalali(input, format = nil)
      jalali_date = input.to_parsi

      return jalali_date.to_s unless format

      jalali_date.strftime(format)
    end
  end
end

Liquid::Template.register_filter(Jekyll::PersianUtils)
