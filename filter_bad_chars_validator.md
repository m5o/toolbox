# Filter Predefined Characters Validator

Filter predefined or bad characters from inputs

## Installation

* copy ```filter_bad_chars_validator.rb``` to ```app/validators/filter_bad_chars_validator.rb```
* copy ```filter_bad_chars_validator_spec.rb``` to ```spec/validators/filter_bad_chars_validator_spec.rb```

## Usage

```ruby
validates :name, presence: true, filter_bad_chars: true
validates :street, filter_bad_chars: true
```
