# -*- coding: UTF-8 -*-
=begin
  suggest paramenters for parsing:
    - col_sep
    - headers
    - quote_char
    - description_column_indices
    - money_column_indices
    - date_column_indices

=end

module Reckon
  class Classifier
    attr_accessor :raw_source
    CSV_SEPARATORS = [",", ";", "\t"]
    def initialize(raw_source)
      @raw_source = raw_source
    end


    def guess_col_sep
      counts = CSV_SEPARATORS.map{|x| raw_source.count(x)}
      CSV_SEPARATORS[counts.index(counts.max)]
    end

    # TODO not working atm
    def guess_cent_separator
      cent_dots_count = raw_source.scan(/\.\d{2}/).size
      cent_comma_count = raw_source.scan(/\,\d{2}/).size
      cent_dots_count > cent_comma_count ? "." : ","
    end
  end
end

