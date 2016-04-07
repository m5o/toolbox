# encoding: UTF-8
require 'spec_helper'

describe ControllersHelper do

  describe "#namespace?" do
    before do
      allow(helper).to receive(:params).and_return(controller: "admin/contents")
    end

    it "returns true if match" do
      expect(helper.namespace?("admin")).to be true
    end

    it "returns true if match any" do
      expect(helper.namespace?("admin", "application")).to be true
    end

    it "returns false if didn't match" do
      expect(helper.namespace?("application")).to be false
    end
  end

  describe "#controller?" do
    before do
      allow(helper).to receive(:params).and_return(controller: "contents")
    end

    it "returns true if match" do
      expect(helper.controller?("contents")).to be true
    end

    it "returns true if match any" do
      expect(helper.controller?("contents", "users")).to be true
    end

    it "returns false if didn't match any" do
      expect(helper.controller?("application", "users")).to be false
    end
  end


  describe "#action?" do
    before do
      allow(helper).to receive(:params).and_return(action: "index")
    end

    it "returns true if match" do
      expect(helper.action?("index")).to be true
    end

    it "returns true if match any" do
      expect(helper.action?("index", "new")).to be true
    end

    it "returns false if didn't match" do
      expect(helper.action?("new")).to be false
    end
  end


  describe "#is_active?" do
    it "returns 'active' if action match" do
      allow(helper).to receive(:current_page?).with(root_url).and_return(true)
      expect(helper.is_active?("http://test.host/")).to eq "active"
    end

    it "returns custom css class if action match" do
      allow(helper).to receive(:current_page?).with(root_url(host: "test.host", locale: :en)).and_return(true)
      expect(helper.is_active?("http://test.host/en", "custom-active")).to eq "custom-active"
    end

    it "returns nil if action didn't match" do
      allow(view).to receive(:current_page?).and_return(false)
      expect(helper.is_active?(controller: "invalid")).to eq nil
    end
  end

end
