# frozen_string_literal: true

module Jekyll
  # Set of utility methods for Persian language
  module PersianUtils
    def to_persian_digit(input)
      input.tr('0123456789', '۰۱۲۳۴۵۶۷۸۹')
    end
  end
end

Liquid::Template.register_filter(Jekyll::PersianUtils)
