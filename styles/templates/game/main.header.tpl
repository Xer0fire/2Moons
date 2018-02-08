<html lang="{$lang}">

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="{$game_name}">
  <link rel="shortcut icon" href="./styles/resource/img/favicon.png">
	<meta name="generator" content="2Moons {$VERSION}">
	<!-- 
		This website is powered by 2Moons {$VERSION}
		2Moons is a free Space Browsergame initially created by Jan Kröpke and licensed under GNU/GPL.
		2Moons is copyright 2009-2013 of Jan Kröpke. Extensions are copyright of their respective owners.
		Information and contribution at http://2moons.cc/
	-->
	{if !empty($goto)}
	<meta http-equiv="refresh" content="{$gotoinsec};URL={$goto}">
	{/if}
  <title>{block name="title"} - {$uni_name} - {$game_name}{/block}</title>

  <!-- Main styles for this application -->
  <link href="./styles/resources/css/style.min.css" rel="stylesheet">
  <link href="./styles/resources/css/cookieconsent.min.css" rel="stylesheet">
  <link href="./styles/resources/css/font-awesome.min.css" rel="stylesheet">
  <link href="./styles/resources/css/toastr.min.css" rel="stylesheet">
  <link href="./styles/resources/css/custom.css" rel="stylesheet">
  
  <link href="./styles/resources/css/jquery-ui.min.css" rel="stylesheet">
  
  <!-- inspect -->
  <!-- extract relevant styles bin rest -->
  <link href="{$dpath}formate.css?v={$REV}" rel="stylesheet">
  
	<script type="text/javascript">
	var ServerTimezoneOffset = {$Offset};
	var serverTime 	= new Date({$date.0}, {$date.1 - 1}, {$date.2}, {$date.3}, {$date.4}, {$date.5});
	var startTime	= serverTime.getTime();
	var localTime 	= serverTime;
	var localTS 	= startTime;
	var Gamename	= document.title;
	var Ready		= "{$LNG.ready}";
	var Skin		= "{$dpath}";
	var Lang		= "{$lang}";
	var head_info	= "{$LNG.fcm_info}";
	var auth		= {$authlevel|default:'0'};
	var days 		= {$LNG.week_day|json|default:'[]'} 
	var months 		= {$LNG.months|json|default:'[]'} ;
	var tdformat	= "{$LNG.js_tdformat}";
	var queryString	= "{$queryString|escape:'javascript'}";
	var isPlayerCardActive	= {$isPlayerCardActive|json};

	setInterval(function() {
		serverTime.setSeconds(serverTime.getSeconds()+1);
	}, 1000);
	</script>
	<script src="./styles/resources/js/jquery.min.js"></script>
	<script src="./styles/resources/js/jquery-ui.min.js"></script>
	<script type="text/javascript" src="./scripts/game/base.js?v={$REV}"></script>
	{foreach item=scriptname from=$scripts}
	<script type="text/javascript" src="./scripts/game/{$scriptname}.js?v={$REV}"></script>
	{/foreach}
	{block name="script"}{/block}
	<script type="text/javascript">
	$(function() {
		{$execscript}
	});
	</script>
  
</head>

<body class="app header-fixed sidebar-fixed aside-menu-fixed">