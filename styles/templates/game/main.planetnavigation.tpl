    <aside class="aside-menu">
	<div class="container border-0">
		{foreach $AllPlanets as $PlanetRow}
			<div class="row">
				<div class="col-auto align-self-center">
					<a href="game.php?page={$pagename}&amp;cp={$PlanetRow.id}" title="{$PlanetRow.name}">
						{if $PlanetRow.id == $current_pid}
							<div class="planet-nav-badge planet-sprite sprite-{$PlanetRow.image}"></div>
						{else}
							<div class="planet-sprite sprite-{$PlanetRow.image}"></div>
						{/if}
					</a>
				</div>
				<div class="col-8">
					{$PlanetRow.name}</br>
					<a href="game.php?page=galaxy&amp;galaxy=1&amp;system=1">[{$PlanetRow.galaxy}:{$PlanetRow.system}:{$PlanetRow.planet}]</a>
					{if $PlanetRow.id_luna != 0}
						&nbsp;<a href="game.php?page={$pagename}&amp;cp={$PlanetRow.id_luna}">
						{if $PlanetRow.id_luna == $current_pid}
							<div class="planet-nav-badge d-inline-block planet-sprite sprite-mond align-middle"></div>
						{else}
							<div class="d-inline-block planet-sprite sprite-mond align-middle"></div>
						{/if}
						</a>
					{/if}</br>
					<span class="planet-nav-building">{$PlanetRow.build}</span>
				</div>
			</div>

			{if !$PlanetRow@last}
				<hr />
			{/if}
		{/foreach}
	</div>
    </aside>