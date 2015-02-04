# encoding: UTF-8
require 'spec_helper'

describe ControllersHelper do

  describe "#controller?" do
    before do
      allow(helper).to receive(:params).and_return(controller: "contents")
    end

    it "returns true if contoller match" do
      expect(helper.controller?("contents")).to be true
    end

    it "returns true if match any" do
      expect(helper.controller?("contents", "users")).to be true
    end
  end


  describe "#action?" do
    before do
      allow(helper).to receive(:params).and_return(action: "index")
    end

    it "returns true if action match" do
      expect(helper.action?("index")).to be true
    end

    it "returns false if action didn't match" do
      expect(helper.action?("new")).to be false
    end
  end

end
