# Page attributes concept

Store page attributes in global `@page` var. Structure in modules and classes benefit from inheritance.


## Installation

* copy `page.rb` to `app/models/page.rb`
* copy `page_spec.rb` to `spec/models/page_spec.rb`
* add `before_action`, `layout` and the `protected` methods inside `application_controller.rb`
* extend `application_helper.rb`
* copy `application_helper_spec.rb` to `spec/helpers/application_helper_spec.rb`


## Usage


__`app/controllers/application_controller.rb`__

```ruby
class ApplicationController < ActionController::Base

# [...]

before_action :create_default_page

layout :page_layout

# [...]

# ================================================================= PROTECTED
protected

  def create_default_page
    create_myshop_basic_page
  end

  def page_layout
    @page.layout
  end

  def create_myshop_basic_page
    @page = Page::MyShop::Basic.new
  end

  def create_myshop_checkout_page
    @page = Page::MyShop::Checkout.new
  end

  def create_myshop_products_page
    @page = Page::MyShop::Products.new
  end
```


__`app/helpers/application_helper.rb`__

```ruby
# encoding: utf-8
module ApplicationHelper

  # html markup helper
  def title_element(prefix = '', suffix = '')
    content_tag(:title, prefix + @page.title + @page.name + suffix)
  end

  def description_meta_tag
    tag(:meta, { name: "description", content: @page.meta_description })
  end

  def keywords_meta_tag
    tag(:meta, { name: "keywords", content: @page.meta_keywords })
  end

  def body_element(body_class = nil)
    body_id = "#{controller_path.tr('/', '_')}_#{action_name}"
    tag("body", { id: body_id , class: body_class }, true)
  end
```


__example use in `app/views/layouts/application.html.erb`__

```erb
<%= title_element %>

<%= description_meta_tag %>
<%= keywords_meta_tag %>
```


__example use in `app/views/layouts/application.html.erb` generate `<body class="...">`__

```erb
<%= body_element(@page.body_class) %>
```


__example in `app/controllers/*_controller.rb`__

change title, meta desc for singe page or complete controller with `before_filter`

```ruby
def index
  @page.title = "custom title"
  @page.meta_description = "custom meta"
  # add values with
  @page.body_class += " classic lightgrey"
end
```


__example in `app/views/**/*.html.erb`__

```erb
<%# or update/change the values inside .html.erb %>
<% debug(@page) %>
<% @page.title = "custom title" %>
<% @page.meta_description = "custom meta" %>
```
