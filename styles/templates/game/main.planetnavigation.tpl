<aside class="aside-menu">
	<div class="container border-0">
		<div class="row blue-bg d-sm-block d-md-none">
			<div class="col">
				{foreach $AllPlanets as $PlanetRow}
					{if $PlanetRow.id == $current_pid}
						<h5>{$PlanetRow.name}</h5>
					{/if}
				{/foreach}
			</div>
		</div>
		{foreach $resourceTable as $resourceID => $resourceData}
		<div class="row d-sm-block d-md-none">
			<div class="col-1">
				<div class="d-flex align-self-center res-sprite sprite-{$resourceData.name}"></div>
			</div>
			<div class="col-auto">
				{if $shortlyNumber}
				{else}
					{if !isset($resourceData.current)}
						{$resourceData.current = $resourceData.max + $resourceData.used}
							<span class="ovr_current {if $resourceData.current < 0} text-red{/if}">{$resourceData.current|number} / {$resourceData.max|number}</span>
						{else}
						{if isset($resourceData.production)}
							<span class="text-green">(+{$resourceData.production|number})</span> 
						{/if}
						<span class="ovr_current" id="ovr_{$resourceData.name}" data-real="{$resourceData.current}">{$resourceData.current|number}</span>
					{/if}
					{if !isset($resourceData.current) || !isset($resourceData.max) || $resourceID == 911}
					{else}
						/ <span class="text-green" id="max_{$resourceData.name}">{$resourceData.max|number}
						</span>
					{/if}
				{/if}
			</div>
		</div>
		<!--/.row-->
		{/foreach}
		<div class="row mb-2">
			<div class="col-12 text-center">
				<small>{$AllPlanets|count} / {$MaxPlanets} {$LNG.pn_planets}</small>
			</div>
		</div>
		{foreach $AllPlanets as $PlanetRow}
			<div class="row">
				<div class="col-auto align-self-center">
					<a href="game.php?page={if $pagename != ''}{$pagename}{else}overview{/if}&amp;cp={$PlanetRow.id}" title="{$PlanetRow.name}">
						{if $PlanetRow.id == $current_pid}
							<div class="planet-nav-badge planet-sprite sprite-{$PlanetRow.image}"></div>
						{else}
							<div class="planet-sprite sprite-{$PlanetRow.image}"></div>
						{/if}
					</a>
				</div>
				<div class="col-8{if $PlanetRow.id == $current_pid || $PlanetRow.id_luna == $current_pid} text-green{/if}">
					{$PlanetRow.name}<br/>
					<a href="game.php?page=galaxy&amp;galaxy={$PlanetRow.galaxy}&amp;system={$PlanetRow.system}">[{$PlanetRow.galaxy}:{$PlanetRow.system}:{$PlanetRow.planet}]</a>
					{if $PlanetRow.id_luna != 0}
						&nbsp;<a class="no-text-decoration" href="game.php?page={if $pagename != ''}{$pagename}{else}overview{/if}&amp;cp={$PlanetRow.id_luna}">
						{if $PlanetRow.id_luna == $current_pid}
							<div class="planet-nav-badge d-inline-block planet-sprite sprite-mond align-middle"></div>
						{else}
							<div class="d-inline-block planet-sprite sprite-mond align-middle"></div>
						{/if}
						</a>
					{/if}<br/>
					<small class="text-default">{$PlanetRow.build}</small>
				</div>
			</div>

			{if !$PlanetRow@last}
				<hr />
			{/if}
		{/foreach}
	</div>
</aside>