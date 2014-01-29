(function($) {
    'use strict';

    $.fn.filterChars = function(options) {

        var settings = $.extend({
            chars: /[~*?$§%°<>#!+,:;_&\/\\@()\[\]{}|"]/g,
            replacement: ''
        }, options);

        if ( !this.val().match(settings.chars) ) { return false; }
        this.val( this.val().replace( settings.chars, settings.replacement ) );
        return this;
    };

})(jQuery);
