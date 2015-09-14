module ContentHelper do

  def format_iban(iban)
    return "" if iban.nil?
    iban.scan(/.{1,4}/).join(' ')
  end

end
