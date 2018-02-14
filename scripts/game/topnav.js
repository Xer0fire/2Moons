//topnav.js
//RealTimeRessisanzeige for 2Moons
// @version 1.0
// @copyright 2010 by ShadoX

function resourceTicker(config, init) {
	if(typeof init !== "undefined" && init === true)
		window.setInterval(function(){resourceTicker(config)}, 1000);
		
	var element	= $('#'+config.valueElem);
	if(element.hasClass('text-red'))
	{
		return false;
	}
	
	var nrResource = Math.max(0, Math.floor(parseFloat(config.available) + parseFloat(config.production) / 3600 * (serverTime.getTime() - startTime) / 1000));
	
	if (nrResource < config.limit[1]) 
	{
		if (!element.hasClass('res_current_warn') && nrResource >= config.limit[1] * 0.9)
		{
			element.addClass('res_current_warn');
		}
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

function getRessource(name) {
	return parseInt($('#current_'+name).data('real'));
}

function getRestStorage(config, init) {
	if(typeof init !== "undefined" && init === true)
		window.setInterval(function(){getRestStorage(config)}, 1000);

	var element = $('#'+config.valueElem)
	if(element.hasClass('text-red'))
	{
		return false;
	}

	var timeLeft = (config.max[1] - parseFloat(config.current)) / (parseFloat(config.prod) / 3600) - ((serverTime.getTime() - startTime) / 1000)
	if (parseFloat(config.current) < config.max[1])
	{
		if (parseFloat(timeLeft) < 86400 && !element.hasClass('text-yellow')) {
			element.removeClass('text-green');
			element.addClass('text-yellow');
		}
		element.html(_timeformat(timeLeft));
	} else {
		element.html(number_format(config.max[1]));
	}
}