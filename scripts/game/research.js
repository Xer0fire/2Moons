var resttime	= 0;
var time		= 0;
var endtime		= 0;
var interval	= 0;
var buildname	= "";

function Buildlist() {
	var rest	= resttime - (serverTime.getTime() - startTime) / 1000;
	if (rest <= 0) {
		window.clearInterval(interval);
		$('#time').text(Ready);
		$('#command').remove();
		document.title	= Ready + ' - ' + Gamename;
		window.setTimeout(function() {
			window.location.href = 'game.php?page=research';
		}, 1000);
		return true;
	}
	document.title	= GetRestTimeFormat(rest) + ' - ' + buildname + ' - ' + Gamename;
	
	$('#time').text(GetRestTimeFormat(rest));
	if (rest <= 0) {
		window.clearInterval(interval);
		$('#timequeue').text(Ready);
		document.title	= Ready + ' - ' + Gamename;
		window.setTimeout(function() {
			window.location.href = 'game.php?page=research';
		}, 1000);
		return true;
	}
	document.title	= GetRestTimeFormat(rest) + ' - ' + buildname + ' - ' + Gamename;

	$('#timequeue').text(GetRestTimeFormat(rest));
}

function progressbar(config, init) {
	if(typeof init !== "undefined" && init === true)
		window.setInterval(function(){progressbar(config)}, 1000);
	if (config.resttime <= 0)
		return;

	var timepast = (serverTime.getTime() - startTime) / 1000;
	$('.progress .progress-bar').attr("aria-valuenow", Math.max(100 - ((config.resttime - timepast) / config.time) * 100, 0.01))
	$('.progress .progress-bar').css("width",function() {
		return $(this).attr("aria-valuenow") + "%";
	})
}

$(document).ready(function() {
	time		= $('#time').data('time');
	resttime	= $('.progress .progress-bar').data('time');
	endtime		= $('.timer:first').data('time');
	buildname	= $('.onlist:first').text();
	interval	= window.setInterval(Buildlist, 1000);

	if(time <= 0) 
	return;

	progressbar({
		time: time,
		resttime: resttime
	}, true);

	Buildlist();
});