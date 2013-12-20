# encoding: utf-8

# Removes all chars that are not in ISO-8859-1 range
# http://www.utf8-chartable.de/unicode-utf8-table.pl
#
class IsoValidator < ActiveModel::EachValidator

  ISO_8859_1 = /[^\s!-z{|}~¡-ÿ]+/

  def validate_each(record, attribute, value)
    i18n = I18n.t 'is_iso_8859_1', scope: [:errors, :messages]

    record.errors[attribute] << i18n if value =~ ISO_8859_1
  end
end
