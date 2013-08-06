#encoding: utf-8

require "./spec/spec_helper"

describe Reckon::Classifier do

  describe :guess_col_sep do
    it "works for ," do
      comma_fixture = Fixtures.data[:chase_csv]
      Reckon::Classifier.new(comma_fixture).guess_col_sep.should == ","
    end

    it "works for ;" do
      colon_fixture = Fixtures.data[:german_bank_example]
      Reckon::Classifier.new(colon_fixture).guess_col_sep.should == ";"

      colon_fixture2 = Fixtures.data[:danish_kroner_nordea_example]
      Reckon::Classifier.new(colon_fixture2).guess_col_sep.should == ";"
    end
  end

  describe :guess_cent_separator do
    it "works for US" do
    end

    it "works for EU" do
      pending
      cent_comma_fixture = Fixtures.data[:german_bank_example]
      Reckon::Classifier.new(cent_comma_fixture).guess_cent_separator.should == ","
    end
  end
end