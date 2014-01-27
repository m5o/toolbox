# encoding: utf-8
module Page

  # ---------------------------------------------------- Root
  class Rails

    attr_accessor :page_title, :page_name, :meta_description, :meta_keywords, :layout

    # static
    PAGE_TITLE = 'Hallo from a fantastic Rails App'
    META_DESCRIPTION = 'Description for Rails Page'
    META_KEYWORDS = 'foo, bar, baz, hoschi'

    def initialize(args = {})
      defaults = { #set defaults
        page_title: PAGE_TITLE,
        page_name: 'Rails Page',
        meta_description: META_DESCRIPTION,
        meta_keywords: META_KEYWORDS,
        layout: 'application'
      }.merge(args)

      defaults.each { |key, value| self.instance_variable_set("@#{key}", value) }
    end

    # set alias for name - because in production use '@page.page_title' is weird and(!) Ruby has the power
    alias :title= :page_title=
    alias :title :page_title
    alias :name= :page_name=
    alias :name :page_name

  end


  # ---------------------------------------------------- MyShop
  module MyShop

    # Basic layout structure
    class Basic < Page::Rails

      attr_accessor :header, :footer, :body_class, :is_tracking

      # static
      PAGE_TITLE = 'My fancy Rails Shop - '
      META_DESCRIPTION = 'custom meta desc'
      META_KEYWORDS = 'some useless keywords'

      def initialize(args = {})
        super
        defaults = { #set defaults
          page_title: PAGE_TITLE,
          page_name: '',
          meta_description: META_DESCRIPTION,
          meta_keywords: META_KEYWORDS,
          :header => { :navigation => true, :logo => true, :social_media => true },
          :footer => { :navigation => true, :links => true },
          body_class: '',
          :is_tracking => true
        }.merge(args)

        defaults.each { |key, value| self.instance_variable_set("@#{key}", value) }
      end
    end


    class Checkout < MyShop::Basic

      def initialize(args = {})
        super

        @page_title = 'eg. custom title'
        @meta_description = 'eg. custom meta desc'
      end
    end


    class Products < MyShop::Basic

      def initialize(args = {})
        super

        defaults = { #set defaults
          body_class: 'account'
        }.merge(args)

        defaults.each { |key, value| self.instance_variable_set("@#{key}", value) }
      end
    end

  end

end
