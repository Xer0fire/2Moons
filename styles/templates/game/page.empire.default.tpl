{block name="title" prepend}{$LNG.lm_empire}{/block}
{block name="content"}
	<div class="card">
		<div class="card-header">
		  Empire
		</div>
		<div class="card-body no-gutters">
			<ul class="empire-nav nav nav-tabs" role="tablist">
				<li class="nav-item mr-1">
					<a class="nav-link active" data-toggle="tab" href="#{$LNG.lv_resources}" role="tab" aria-controls="{$LNG.lv_resources}"><i class="fa fa-leaf"></i></a>
				</li>
				<li class="nav-item mr-1">
					<a class="nav-link" data-toggle="tab" href="#{$LNG.lv_buildings}" role="tab" aria-controls="{$LNG.lv_buildings}"><i class="fa fa-university"></i></a>
				</li>
				<li class="nav-item">
					<a class="nav-link" data-toggle="tab" href="#{$LNG.lv_technology}" role="tab" aria-controls="{$LNG.lv_technology}"><i class="fa fa-flask"></i></a>
				</li>
				<li class="nav-item mr-1">
					<a class="nav-link" data-toggle="tab" href="#{$LNG.lv_ships}" role="tab" aria-controls="{$LNG.lv_ships}"><i class="fa fa-microchip"></i></a>
				</li>
				<li class="nav-item mr-1">
					<a class="nav-link" data-toggle="tab" href="#{$LNG.lv_defenses}" role="tab" aria-controls="{$LNG.lv_defenses}"><i class="fa fa-flag"></i></a>
				</li>
			</ul>
			<div class="tab-content">
				<div class="tab-pane active" id="{$LNG.lv_resources}" role="tabpanel">
					<table class="table table-striped table-responsive-sm table-sm">
						<thead>
							<tr>
								<td></td>
								<td></td>
								{foreach $planetList.image as $planetID => $image}
								<td><a href="game.php?page=overview&amp;cp={$planetID}"><img width="50px" height="50px" border="0" src="{$dpath}planeten/small/s_{$image}.jpg"></a></td>
								{/foreach}
							</tr>
							<tr>
								<th>{$LNG.lv_name}</td>
								<th>{$LNG.lv_total}</th>
								{foreach $planetList.name as $name}
									<th>{$name}</th>
								{/foreach}
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>{$LNG.lv_coords}</td>
								<td>-</td>
								{foreach $planetList.coords as $coords}
									<td><a href="game.php?page=galaxy&amp;galaxy={$coords.galaxy}&amp;system={$coords.system}">[{$coords.galaxy}:{$coords.system}:{$coords.planet}]</a></td>
								{/foreach}
							</tr>
							{foreach $planetList.resource as $elementID => $resourceArray}
								<tr>
									<td>{$LNG.tech.$elementID}</td>
									{if $elementID != 911}
										<td>{array_sum($resourceArray)|number}</td>
									{else}
										<td>-</td>
									{/if}
									{foreach $resourceArray as $planetID => $resource}
										<td>{$resource|number}</td>
									{/foreach}
								</tr>
							{/foreach}
						</tbody>
					</table>
				</div>

				<div class="tab-pane" id="{$LNG.lv_buildings}" role="tabpanel">
					<table class="table table-striped table-responsive-sm table-sm">
						<thead>
							<tr>
								<td></td>
								{foreach $planetList.image as $planetID => $image}
								<td><a href="game.php?page=overview&amp;cp={$planetID}"><img width="50px" height="50px" border="0" src="{$dpath}planeten/small/s_{$image}.jpg"></a></td>
								{/foreach}
							</tr>
							<tr>
								<th>{$LNG.lv_name}</th>
								{foreach $planetList.name as $name}
									<th>{$name}</th>
								{/foreach}
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>{$LNG.lv_coords}</td>
								{foreach $planetList.coords as $coords}
									<td><a href="game.php?page=galaxy&amp;galaxy={$coords.galaxy}&amp;system={$coords.system}">[{$coords.galaxy}:{$coords.system}:{$coords.planet}]</a></td>
								{/foreach}
							</tr>
								{foreach $planetList.build as $elementID => $buildArray}
									<tr>
										<td>{$LNG.tech.$elementID}</td>
										{foreach $buildArray as $planetID => $build}
											<td>{$build|number}</td>
										{/foreach}
									</tr>
								{/foreach}
						</tbody>
					</table>
				</div>

				<div class="tab-pane" id="{$LNG.lv_technology}" role="tabpanel">
					<table class="table table-striped table-responsive-sm table-sm">
						<thead>
							<tr>
								<th>{$LNG.lv_name}</td>
								<th>{$LNG.bd_lvl}</td>
							</tr>
						</thead>
						<tbody>
							{foreach $planetList.tech as $elementID => $tech}
							<tr>
								<td>{$LNG.tech.$elementID}</td>
								<td>{$tech|number}</td>
							</tr>
							{/foreach}
						</tbody>
					</table>
				</div>
				
				<div class="tab-pane" id="{$LNG.lv_ships}" role="tabpanel">
					<table class="table table-striped table-responsive-sm table-sm">
						<thead>
							<tr>
								<td></td>
								<td></td>
								{foreach $planetList.image as $planetID => $image}
								<td><a href="game.php?page=overview&amp;cp={$planetID}"><img width="50px" height="50px" border="0" src="{$dpath}planeten/small/s_{$image}.jpg"></a></td>
								{/foreach}
							</tr>
							<tr>
								<th>{$LNG.lv_name}</td>
								<th>{$LNG.lv_total}</th>
								{foreach $planetList.name as $name}
									<th>{$name}</th>
								{/foreach}
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>{$LNG.lv_coords}</td>
								<td>-</td>
								{foreach $planetList.coords as $coords}
									<td><a href="game.php?page=galaxy&amp;galaxy={$coords.galaxy}&amp;system={$coords.system}">[{$coords.galaxy}:{$coords.system}:{$coords.planet}]</a></td>
								{/foreach}
							</tr>
								{foreach $planetList.fleet as $elementID => $fleetArray}
									<tr>
										<td>{$LNG.tech.$elementID}</td>
										{if $elementID != 212}
											<td>{array_sum($fleetArray)|number}</td>
										{else}
											<td>-</td>
										{/if}
										{foreach $fleetArray as $planetID => $fleet}
											<td>{$fleet|number}</td>
										{/foreach}
									</tr>
								{/foreach}
						</tbody>
					</table>
				</div>

				<div class="tab-pane" id="{$LNG.lv_defenses}" role="tabpanel">
					<table class="table table-striped table-responsive-sm table-sm">
						<thead>
							<tr>
								<td></td>
								{foreach $planetList.image as $planetID => $image}
								<td><a href="game.php?page=overview&amp;cp={$planetID}"><img width="50px" height="50px" border="0" src="{$dpath}planeten/small/s_{$image}.jpg"></a></td>
								{/foreach}
							</tr>
							<tr>
								<th>{$LNG.lv_name}</th>
								{foreach $planetList.name as $name}
									<th>{$name}</th>
								{/foreach}
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>{$LNG.lv_coords}</td>
									{foreach $planetList.coords as $coords}
										<td><a href="game.php?page=galaxy&amp;galaxy={$coords.galaxy}&amp;system={$coords.system}">[{$coords.galaxy}:{$coords.system}:{$coords.planet}]</a></td>
									{/foreach}
							</tr>
								{foreach $planetList.defense as $elementID => $fleetArray}
									<tr>
										<td>{$LNG.tech.$elementID}</td>
										{foreach $fleetArray as $planetID => $fleet}
											<td>{$fleet|number}</td>
										{/foreach}
									</tr>
								{/foreach}
						</tbody>
					</table>
				</div>

			</div>
		</div>
	</div>
{/block}