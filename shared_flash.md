# Flash Messages Partial for Rails Apps

display flash messages in rails app

## Installation

* copy `shared_flash.html.erb` to `app/views/shared/_flash.html.erb`


## Usage

Include partial loading inside your `views/layouts/application.html.erb`

```erb
<%= render "shared/flash", locals: { flash: flash } if flash.any? %>
```
