  <header class="app-header navbar">
    <button class="navbar-toggler mobile-sidebar-toggler d-lg-none mr-auto" type="button">
      <span class="navbar-toggler-icon"></span>
    </button>
    <a class="navbar-brand" href="#"></a>
    <button class="navbar-toggler sidebar-toggler d-md-down-none" type="button">
      <span class="navbar-toggler-icon"></span>
    </button>

    <ul class="res-nav nav navbar-nav d-md-down-none">
	{foreach $resourceTable as $resourceID => $resourceData}
      <li class="nav-item px-2">
		<div class="media">
			<img class="d-flex mr-2 align-self-center" src="{$dpath}images/{$resourceData.name}.gif">
			{if $shortlyNumber}
			{else}
			<div class="media-body">
				{if !isset($resourceData.current)}
					{$resourceData.current = $resourceData.max + $resourceData.used}
					<span class="res_current">
					<span{if $resourceData.current < 0} style="color:red"{/if}>{$resourceData.current|number} / {$resourceData.max|number}</span>
				{else}
					<span class="res_current" id="current_{$resourceData.name}" data-real="{$resourceData.current}">{$resourceData.current|number}</span>
				{/if}<br/>
				{if !isset($resourceData.current) || !isset($resourceData.max) || $resourceID == 911}
				{else}
					<span class="text-green" id="max_{$resourceData.name}" data-real="{$resourceData.current}">{$resourceData.max|number}</span>
				{/if}
			</div>
			{/if}
			
		</div>
      </li>
	  
	{/foreach}
    </ul>
    <ul class="nav navbar-nav ml-auto">
	  {if isModuleAvailable($smarty.const.MODULE_MESSAGES)}
      <li class="nav-item dropdown d-none d-md-block">
        <a class="nav-link" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false"><i class="fa fa-envelope-o"></i>{nocache}{if $new_message > 0}<span class="badge badge-pill badge-success">{$new_message}</span>{/if}{/nocache}</a>
        <div class="dropdown-menu dropdown-menu-right">
          <div class="dropdown-header text-center">
            <strong>Most Recent</strong>
          </div>
          <a href="#" class="dropdown-item">
            <div class="message">
              <div>
                <small class="text-muted">From: [[USERNAME]]</small>
                <small class="text-muted float-right mt-1">Just now</small>
              </div>
              <div class="text-truncate">
                This is my extremely long example subject</div>
            </div>
          </a>
          <a href="#" class="dropdown-item">
            <div class="message">
              <div>
                <small class="text-muted">From: [[USERNAME]]</small>
                <small class="text-muted float-right mt-1">Just now</small>
              </div>
              <div class="text-truncate">
                This is my extremely long example subject</div>
            </div>
          </a>
          <a href="#" class="dropdown-item">
            <div class="message">
              <div>
                <small class="text-muted">From: [[USERNAME]]</small>
                <small class="text-muted float-right mt-1">Just now</small>
              </div>
              <div class="text-truncate">
                This is my extremely long example subject</div>
            </div>
          </a>
          <a href="#" class="dropdown-item">
            <div class="message">
              <div>
                <small class="text-muted">From: [[USERNAME]]</small>
                <small class="text-muted float-right mt-1">Just now</small>
              </div>
              <div class="text-truncate">
                This is my extremely long example subject</div>
            </div>
          </a>
          <a href="game.php?page=messages" class="dropdown-item text-center">
            <strong>View all messages</strong>
          </a>
        </div>
      </li>
	  {/if}
      <li class="nav-item dropdown">
        <a class="nav-link" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">
          <img src="img/avatars/default.jpg" class="img-avatar">
        </a>
        <div class="dropdown-menu dropdown-menu-right">
          <div class="dropdown-header text-center">
            <strong>{$username}</strong>
          </div>
		  {if isModuleAvailable($smarty.const.MODULE_NOTICE)}
          <a class="dropdown-item" href="game.php?page=notes"><i class="fa fa-address-book"></i> {$LNG.lm_notes}</a>
		  {/if}
          <a class="dropdown-item" href="index.php?page=rules"><i class="fa fa-key"></i> {$LNG.lm_rules}</a>
          <a class="dropdown-item" href="game.php?page=settings"><i class="fa fa-server"></i> {$LNG.lm_options}</a>
          <a class="dropdown-item" href="game.php?page=logout"><i class="fa fa-sign-out"></i> Logout</a>
          <a class="dropdown-item" href="game.php?page=changelog"><i class="fa fa-repeat"></i> {$LNG.lm_changelog}</a>
		  {if $authlevel > 0}
          <a class="dropdown-item" target="_blank" href="./admin.php"><i class="fa fa-star"></i> {$LNG.lm_administration} ({$VERSION})</a>
		  {/if}
        </div>
      </li>
    </ul>

    <button class="navbar-toggler mobile-aside-menu-toggler d-lg-none" type="button">
      <span class="navbar-toggler-icon"></span>
    </button>
    <button class="navbar-toggler aside-menu-toggler d-md-down-none" type="button">
      <span class="navbar-toggler-icon"></span>
    </button>

	{if !$vmode}
		<script type="text/javascript">
		var viewShortlyNumber	= {$shortlyNumber|json};
		var vacation			= {$vmode};
        $(function() {
		{foreach $resourceTable as $resourceID => $resourceData}
		{if isset($resourceData.production)}
            resourceTicker({
                available: {$resourceData.current|json},
                limit: [0, {$resourceData.max|json}],
                production: {$resourceData.production|json},
                valueElem: "current_{$resourceData.name}"
            }, true);
		{/if}
		{/foreach}
        });
		</script>
        <script src="scripts/game/topnav.js"></script>
        {if $hasGate}<script src="scripts/game/gate.js"></script>{/if}
		{/if}

	{if $closed}
	<div class="infobox">{$LNG.ov_closed}</div>
	{elseif $delete}
	<div class="infobox">{$delete}</div>
	{elseif $vacation}
	<div class="infobox">{$LNG.tn_vacation_mode} {$vacation}</div>
	{/if}

  </header>