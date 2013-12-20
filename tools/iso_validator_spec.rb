# encoding: utf-8
require 'spec_helper'

describe IsoValidator do

  let(:iso_validator) { IsoValidator.new({ attributes: [nil] }) }
  let(:item) { mock_model("Item") }


  it "is valid by default" do
    expect(item).to be_valid
  end


  describe "valid ISO 8859-1 validations" do
    iso_chars_valid = %w[0 1 2 3 4 5 6 A B C D E F G H i j k l m n o p q r s t u v w x y z < = > ! " # $ % & ( ) { } | \ * + , . - ¡ ¢ £ ¤ ¥ © « ® ¯ ± ² ³ µ ¶ · » ¼ ¿ Å È Ð Ñ Ò × Ø æ ç ð ÷ ø û ý þ ÿ]

    iso_chars_valid.each do |char|
      it "accept valid ISO 8859-1 character #{char} for input" do
        iso_validator.validate_each(item, :name, char)
        expect(item).to have(0).error_on(:name)
      end
    end
  end


  describe "invalid ISO 8859-1 validations" do
    iso_chars_invalid = %w[Ā č Ē Ė Ł ĝ Ő Œ ƀ ƅ Ɠ Ƙ ƛ Ɯ Ɵ ƥ Ʃ Ʈ ƾ Ǆ ǵ Ƕ Ͷ ͼ Ώ Θ Φ Ψ α η κ π ϐ ϖ ϟ Ϫ Ϥ ϴ Ƨ Ǝ ϻ ϼ Ϣ Ӝ Ӟ Ӫ Ӯ Ӵ Ӹ Ӻ Σ Ϻ λ ̏ ̊ ʬ ʢ ʞ ʛ ʚ ʘ  ლ ಠ 益 ʕ • ᴥ • ʔ ˘ ♥ ジ]

    iso_chars_invalid.each do |char|
      it "rejects invalid ISO 8859-1 character #{char}" do
        iso_validator.validate_each(item, :name, char)
        expect(item).to have(1).error_on(:name)
      end
    end
  end

end
