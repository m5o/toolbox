# JavaScript Multi Replace

Replace predefined charater with their pair.

## Installation

* copy `js_multi_replace.js` to `app/assets/javascripts/multi_replace.js`

## Usage

`$().multiReplace();` has this parameters:

* `chars` — Object, default:
```js
chars: {
    'ä': 'ae', 'Ä': 'Ae', 'á': 'a', 'â': 'a', 'à': 'a', 'å': 'a', 'æ': 'ae',
    'ö': 'oe', 'Ö': 'Oe', 'ó': 'o', 'ø': 'o',
    'ü': 'ue', 'Ü': 'Ue',
    'ç': 'c', 'Ç': 'C', 'ĉ': 'c', 'Ć': 'C', 'č': 'c', 'Č': 'C',
    'é': 'e', 'ê': 'e', 'è': 'e', 'ĝ': 'g', 'ĥ': 'h',
    'Ů': 'U', 'Ų': 'U', 'ù': 'u', 'û': 'u',
    'î': 'i', 'í': 'i',
    'ñ': 'n', 'ß': 'ss', 'Ş': 'S', 'š': 's', ' ': '-', 'ą': 'q',
    'µ': 'm', '²': '2', '³': '3', '€': 'E', '£': 'L'
}
```


```js
$(function() {
    $("#username").keyup( function() {
        $(this).multiReplace();
    });
});
```

## Example

Task: Replace blank, and underscore with minus

```js
$(this).multiReplace({ chars: { ' ': '-', '_': '-' } });
```

## Documentation

* http://www.utf8-chartable.de
* http://unicode-table.com/en/
