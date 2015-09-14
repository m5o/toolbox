require 'rails_helper'

RSpec.describe ContentHelper, type: :helper do

  describe "#format_iban" do
    it { expect(helper.format_iban(nil)).to eq "" }
    it { expect(helper.format_iban("DE981234567891012345")).to eq "DE98 1234 5678 9101 2345" }
    it { expect(helper.format_iban("DE9812345678910123")).to eq "DE98 1234 5678 9101 23" }
  end

end
