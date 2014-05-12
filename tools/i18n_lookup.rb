# Where is Rails trying to look-up L10N / I18N Strings
# archived mirror http://cache.preserve.io/8vupog4s/index.html
# original of http://www.unixgods.org/~tilo/Rails/which_l10n_strings_is_rails_trying_to_lookup.html
#

# add newer versions to this array if the method definition didn't change, otherwise do an if-cascade
if ['0.6.9'].include?(I18n::VERSION)

  module I18n
    module Backend
      class Simple
        # Monkey-patch-in localization debugging
        # library https://github.com/svenfuchs/i18n/blob/master/lib/i18n/backend/simple.rb
        #
        def lookup(locale, key, scope = [], options = {})
          init_translations unless initialized?
          keys = I18n.normalize_keys(locale, key, scope, options[:separator])

          puts "\tI18N keys: #{keys}" #if ENV['I18N_DEBUG']

          keys.inject(translations) do |result, _key|
            _key = _key.to_sym
            return nil unless result.is_a?(Hash) && result.has_key?(_key)
            result = result[_key]
            result = resolve(locale, _key, result, options.merge(:scope => nil)) if result.is_a?(Symbol)

            puts "\t => " + result.to_s + "\n\n\n" if (result.class == String) #&& ENV['I18N_DEBUG']

            result
          end
        end
      end
    end
  end

else
  puts "\n--------------------------------------------------------------------------------"
  puts "WARNING: you're using version #{I18n::VERSION} of the i18n gem."
  puts "         Please double check that your monkey-patch still works!"
  puts "         see: \"#{__FILE__}\""
  puts "--------------------------------------------------------------------------------\n"
end
