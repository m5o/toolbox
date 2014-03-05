(function($) {
    'use strict';

    $('a[rel^="popup"]').click( function() {
        if ( $(this).data("popup") !== undefined ) {
            var options = $(this).data("popup").split("|"),
                params = { width: options[0], height: options[1] };
        }
        var defaults = { width: "700", height: "500" },
            params = $.extend( defaults, params ),
            popwin = window.open( $(this).attr( "href" ), "", "width=" + params.width + ",height=" + params.height + ",resizable=yes,scrollbars=yes,toolbar=no" );
        if ( window.popwin ) { window.popwin.focus(); }
        return false;
    });

})(jQuery);
