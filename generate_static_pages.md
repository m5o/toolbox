# Generate static [maintenance] pages with layout and all dynamic content

Generate static maintenance pages with layout and all dynamic content.

## Installation

* copy `generate_static_pages.rake` to `lib/tasks/generate_static_pages.rake`
* generate controller `rails generate controller Static maintenance_mode maintenance_error maintenance_404 maintenance_422 maintenance_500`
* add maintenance routes to `config/routes.rb`

```ruby
controller :static do
  # routes to generate maintenance pages
  scope 'maintenance', as: :maintenance do
    get '/mode',       to: :maintenance_mode
    get '/error',      to: :maintenance_error
    get '/404',        to: :maintenance_404
    get '/422',        to: :maintenance_422
    get '/500',        to: :maintenance_500
  end
end
```

## Usage

```bash
rake -T

rake generate_static_error_pages                  # Generate static error pages
// generate with production env
rake generate_static_error_pages RAILS_ENV=production
// generated pages are in /public
// git status / git commit
```
