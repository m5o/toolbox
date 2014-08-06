# lookup for l10n / i18n

Debug i18n lookup for l10n / i18n strings

## Installation

* copy `i18n_lookup.rb` to `app/config/initializers/i18n_lookup.rb`

## Usage

currently the variable `ENV['I18N_DEBUG']` is disabled. Modify if needed.
There is also a gem `rails-i18n-debug` use them if you don't want to patch manually.

## Docs & Credits

* http://cache.preserve.io/8vupog4s/index.html
* https://github.com/256dpi/rails-i18n-debug

* https://github.com/glebm/i18n-tasks
* https://github.com/tigrish/i18n-spec
* https://github.com/redealumni/i18n_yaml_sorter
* [Blog: improvements-for-a-rails-i18n-workflow](http://engineering.moneybird.com/posts/2014/06/10/3-improvements-for-a-rails-i18n-workflow/) / [i18n-workflow gem](https://github.com/moneybird/i18n-workflow)
* https://gist.github.com/cpetschnig/1594660
* http://blog.endpoint.com/2013/04/debugging-localization-in-rails.html


## Rspec - I18n Exception Handler

```rb
# add in spec/spec_helper.rb
# Raise an error if a tranlation key can not be found
class TestExceptionTranslationHandler
  def call(exception, locale, key, options)
    raise exception.message
  end
end
I18n.exception_handler = TestExceptionTranslationHandler.new
```
