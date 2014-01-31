(function() {
    'use strict';

    var DateValidator = {
        isValid: function( day, month, year ) {
            var today = new Date();
            year = ( (!year) ? DateValidator.year2k(today.getYear()) : year );
            month = ( (!month) ? today.getMonth() : month - 1 );
            var test = new Date( year, month, day );
            if ( (DateValidator.year2k(test.getYear()) == year) && (month == test.getMonth()) && (day == test.getDate()) ) {
                return true;
            }
            else { return false; }
        },

        year2k: function(number) {
            return ( number < 1000 ) ? number + 1900 : number;
        }
    };


    var checkBirthdate = function() {
        var birth_matrix = [ 1, 1, 1 ],
            b_day = $("#birthday").val(),
            b_month = $("#birthmonth").val(),
            b_year = $("#birthyear").val(),
            current_year = new Date().getFullYear();

        if ( ((b_day.match(/\D+/) || b_day.length < 2) && b_day.length > 0) || b_day > 31 ) {
            birth_matrix[0] = 0;
        }

        if ( ((b_month.match(/\D+/) || b_month.length < 2) && b_month.length > 0) || b_month > 12 ) {
            birth_matrix[1] = 0;
        }

        if ( ((b_year.match(/\D+/) || b_year.length < 4) && b_year.length > 0) || b_year > current_year || b_year < (current_year - 110) ) {
            birth_matrix[2] = 0;
        }

        if ( b_day.match(/\d+/) && b_month.match(/\d+/) && b_year.match(/\d+/) ) {
            if ( birth_matrix[0] === 0 || birth_matrix[1] === 0 || birth_matrix[2] === 0 || !DateValidator.isValid( b_day, b_month, b_year ) ) {
                console.log("invalid");
            } else {
                console.log("valid");
            }
        }

        return true;
    };

})();
