    <aside class="aside-menu">
	<div class="container border-0">
		{foreach $AllPlanets as $PlanetRow}
			<div class="row">
				<div class="col-auto align-self-center">
					<a href="game.php?page={$pagename}&amp;cp={$PlanetRow.id}" title="{$PlanetRow.name}">
						<img src="{$dpath}planeten/small/s_{$PlanetRow.image}.jpg" alt="{$PlanetRow.name}" width="50px" height="50px"/>
					</a>
					{if $PlanetRow.id == $current_pid}
						<span class="badge text-yellow pill-top-right"><i class="fa fa-certificate"></i></span>
					{/if}
				</div>
				<div class="col-8">
					{$PlanetRow.name}</br>
					<a href="game.php?page=galaxy&amp;galaxy=1&amp;system=1">[{$PlanetRow.galaxy}:{$PlanetRow.system}:{$PlanetRow.planet}]</a>
					{if $PlanetRow.id_luna != 0}
						{if $PlanetRow.id_luna == $current_pid}
							&nbsp;<a href="game.php?page={$pagename}&amp;cp={$PlanetRow.id_luna}"><img src="{$dpath}planeten/mond.jpg" width="30px" height="30px"/></a>
							<span class="badge text-yellow pill-top-right-moon"><i class="fa fa-certificate"></i></span>
						{else}
							&nbsp;<a href="game.php?page={$pagename}&amp;cp={$PlanetRow.id_luna}"><img src="{$dpath}planeten/mond.jpg" width="30px" height="30px"/></a>
						{/if}
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