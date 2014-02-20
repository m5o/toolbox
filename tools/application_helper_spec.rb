# encoding: utf-8
require 'spec_helper'

# Specs in this file have access to a helper object that includes
# the ApplicationHelper. For example:
#
# describe ApplicationHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq "this that"
#     end
#   end
# end
describe ApplicationHelper do

  describe "#title_element" do
    before do
      @page = Page::MyShop::Basic.new
    end

    it "sets the title element with predefined title" do
      expect(helper.title_element).to match(/title/)
      expect(helper.title_element).to match(/My fancy Rails Shop - /)
    end
  end


  describe "#description_meta_tag" do
    before do
      @page = Page::MyShop::Basic.new
    end

    it "sets the meta element with predefined keywords" do
      expect(helper.description_meta_tag).to match(/meta/)
      expect(helper.description_meta_tag).to match(/custom meta desc/)
    end
  end


  describe "#keywords_meta_tag" do
    before do
      @page = Page::MyShop::Basic.new
    end

    it "sets the meta element with predefined keywords" do
      expect(helper.keywords_meta_tag).to match(/meta/)
      expect(helper.keywords_meta_tag).to match(/some useless keywords/)
    end
  end


  describe "#body_element" do
    before do
      helper.stub(:action_name).and_return("index")
      helper.stub(:controller_path).and_return("contents")
    end

    it "sets the body element with a id equals to 'controller_path'_'action_name'" do
      expect(helper.body_element).to match(/id=\"contents_index\"/)
      expect(helper.body_element).to match(/body/)
    end
  end

end
