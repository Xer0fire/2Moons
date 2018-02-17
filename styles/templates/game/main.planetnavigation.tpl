    <aside class="aside-menu">
	<div class="container border-0">
		{foreach $AllPlanets as $PlanetRow}
			<div class="row">
				<div class="col-auto align-self-center">
					<a href="game.php?page={$pagename}&amp;cp={$PlanetRow.id}" title="{$PlanetRow.name}">
						{if $PlanetRow.id == $current_pid}
							<span class="badge text-blue">
								<i class="position-absolute fa fa-certificate pill-planetnav"></i>
							</span>
						{/if}
						<div class="planet-sprite sprite-{$PlanetRow.image}"></div>
					</a>
				</div>
				<div class="col-8">
					{$PlanetRow.name}</br>
					<a href="game.php?page=galaxy&amp;galaxy=1&amp;system=1">[{$PlanetRow.galaxy}:{$PlanetRow.system}:{$PlanetRow.planet}]</a>
					{if $PlanetRow.id_luna != 0}
						{if $PlanetRow.id_luna == $current_pid}
							&nbsp;<a href="game.php?page={$pagename}&amp;cp={$PlanetRow.id_luna}">
								<span class="badge text-blue">
									<i class="position-absolute fa fa-certificate"></i>
									<div class="d-inline-block planet-sprite sprite-mond align-middle"></div>
								</span>
							</a>
						{else}
							&nbsp;<a href="game.php?page={$pagename}&amp;cp={$PlanetRow.id_luna}">
								<div class="d-inline-block planet-sprite sprite-mond align-middle"></div>
							</a>
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