<!DOCTYPE html>
<html lang="{$lang}">

	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<meta name="description" content="{$game_name} - Space-war themed multiplayer online browser game">
		<meta name="keywords" content="Space War, Space, War, Multiplayer Online Browser Game, Multiplayer, Online, Browser Game, Browsergame, Text based game, Timer based game, 2Moons, XNova">
		<meta name="theme-color" content="#252831"/>
		<meta name="generator" content="2Moons {$VERSION}">
		<!--
			This website is powered by 2Moons {$VERSION}
			2Moons is a free Space Browsergame initially created by Jan Kröpke and licensed under GNU/GPL.
			2Moons is copyright 2009-2013 of Jan Kröpke. Extensions are copyright of their respective owners.
			Information and contribution at http://2moons.cc/
		-->
		<link rel="manifest" href="{$dpath}manifest.json">
		<link rel="shortcut icon" href="{$dpath}images/favicon.png">

		{if !empty($goto)}
			<meta http-equiv="refresh" content="{$gotoinsec};URL={$goto}">
		{/if}
		<title>{block name="title"} - {$uni_name} - {$game_name}{/block}</title>

		<!-- Main styles for this application -->
		<link href="./styles/resources/css/style.min.css" rel="stylesheet">
		<link href="https://cdnjs.cloudflare.com/ajax/libs/cookieconsent2/3.0.6/cookieconsent.min.css" rel="stylesheet">
		<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
		<link href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/2.1.4/toastr.min.css" rel="stylesheet">
		<link href="./styles/resources/css/custom.css" rel="stylesheet">
		<link href="{$dpath}theme.min.css" rel="stylesheet">
	</head>

	<body class="preload app header-fixed sidebar-fixed aside-menu-fixed">