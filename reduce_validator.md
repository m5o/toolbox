# Reduce Validator

show only one error message per field

## Installation

* copy `reduce_validator.rb` to `app/validators/reduce_validator.rb`
* copy `reduce_validator_spec.rb` to `spec/validators/reduce_validator_spec.rb`

## Usage

```ruby
validates :name, presence: true, reduce: true
validates :street, reduce: true
```

## Links

* I've posted this to [stackoverflow.com in Nov 2010](http://stackoverflow.com/questions/2569401/rails-validation-error-messages-displaying-only-one-error-message-per-field)
