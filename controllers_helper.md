# Controllers Helper

Rails controller and action helper for views

## Installation

* copy `controllers_helper.rb` to `app/helpers/controllers_helper.rb`
* copy `controllers_helper_spec.rb` to `spec/helpers/controllers_helper_spec.rb`

## Usage

```ruby
namespace?("admin")
```

```ruby
controller?("contents", "users")
```

```ruby
action?("index")
```

```ruby
is_active?(root_path)
is_active?(root_path, "custom-active-css-class")
```
