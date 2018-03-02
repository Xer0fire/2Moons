    <aside class="aside-menu">
	<div class="container border-0">
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