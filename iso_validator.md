# ISO 8859-1 Whitelist Validator

Whitelist all ISO-8859-1 chars. Removes all chars that are not in ISO-8859-1 range.
[Unicode UTF8 Table](http://www.utf8-chartable.de/unicode-utf8-table.pl)

## Installation

* copy `iso_validator.rb` to `app/validators/iso_validator.rb`
* copy `iso_validator_spec.rb` to `spec/validators/iso_validator_spec.rb`

## Usage

```ruby
validates :name, presence: true, iso: true
validates :street, iso: true
```
