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

	var timepast = (serverTime.getTime() - startTime) / 1000;
	var prodpersec = (parseFloat(config.prod) / 3600);
	var newcurrent = parseFloat(config.current) + (prodpersec * timepast);
	var rest = config.max[1] - newcurrent;
	var timeLeft = rest / prodpersec;
	if (parseFloat(config.current) < config.max[1])
	{
		if (timeLeft < 43200 && !element.hasClass('text-yellow')) {
			element.removeClass('text-green');
			element.addClass('text-yellow');
		}
		element.html(_timeformat(timeLeft));
	} else {
		element.removeClass('text-green');
		element.addClass('text-red');
		element.html(number_format(config.max[1]));
	}
}