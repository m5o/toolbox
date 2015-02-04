# encoding: UTF-8
require 'spec_helper'

describe Page do

  describe "Page::Rails" do

    let(:page) { Page::Rails.new }

    context "initialize correct values" do
      it { expect(page.layout).to eq "application" }
      it { expect(page.page_title).to eq "Hallo from a fantastic Rails App" }
      it { expect(page.page_name).to eq "Rails Page" }
      it { expect(page.meta_description).to eq "Description for Rails Page" }
      it { expect(page.meta_keywords).to eq "foo, bar, baz, hoschi" }
      it { expect(page.layout).to eq "application" }
    end

    context "set the alias for methods" do
      it { expect(page.page_title).to eq page.title }
      it { expect(page.page_name).to eq page.name }
    end
  end


  describe "Page::MyShop::Basic" do

    let(:page) { Page::MyShop::Basic.new }

    context "initialize correct values" do
      it { expect(page.page_title).to eq "My fancy Rails Shop - " }
      it { expect(page.page_name).to be_blank }
      it { expect(page.meta_description).to eq "custom meta desc" }
      it { expect(page.meta_keywords).to eq "some useless keywords" }
      it { expect(page.header).to be_a_kind_of Hash }
      it { expect(page.footer).to be_a_kind_of Hash }
      it { expect(page.layout).to eq "application" }
      it { expect(page.body_class).to eq "" }
      it { expect(page.is_tracking).to eq true }
    end
  end

end
