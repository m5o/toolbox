# encoding: utf-8
require 'spec_helper'

describe ReduceValidator do

  let(:reduce_validator) { ReduceValidator.new({ attributes: [nil] }) }
  let(:item) { mock_model("Item") }


  before do
    item.errors.add(:name, "message one")
    item.errors.add(:name, "message two")
  end

  it { expect(item).to have(2).errors_on(:name) }

  it "reduces error messages" do
    reduce_validator.validate_each(item, :name, '')
    expect(item).to have(1).error_on(:name)
  end

end
