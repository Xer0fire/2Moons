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

if(element.hasClass('ovr_current_max'))
{
	return false;
}

var nrResource = Math.max(0, Math.floor(parseFloat(config.available) + parseFloat(config.production) / 3600 * (serverTime.getTime() - startTime) / 1000));

if (nrResource < config.limit[1])
{
	if (!element.hasClass('ovr_current_warn') && nrResource >= config.limit[1] * 0.9)
	{
		element.addClass('ovr_current_warn');
	}
	if(viewShortlyNumber) {
		element.attr('data-tooltip-content', NumberGetHumanReadable(nrResource));
		element.html(shortly_number(nrResource));
	} else {
		element.html(NumberGetHumanReadable(nrResource));
	}
} else {
	element.addClass('ovr_current_max');
}
}