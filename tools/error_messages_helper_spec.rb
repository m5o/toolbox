# encoding: utf-8
require 'spec_helper'

describe ErrorMessagesHelper do

  describe "#error_messages_for" do
    before do
      @model = mock_model(User)
      @model.errors.add(:name, "error message")
    end

    it "display error messages as html" do
      expect(helper.error_messages_for(@model).to include '<div class="alert alert-danger alert-form">'
      expect(helper.error_messages_for(@model).to include '<a class="close" data-dismiss="alert" href="#">&times;</a>'
      expect(helper.error_messages_for(@model).to include '<h4 class="alert-headline">'
      expect(helper.error_messages_for(@model).to include '<p class="alert-text">'
      expect(helper.error_messages_for(@model).to include '<ul><li>Name error message</li></ul>'
    end
  end


  describe "FormBuilderAdditions" do
    before do
      @template = Object.new.extend ActionView::Helpers::FormHelper
      @template.extend ErrorMessagesHelper
      @object = mock_model(User)
      @builder = ActionView::Helpers::FormBuilder.new(:user, @object, @template, {}, nil)
    end

    it "#error_messages" do
      expect(@template).to receive(:error_messages_for).with(@object, {})
      @builder.error_messages
    end
  end
end
