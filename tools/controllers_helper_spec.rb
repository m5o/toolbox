# encoding: UTF-8
require 'spec_helper'

describe ControllersHelper do

  describe "#controller?" do
    before do
      helper.stub(:params).and_return({ controller: "contents" })
    end

    it "returns true if contoller match" do
      helper.controller?("contents").should be true
    end

    it "returns true if match any" do
      helper.controller?("contents", "users").should be true
    end
  end


  describe "#action?" do
    before do
      helper.stub(:params).and_return({ action: "index" })
    end

    it "returns true if action match" do
      helper.action?("index").should be true
    end

    it "returns false if action didn't match" do
      helper.action?("new").should be false
    end
  end

end
