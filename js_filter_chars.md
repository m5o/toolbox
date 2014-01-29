# JavaScript Filter Character

Filter and replace defined characters from inputs.

## Installation

* copy `js_filter_chars.js` to `app/assets/javascripts/filter_chars.js`

## Usage

`filterChars();` has this parameters:

* `chars` — Regex, default `/[~*?$§%°<>#!+,:;_&\/\\@()\[\]{}|"]/g`
* `replacement` — String, default: `''`

```js
$(function() {
    $("#firstname, #lastname, #zipcode, #city, #street").keyup( function() {
        $(this).filterChars();
    });
});
```

## Example

Task: Replace any digits with 'x'

```js
$(function() {
    $("#name").keyup( function() {
        $(this).filterChars({ chars: /\d/g, replacement: 'x' });
    });
});
```

## Documentation

* http://codepen.io/anon/pen/xCFIi
* http://rubular.com
