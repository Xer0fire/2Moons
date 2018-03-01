$(document).ready(function($){
	//check if BLOCKED_BY_CLIENT
	if (typeof(cookieconsent) != "undefined") {
		window.cookieconsent.initialise({
			"palette": {
				"popup": {
					"background": "#000"
				},
				"button": {
					"background": "transparent",
					"text": "#f1d600",
					"border": "#f1d600"
				}
			},
			"content": {
				"message": "This website uses cookies, by using this website you consent to all of our cookies.",
				"dismiss": "Got it!",
				"link": "Learn more",
				"href": "https://cookiesandyou.com"
			},
			"position": "bottom"
		});
	}

	//stop modal adding padding and margins to body and nav elements
	$.fn.modal.Constructor.prototype._setScrollbar = function () {};

	//move modals
	$("#modal-container").append( $("div.modal") );
});

function rules() {
	if(typeof Subject !== 'string')
			Subject	= '';

	$('.popover').each(function() {
		$(this).popover('hide');
	});
	$.ajax({
		url: "index.php?page=rules&ajax=1", 
		success: function(data){
			$('#rulesModalBody').empty();
			$('#rulesModalBody').append(data);
		}
	});
}

function togglePassword() {
	if ($('#password').attr('type') === "password") {
		$('#password').attr('type', 'text');
		$('#unmask').removeClass('fa-eye').addClass('fa-eye-slash');
	} else {
		$('#password').attr('type', 'password');
		$('#unmask').removeClass('fa-eye-slash').addClass('fa-eye');
	}
}

$(function() {
	$('.flags').on('click', function(e) {
		e.preventDefault();
		var langKey = $(this).attr('class').replace(/flags(.*)/, "$1").trim();
		Login.setLanguage(langKey);
		return false;
	});

	if(LoginConfig.isMultiUniverse)
	{
		$('.changeAction')
		.each(function() {
			updateUrls($(this));
		})
		.on('change', function() {
			updateUrls($(this));
		});
		
		// $('.changeUni').on('change', function() {
		// 	document.location.href = LoginConfig.basePath+'uni'+$(this).val()+'/index.php'+document.location.search;
		// });
	}
	else
	{
		$('.fb_login').attr('href', function(i, old) {
			return LoginConfig.basePath+$(this).data('href');
		});
	}
});

var updateUrls = function(that, universe) {
	var universe = that.val();
	if (LoginConfig.unisWildcast) {
		var basePathWithSubdomain = LoginConfig.basePath.replace('://', '://uni' + universe + '.');
		that.parents('form').attr('action', function(i, old) {
			return basePathWithSubdomain+$(this).data('action');
		});
		$('.fb_login').attr('href', function(i, old) {
			return basePathWithSubdomain+$(this).data('href');
		});
	} else {
		that.parents('form').attr('action', function(i, old) {
			return LoginConfig.basePath+'uni'+universe+'/'+$(this).data('action');
		});
		$('.fb_login').attr('href', function(i, old) {
			return LoginConfig.basePath+'uni'+universe+'/'+$(this).data('href');
		});
	}
}

var Login = {
	setLanguage : function (LNG, Query) {
		$.cookie('lang', LNG);
		if(typeof Query === "undefined")
			document.location.href = document.location.href
		else
			document.location.href = document.location.href+Query;
	}
};