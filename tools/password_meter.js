jQuery(function($) {

/* -------------------------------------------------------- B: password strength meter */
var PwdScore = {
	getRating: function(passwd) {
		var score = 0,
			score_log = "PASSWORD SCORE \n''''''''''''''\n",
			log = true,
			special_chars = /[!,\.@#$%\^&*?_~]/g;

		if ( passwd === undefined ) { return false; }
		if ( passwd.length >= 1 && passwd.length < 5 ) { // length 4 or less
			score = ( score + 1 ); score_log += (log) ? "1 points for length (" + passwd.length + ")\n":"";
		}
		else if ( passwd.length > 4 && passwd.length < 8 ) { // length between 5 and 7
			score = ( score + 3 ); score_log += (log) ? "3 points for length (" + passwd.length + ")\n":"";
		}
		else if ( passwd.length > 7 && passwd.length < 16 ) { // length between 8 and 15
			score = ( score + 14 ); score_log += (log) ? "14 points for length (" + passwd.length + ")\n":"";
		}
		else if ( passwd.length > 15 ) { // length 16 or more
			score = ( score + 18 ); score_log += (log) ? "18 point for length (" + passwd.length + ")\n":"";
		}
		// LETTERS
		if ( passwd.match(/[a-z]/) ) { // [verified] at least one lower case letter
			score = ( score + 1 ); score_log += (log) ? "1 point for at least one lower case char\n":"";
		}
		if ( passwd.match(/[A-Z]/) ) { // [verified] at least one upper case letter
			score = ( score + 3 ); score_log += (log) ? "3 points for at least one upper case char\n":"";
		}
		// NUMBERS
		if ( passwd.match(/\d+/) ) { // [verified] at least one number
			score = ( score + 3 ); score_log += (log) ? "3 points for at least one number\n":"";
		}
		if ( passwd.match(/(\d.*\d.*\d)/) ) { // [verified] at least three numbers
			score = ( score + 3 ); score_log += (log) ? "3 points for at least three numbers\n":"";
		}
		// SPECIAL CHAR
		if ( passwd.match(special_chars) !== null ) {
			if ( passwd.match(special_chars).length >= 1 ) { // [verified] at least one special character
				score = ( score + 5 ); score_log += (log) ? "5 points for at least one special char\n":"";
			}
			if ( passwd.match(special_chars).length >= 2 ) { // [verified] at least two special characters
				score = ( score + 5 ); score_log += (log) ? "5 points for at least two special chars\n":"";
			}
			if ( passwd.match(special_chars).length >= 3 ) { // [verified] at least three special characters
				score = ( score + 5 ); score_log += (log) ? "5 points for at least three special chars\n":"";
			}
		}
		// COMBOS
		if ( passwd.match(/[a-z]/ ) && passwd.match(/[A-Z]/) ) { // [verified] both upper and lower case
			score = ( score + 2 ); score_log += (log) ? "2 combo points for upper and lower letters\n":"";
		}
		if ( passwd.match(/\d/) && passwd.match(/\D/) ) { // [verified] both letters and numbers
			score = ( score + 2 ); score_log += (log) ? "2 combo points for letters and numbers\n":"";
		}
		if ( passwd.match(/[a-z]/) && passwd.match(/[A-Z]/) && passwd.match(/\d/) && passwd.match(special_chars) ) { // [verified] letters, numbers, and special characters
			score = ( score + 3 ); score_log += (log) ? "3 combo points for letters, numbers and special chars\n":"";
		}
		// TOO SHORT
		if ( passwd.length >= 1 && passwd.length < 8 ) { // set pw score to 1
			score = (1); score_log += (log) ? "=> reset 1 point for short length (" + passwd.length + ")\n":"";
		}
		if ( log ) { $(".password-meter-log").empty().append( score_log + "====\n" + score + " of 50" ); }
		return score;
	},

	pokeSecurityLevelImage: function(element) {
		var pw_score = PwdScore.getRating( $(element).val() );
		updatePasswordMeterBar( pw_score );
		return true;
	},

	hasPrivateData: function(passwd) {
		var privatedata_fields = [ "firstname", "lastname", "street", "zipcode", "city", "birthday", "birthmonth", "birthyear", "wishname" ],
			return_value = false;

		$.each(privatedata_fields, function( i, field ) {
			var value = $.trim( $("#" + field).val().toLowerCase() );
			if ( value != "" && passwd.match(/.*[value]/) >= 0 ) {
				return_value = true;
			}
		});
		return return_value;
	}
};


// Manage the Security Level Image
var updatePasswordMeterBar = function(level) {
	var meter_level0 = [ 'level-0', "Password Security" ],
		meter_level1 = [ 'level-1', "too short" ],
		meter_level2 = [ 'level-2', "sufficient" ],
		meter_level3 = [ 'level-3', "good choice" ],
		meter_level4 = [ 'level-4', "very good choice" ];

	if (level === 0) { setPasswordMeterBar(meter_level0); }
	if (level >= 01) { setPasswordMeterBar(meter_level1); }
	if (level >= 08) { setPasswordMeterBar(meter_level2); }
	if (level >= 22) { setPasswordMeterBar(meter_level3); }
	if (level >= 40) { setPasswordMeterBar(meter_level4); }
};

// Update the Security Level Image
var setPasswordMeterBar = function(item) {
	var $password_meter_bar = $('.password-meter-bar'),
		$password_meter_text = $('.password-meter-bar-text');

	$password_meter_bar.removeClass("level-0 level-1 level-2 level-3 level-4").addClass(item[0]);
	$password_meter_text.html(item[1]);
};
/* -------------------------------------------------------- */



/* -------------------------------------------------------- */
$("#user_password").keyup( function(event) {
	var pw_score = PwdScore.getRating( $(this).val() );
	updatePasswordMeterBar( pw_score );
	// var private_data = PwdScore.hasPrivateData( $(this).val() );
	// if ( private_data ) {}
});
/* -------------------------------------------------------- */

});
