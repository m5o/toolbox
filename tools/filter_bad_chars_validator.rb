# encoding: utf-8

class FilterBadCharsValidator < ActiveModel::EachValidator

  BAD_CHARACTERS = /[~*?$§%°<>#!+,:;_&\/\\@()\[\]{}|"]/i

  def validate_each(record, attribute, value)
    value.gsub!(BAD_CHARACTERS,'') unless value.nil?
  end
end
