# remove trailing whitespace and tabs/spaces
#
# rake source:*
#
namespace :source do
  def find_and_replace_in_source_files(find, replace, only_views = false)
    puts "search and replace #{find.inspect} => #{replace.inspect}"

    # exclude bin, db, doc, log, and tmp
    directories = %w[app config lib public spec test]
    directories = %w[app/views] if only_views

    files = %w[ .autotest .rspec .ruby-gemset .ruby-version .rvmrc Procfile ].select{|f| File.exist?(f) }
    directories.each do |d|
      files += Dir[File.join(d, "**/*.{rb,rake,haml,erb,builder,js,coffee,css,scss}")]
      files = Dir[File.join(d, "**/*.{haml,erb,css,scss}")] if only_views
    end

    files.each do |file_name|
      text = File.open(file_name, 'r'){ |file| file.read }
      if text.gsub!(find, replace)
        puts "rewriting #{file_name}..."
        File.open(file_name, 'w'){|file| file.write(text)}
      end
    end
  end


  desc "Remove double whitespace between words in a line"
  task :dedouble do
    find_and_replace_in_source_files(/([\S])[ ]{2,}([\S])/, '\1 \2', true)
  end

  desc "Replace all tabs in source code files with two spaces"
  task :detab do
    find_and_replace_in_source_files("\t", "  ")
  end

  desc "Replace two spaces in source code files with tab"
  task :despace do
    find_and_replace_in_source_files("  ", "\t", true)
  end

  desc "Remove trailing whitespace on the ends of lines"
  task :detrail do
    find_and_replace_in_source_files(/ +$/, '')
  end

  desc "Replace all instances of {pattern} with {result}"
  task :gsub, :pattern, :result do |t, args|
    find_and_replace_in_source_files(Regexp.new(args[:pattern] || ENV['PATTERN']), args[:result] || ENV['RESULT'])
  end

end
