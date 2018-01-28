    <aside class="aside-menu">
	<div class="container border-0">
		{foreach $AllPlanets as $PlanetRow}
		<div class="row">
			<div class="col-auto align-self-center">
				<a href="game.php?page={$pagename}&amp;cp={$PlanetRow.id}" title="{$PlanetRow.name}">
					<img src="{$dpath}planeten/small/s_{$PlanetRow.image}.jpg" alt="{$PlanetRow.name}" width="45px" height="45px"/>
				</a>
			</div>
			<div class="col-8">
				{$PlanetRow.name}</br>
				<a href="game.php?page=galaxy&amp;galaxy=1&amp;system=1">[{$PlanetRow.galaxy}:{$PlanetRow.system}:{$PlanetRow.planet}]</a>{if $PlanetRow.id_luna != 0}&nbsp;<a href="game.php?page={$pagename}&amp;cp={$PlanetRow.id_luna}"><img src="{$dpath}planeten/mond.jpg" width="30px" height="30px"/></a>{/if}</br>
				<span class="planet-nav-building">{$PlanetRow.build}</span>
			</div>
		</div>
		<hr />
		{/foreach}
	</div>
    </aside>