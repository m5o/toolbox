# find unused images on Rails project
#
# rake unused:*
#
namespace :unused do
  desc "Find unused images on Rails project to deletion"
  task :images do
    images_found = []
    files = []
    image_list = Dir.glob('app/assets/images/**/*.{gif,jpg,jpeg,png,svg}')
    search_dir = %w[app/assets/stylesheets app/views public]

    search_dir.each do |directory|
      files += Dir[File.join(directory, "**/*.{html,haml,erb,css,scss}")]
    end

    image_list.each do |image|
      search_string = image.split("app/assets/images/")[1]
      print "."

      files.each do |file_name|
        result = File.read(file_name).include?(search_string)
        next unless result
        images_found << image if result
      end
    end

    images_to_delete = image_list - images_found

    puts "\n\n"
    puts images_to_delete.join("\n")
    puts "\n\nFound #{images_found.count} used images from #{image_list.count} assets"
    puts "=> #{images_to_delete.count} images seem to be unused."

    puts "\n\nDelete unused files running the command below:"
    puts "git rm #{images_to_delete.join(" ")}"
  end
end
