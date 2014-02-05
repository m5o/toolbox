# Application Layout for Rails

Rails template inheritance workflow

## Installation

* copy `application.html.erb` to `app/views/layout/applicatoin.html.erb`
* touch `app/views/application/_app_footer.html.erb`
* touch `app/views/application/_app_header.html.erb`
* touch `app/views/application/_javascript.html.erb`
* touch `app/views/application/_stylesheet.html.erb`

* touch `app/views/shared/_basic_footer.html.erb`
* touch `app/views/shared/_basic_header.html.erb`

### File content

```erb
<%# file: app/views/application/_app_footer.html.erb %>
<%= render("shared/basic_footer") %>
```

```erb
<%# file: app/views/application/_app_header.html.erb %>
<%= render("shared/basic_header") %>
```

```erb
<%# file: app/views/application/_javascript.html.erb %>
<%= javascript_include_tag "application" %>
```

```erb
<%# file: app/views/application/_stylesheet.html.erb %>
<%= stylesheet_link_tag "application", media: "all" %>
```

```erb
<%# file: app/views/shared/_basic_footer.html.erb %>
<footer><h5>Hallo from footer</h5></footer>
```

```erb
<%# file: app/views/shared/_basic_header.html.erb %>
<header><h1>Hallo from header</h1></header>
```

## Usage

The key role has the oneline ternary operator construct `<%= content_for?(:app_footer) ? yield(:app_footer) : render("app_footer") rescue nil %>` inside the application layout file.

- The `rescue nil` is optional. If you remove it the block will be mandatory. 
- You could include or overwrite content form `erb`-files with the `content_for(:extend_stylesheet)` block
- Template inheritance – load specific partial e.g. Products, create `app/views/products/_app_footer.html.erb`


```erb
<% content_for(:extend_stylesheet) do %>
	<%= stylesheet_link_tag "foobar_css_file" %>
<% end %>
```

```erb
<% content_for(:extend_javascript) do %>
	<%= stylesheet_link_tag "foobar_js_file" %>
	<script>
		$(function() {
			console.log("hallo rails")
		});
	</script>
<% end %>
```