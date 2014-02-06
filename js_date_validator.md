# JavaScript real date validator and date helper

Validates correctnes of given date

## Installation

* copy `js_date_validator.js` to `app/assets/javascripts/date_validator.js`

## Usage

```js
$("#birthday, #birthmonth").focusout( function() {
    if ( $(this).val().match(/^\d{1}$/) ) {
        if ( $(this).val() === "0" ) { $(this).val("01");
        } else { $(this).val("0" + $(this).val()); }
    }

    if ( $("#birthday").val().match(/^\d{2}$/) && $("#birthmonth").val().match(/^\d{2}$/) ) {
        checkBirthdate();
    }
});

$("#birthyear").focusout( function() {
    var current_year = new Date().getFullYear();

    if ( $(this).val().match(/^\d{2}$/) ) {
        if ( $(this).val() <= (current_year - 2000) ) { $(this).val("20" + $(this).val());
        } else { $(this).val("19" + $(this).val()); }
    }
    checkBirthdate();
});
```

## Documentation

* http://codepen.io/anon/pen/IFEHx
* http://blog.adtile.me/2014/01/16/a-dive-into-plain-javascript/
