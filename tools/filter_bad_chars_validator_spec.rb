# encoding: utf-8
require 'spec_helper'

describe FilterBadCharsValidator do

  let(:filter_bad_chars_validator) { FilterBadCharsValidator.new({ attributes: [nil] }) }
  let(:item) { mock_model("Item", name: "John") }


  it "is valid by default" do
    expect(item).to be_valid
  end


  bad_chars = %w[~ * ? $ § % ° < > # ! + , : ; _ & / \\ @ ( ) [ ] { } | " ]
  bad_chars.each do |char|
    it "filters bad character #{char}" do
      expect(item).to receive(:name).and_return("John #{char}")

      filter_bad_chars_validator.validate_each(item, :name, item.name)
      expect(item).to respond_to(:name)
      expect(item).to be_valid
      expect(item).to have(0).error_on(:name)
      expect(item.name).to eq("John")
    end
  end
end
