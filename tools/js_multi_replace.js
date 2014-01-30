(function($) {
    'use strict';

    String.prototype.multiReplace = function(hash) {
        var str = this, key;
        for ( key in hash ) {
            str = str.replace( new RegExp( key, 'g' ), hash[ key ] );
        }
        return str;
    };

    $.fn.multiReplace = function(options) {

        var settings = $.extend({
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
        }, options);

        var string = $(this).val(),
            original_string = string,
            string = string.multiReplace(settings.chars);
        if ( original_string === string ) { return false; }
        $(this).val(string);

    };

})(jQuery);
