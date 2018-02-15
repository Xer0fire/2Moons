$(document).ready(function()
{
	window.setInterval(function() {
		$('.fleets').each(function() {
			var s		= $(this).data('fleet-time') - (serverTime.getTime() - startTime) / 1000;
			if(s <= 0) {
				$(this).text('-');
			} else {
				$(this).text(GetRestTimeFormat(s));
			}
		})
	}, 1000);
	
	window.setInterval(function() {
		$('.timer').each(function() {
			var s		= $(this).data('time') - (serverTime.getTime() - startTime) / 1000;
			if(s == 0) {
				window.location.href = "game.php?page=overview";
			} else {
				$(this).text(GetRestTimeFormat(s));
			}
		});
	}, 1000);

});

function overviewTicker(config, init) {
	if(typeof init !== "undefined" && init === true)
		window.setInterval(function(){resourceTicker(config)}, 1000);

	var element	= $('#'+config.valueElem);
	if(element.hasClass('text-red'))
	{
		return false;
	}

	var timepast = (serverTime.getTime() - startTime) / 1000;
	var prodpersec = parseFloat(config.production) / 3600;
	var nrResource = Math.max(0, (timepast * prodpersec) + parseFloat(config.available));

	if (nrResource < config.limit[1]) 
	{
		if(viewShortlyNumber) {
			element.attr('data-tooltip-content', NumberGetHumanReadable(nrResource));
			element.html(shortly_number(nrResource));
		} else {
			element.html(NumberGetHumanReadable(nrResource));
		}
	} else {
		element.addClass('text-red');
	}
}