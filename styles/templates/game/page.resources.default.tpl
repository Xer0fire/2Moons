{block name="title" prepend}{$LNG.lm_resources}{/block}
{block name="content"}
	<div class="row">
		<div class="col">
			<div class="card">
				<div class="card-header">
					Resources
					<div class="card-actions">
						<a href="game.php?page=buildings"><i class="fa fa-university"></i></a>
						<a href="game.php?page=shipyard&mode=fleet"><i class="fa fa-microchip"></i></a>
						<a href="#" class="btn-minimize" data-toggle="collapse" data-target="#resources" aria-expanded="true"><i class="fa fa-chevron-up"></i></a>
				  </div>
				</div>
				<div class="card-body collapse show" id="resources">
					<form action="?page=resources" method="post">
					<input type="hidden" name="mode" value="send">
					{foreach $productionList as $productionID => $productionRow}
						<div class="row">
							<div class="col">
								<p class="h5">{$LNG.tech.$productionID } ({$productionRow.elementLevel})</p>
							</div>
						</div>
						<div class="row">
								<div class="col-10 col-md-9 align-self-center">
								<div class="row justify-content-between">
								{foreach $productionRow.production as $resID => $resVal}
									{if $productionRow.production|@count == 1}
										<div class="col-md-6"></div>
									{/if}
									<div class="col-auto col-md-6">
										<div class="media">
											<img class="d-flex mr-2 align-self-center" src="{$dpath}images//{$LNG.tech.{$resID}}.gif">
											<div class="media-body">
												{if $resID != 911 && $productionID != 12 && $productionID != 212}
													({$basicProduction.$resID|number})
												{elseif $productionID == 4}
													({$basicProduction.$resID|number})
												{/if}
												<span class="{if $productionRow.production.$resID > 0}text-green{elseif $productionRow.production.$resID < 0}text-red{else}text-white{/if}">
													{$resVal|number}
												</span>
												{if $productionID  != 12 && $resID != 911} <br/> Max: {$storage.$resID}{/if}
											</div>
										</div>
									</div>
								{/foreach}
								</div>
								</div>
							<div class="col-* col-md-3">
								{html_options class="form-control mt-1 mt-md-0"  name="prod[{$productionID}]" options=$prodSelector selected=$productionRow.prodLevel}
							</div>
							</div>
							<hr/>
					{/foreach}
					{if empty($productionMoon) ||  $productionMoon.0.solarreflector == 0}
					{else}
						<div class="row">
							<div class="col">
								<p class="h5">{$LNG.tech.45} ({$productionMoon.0.solarreflector}) [{$LNG.type_planet_3}]</p>
							</div>
						</div>
						<div class="row">
							<div class="col-10 col-md-9 align-self-center">
								<div class="row justify-content-between">
									<div class="col-md-6"></div>
									<div class="col-auto col-md-6">
										<div class="media">
											<img class="d-flex mr-2 align-self-center" src="{$dpath}images//{$LNG.tech.911}.gif">
											<div class="media-body">
												<span class="{if {$productionMoon.0.energy|number} > 0}text-green{elseif {$productionMoon.0.energy|number} < 0}text-red{else}text-white{/if}">
													{$productionMoon.0.energy|number}
												</span>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="col-* col-md-3">
							</div>
						</div>
						<hr/>
					{/if}
					<div class="row">
						<div class="col">
							<button type="submit" class="btn btn-success btn-lg btn-block mt-1">{$LNG.rs_calculate}</button>
						</div>
					</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-sm-6">
			<div class="card">
				<div class="card-header">
					{$LNG.rs_sum} per Hour
					<div class="card-actions">
						<a href="#" class="btn-minimize" data-toggle="collapse" data-target="#total" aria-expanded="true"><i class="fa fa-chevron-up"></i></a>
					</div>
				</div>
				<div class="card-body collapse show" id="total">
					<div class="row">
						{foreach $totalProduction as $resID => $resVal}
							<div class="col-6">
								<img class="mr-2" src="{$dpath}images//{$LNG.tech.{$resID}}.gif"><span class="{if $resID > 0}text-green{elseif $resID < 0}text-red{else}text-white{/if}">{$resVal|number}</span>
							</div>
						{/foreach}
					</div>
				</div>
			</div>
		</div>

		<div class="col-sm-6">
			<div class="card">
				<div class="card-header">
					{$LNG.rs_protected}
					<div class="card-actions">
						<a href="#" class="btn-minimize" data-toggle="collapse" data-target="#protected" aria-expanded="true"><i class="fa fa-chevron-up"></i></a>
					</div>
				</div>
				<div class="card-body collapse show" id="protected">
					<div class="row">
						{foreach $protectedProduction as $resID => $resVal}
							<div class="col-6">
								<img class="mr-2" src="{$dpath}images//{$LNG.tech.{$resID}}.gif"><span class="{if $resID > 0}text-green{elseif $resID < 0}text-red{else}text-white{/if}">{$resVal}</span>
							</div>
						{/foreach}
					</div>
				</div>
			</div>
		</div>

		<div class="col-sm-6">
			<div class="card">
				<div class="card-header">
					{$LNG.rs_daily}
					<div class="card-actions">
						<a href="#" class="btn-minimize collapsed" data-toggle="collapse" data-target="#daily" aria-expanded="true"><i class="fa fa-chevron-down"></i></a>
					</div>
				</div>
				<div class="card-body collapse" id="daily">
					<div class="row">
						{foreach $dailyProduction as $resID => $resVal}
							<div class="col-6">
								<img class="mr-2" src="{$dpath}images//{$LNG.tech.{$resID}}.gif"><span class="{if $resID > 0}text-green{elseif $resID < 0}text-red{else}text-white{/if}">{$resVal|number}</span>
							</div>
						{/foreach}
					</div>
				</div>
			</div>
		</div>

		<div class="col-sm-6">
			<div class="card">
				<div class="card-header">
					{$LNG.rs_weekly}
					<div class="card-actions">
						<a href="#" class="btn-minimize collapsed" data-toggle="collapse" data-target="#weekly" aria-expanded="true"><i class="fa fa-chevron-down"></i></a>
					</div>
				</div>
				<div class="card-body collapse" id="weekly">
					<div class="row">
						{foreach $weeklyProduction as $resID => $resVal}
							<div class="col-6">
								<img class="mr-2" src="{$dpath}images//{$LNG.tech.{$resID}}.gif"><span class="{if $resID > 0}text-green{elseif $resID < 0}text-red{else}text-white{/if}">{$resVal|number}</span>
							</div>
						{/foreach}
					</div>
				</div>
			</div>
		</div>
	</div>
{/block}