# Generate static maintenance pages with layout
# and all dynamic content
#
# rake generate_static_error_pages RAILS_ENV=production
#
desc "Generate static error pages"
task generate_static_error_pages: [:environment] do
  require "rails/console/app"
  require "rails/console/helpers"
  extend Rails::ConsoleMethods

  urls_and_paths.each do |url, path|
    r = app.get(url)
    if 200 == r
      File.open(Rails.public_path + path, "w") do |f|
        f.write(app.response.body)
      end
    else
      $stderr.puts "Error generating static file #{path} #{r.inspect}"
    end
  end
end

def urls_and_paths
  [
    ["/maintenance/mode", "maintenance.html"],
    ["/maintenance/error", "error.html"],
    ["/maintenance/404", "404.html"],
    ["/maintenance/422", "422.html"],
    ["/maintenance/500", "500.html"]
  ]
end
