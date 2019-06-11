{block name="title" prepend}{$LNG.lm_resources}{/block}
{block name="content"}
	<div class="row">
		<div class="col">
			<div class="card">
				<div class="card-header">
					Resources
					<div class="card-actions">
						<a href="game.php?page=buildings"><i class="fa fa-university"></i></a>
						{if isModuleAvailable($smarty.const.MODULE_RESEARCH) && $navShipyard > 0}
						<a href="game.php?page=shipyard&mode=fleet"><i class="fa fa-microchip"></i></a>
						{/if}
						<a href="#" class="btn-minimize" data-toggle="collapse" data-target="#resources" aria-expanded="true"><i class="fa fa-chevron-up"></i></a>
				  </div>
				</div>
				<div class="card-body-container collapse show" id="resources">
					<div class="card-body">
						<form action="?page=resources" method="post">
						<input type="hidden" name="mode" value="send">
						{foreach $productionList as $productionID => $productionRow}
							<div class="row">
								<div class="col">
									<p class="h5"><a href='#' onclick='info({$productionID}, "{$LNG.tech.$productionID}")' data-toggle='modal' data-target='#infoModal'>{$LNG.tech.$productionID}</a> ({$productionRow.elementLevel})</p>
								</div>
							</div>
							<div class="row">
									<div class="col-10 col-md-9 align-self-center">
									<div class="row">
									{foreach $productionRow.production as $resID => $resVal}
										{if $productionRow.production|@count == 1}
											<div class="col-md-6"></div>
										{/if}
										<div class="col-12 col-md-6 align-self-center">
											<div class="media">
												<div class="d-flex mr-2 align-self-center res-sprite sprite-{$LNG.sprite.{$resID}}"></div>
												<div class="media-body">
													{if $basicProduction.$resID != 0}
														{if $resID != 911 && $productionID != 12 && $productionID != 212}
															({$basicProduction.$resID|number})
														{elseif $productionID == 4}
															({$basicProduction.$resID|number})
														{/if}
													{/if}
													<span class="{if $productionRow.production.$resID > 0}text-green{elseif $productionRow.production.$resID < 0}text-red{else}text-white{/if}">
														{if isset($basicProduction.$resID)}
															{$res=$resVal}
															{$res=$res-$basicProduction.$resID}
															{$res|number}
														{else}
															{$resVal|number}
														{/if}
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
									<div class="row">
										<div class="col-md-6"></div>
										<div class="col-auto col-md-6 align-self-center">
											<div class="media">
												<div class="d-flex mr-2 align-self-center res-sprite sprite-{$LNG.sprite.{$resID}}"></div>
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
				<div class="card-body-container collapse show" id="total">
					<div class="card-body">
						<div class="row">
							{foreach $totalProduction as $resID => $resVal}
								<div class="col-6">
									<div class="d-inline-block align-middle align-self-center mr-2 res-sprite sprite-{$LNG.sprite.{$resID}}"></div><span class="{if $resID > 0}text-green{elseif $resID < 0}text-red{else}text-white{/if}">{$resVal|number}</span>
								</div>
							{/foreach}
						</div>
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
				<div class="card-body-container collapse show" id="protected">
					<div class="card-body">
						<div class="row">
							{foreach $protectedProduction as $resID => $resVal}
								<div class="col-6">
									<div class="d-inline-block align-middle align-self-center mr-2 res-sprite sprite-{$LNG.sprite.{$resID}}"></div><span class="{if $resID > 0}text-green{elseif $resID < 0}text-red{else}text-white{/if}">{$resVal}</span>
								</div>
							{/foreach}
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="col-sm-6">
			<div class="card">
				<div class="card-header">
					{$LNG.rs_daily}
					<div class="card-actions">
						<a href="#" class="btn-minimize collapsed" data-toggle="collapse" data-target="#daily" aria-expanded="true"><i class="fa fa-chevron-up"></i></a>
					</div>
				</div>
				<div class="card-body-container collapse show" id="daily">
					<div class="card-body">
						<div class="row">
							{foreach $dailyProduction as $resID => $resVal}
								<div class="col-6">
									<div class="d-inline-block align-middle align-self-center mr-2 res-sprite sprite-{$LNG.sprite.{$resID}}"></div><span class="{if $resID > 0}text-green{elseif $resID < 0}text-red{else}text-white{/if}">{$resVal|number}</span>
								</div>
							{/foreach}
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="col-sm-6">
			<div class="card">
				<div class="card-header">
					{$LNG.rs_weekly}
					<div class="card-actions">
						<a href="#" class="btn-minimize collapsed" data-toggle="collapse" data-target="#weekly" aria-expanded="true"><i class="fa fa-chevron-up"></i></a>
					</div>
				</div>
				<div class="card-body-container collapse show" id="weekly">
					<div class="card-body">
						<div class="row">
							{foreach $weeklyProduction as $resID => $resVal}
								<div class="col-6">
									<div class="d-inline-block align-middle align-self-center mr-2 res-sprite sprite-{$LNG.sprite.{$resID}}"></div><span class="{if $resID > 0}text-green{elseif $resID < 0}text-red{else}text-white{/if}">{$resVal|number}</span>
								</div>
							{/foreach}
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="modal fade" id="infoModal" tabindex="-1" role="dialog" aria-labelledby="infoModal" style="display: none;" aria-hidden="true">
		<div class="modal-dialog modal-primary modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title"></h4>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div id="infoModalBody" class="modal-body"></div>
			</div>
		</div>
	</div>
{/block}