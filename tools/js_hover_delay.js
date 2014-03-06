(function($) {
    'use strict';

    var ul_mboxmenu = $("ul.mboxmenu","aside");
    if ( ul_mboxmenu.length != 0 ) {
        $(ul_mboxmenu).parent("li").hover(
            function() {
                var item = $(this),
                    list = window.setTimeout( function() {
                        $("ul:first", item).fadeIn("fast");
                        item.data( "display", true );
                    }, 350);
                    item.data( "list", list );
            },
            function() {
                if( $(this).data("display") ) {
                    $("ul:first", this).fadeOut("normal");
                    $(this).removeData("display");
                } else {
                    window.clearTimeout( $(this).data("list") );
                }
            }
        );
    }

})(jQuery);
