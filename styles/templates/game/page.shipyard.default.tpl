{block name="title" prepend}{if $mode == "defense"}{$LNG.lm_defenses}{else}{$LNG.lm_shipshard}{/if}{/block}
{block name="content"}
{if !$NotBuilding}
<div class="row">
	<div class="col">
		<div class="alert alert-danger" role="alert">
			{$LNG.bd_building_shipyard}
		</div>
	</div>
</div>
{/if}
{if !empty($BuildList)}

<div class="row">
	<div class="col-md-12">
		<div class="card border-0">
			<div class="card-header">
				{$LNG.lm_queue}
				<div class="card-actions">
					<a href="#" class="btn-minimize" data-toggle="collapse" data-target="#hangerqueue" aria-expanded="true"><i class="fa fa-chevron-up"></i></a>
				</div>
			</div>
			<div class="card-body-container collapse show" id="hangerqueue">
				<div class="card-body">
					<form action="game.php?page=shipyard&amp;mode={$mode}" method="post">
						<input type="hidden" name="action" value="delete">
						<div class="row">
							<div class="col">
								<select class="form-control" name="auftr[]" id="auftr" size="5" multiple><option>&nbsp;</option></select>
							</div>
						</div>
						<div class="row">
							<div class="col">
								<div class="alert alert-danger mt-1" role="alert">
									{$LNG.bd_cancel_warning}
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col">
								<button type="submit" class="btn btn-danger btn-lg btn-block mt-1 mt-md-0">{$LNG.bd_cancel_send}</button>
							</div>
						</div>
					</form>
				</div>
			</div>
			<div class="card-footer">
				<div class="row">
					<div class="col-12 col-md-6">
						<div class="row">
							<div class="col-12 col-md-auto">
								Current production:
							</div>
							<div class="col-12 col-md-auto">
								<span id="bx" class="z"></span>
							</div>
						</div>
					</div>
					<div class="col-12 col-md-6 text-md-right">
						<div class="row d-flex justify-content-end">
							<div class="col-12 col-md-auto">
								Total production time:
							</div>
							<div class="col-12 col-md-auto">
								<span id="timeleft"></span>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
{/if}

<form action="game.php?page=shipyard&amp;mode={$mode}" method="post">
<div class="row">
	<div class="col-md-12">
	  <div class="card border-0">
		<div class="card-header">
		{if $mode == "defense"}
			{$LNG.lm_defenses}
			<div class="card-actions">
				<a href="game.php?page=shipyard&amp;mode=fleet"><i class="fa fa-microchip"></i></a>
			</div>
		{else}
			{$LNG.lm_shipshard}
			<div class="card-actions">
				<a href="game.php?page=resources"><i class="fa fa-leaf"></i></a>
				<a href="game.php?page=fleettable"><i class="fa fa-space-shuttle"></i></a>
				<a href="game.php?page=shipyard&amp;mode=defense"><i class="fa fa-flag"></i></a>
			</div>
		{/if}
		</div>
		<div class="card-body" id="">
			{foreach $elementList as $ID => $Element}
				<div class="row">
					<div class="col-4 col-xl-2 d-none d-sm-block align-self-center"><div class="mx-auto build-sprite sprite-{$ID}"></div></div>
					<div class="col-12 col-sm-8 col-xl-10">
						<div class="row content-center">
							<div class="col-sm-12">
								<p class="h5"><a href="#" data-toggle="modal" data-target="#info_{$ID}">{$LNG.tech.{$ID}}</a> {if $Element.available != 0} ({$LNG.bd_available} {$Element.available|number}){/if}</p>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-8">{$LNG.fgf_time} {$Element.elementTime|time} </br> {$LNG.bd_max_ships_long}: {$Element.maxBuildable|number}</div>
						</div>
						<div class="row">
							<div class="col d-none d-md-block">
								{$LNG.shortDescription.{$ID}}
							</div>
						</div>
						<hr/>
						<div class="row">
							<div class="col-sm-12">Required per unit:</div>
						</div>
						{foreach $Element.costResources as $RessID => $RessAmount}{/foreach}
						<div class="row content-center mb-2">
						{foreach $ResourceCost.$ID as $ResID => $ResAmount}
							<div class="col">
								<div class="media">
									<div class="d-flex mr-2 align-self-center res-sprite sprite-{$LNG.sprite.{$ResID}}"></div>
									<div class="media-body">
										<span class="{if $ResAmount.overflow == 0}text-green{else}text-red{/if}">{$ResAmount.cost|number}</span>
									</div>
								</div>
							</div>
						{/foreach}
						</div>
						<div class="row content-center">
							<div class="controls mt-1 col-12">
								<div class="input-group">
									{if $Element.AlreadyBuild}
											<span class="input-group-append">
												<button disabled="disabled" class="btn btn-warning" type="button" onclick="$('#input_{$ID}').val('0')">zero</button>
											</span>
											<input id="input_{$ID}" disabled="disabled" class="form-control" size="16" type="text" name="fmenge[{$ID}]" id="input_{$ID}" value="{$LNG.bd_protection_shield_only_one}" tabindex="{$smarty.foreach.FleetList.iteration}" />
											<span class="input-group-append">
												<button disabled="disabled" class="btn btn-warning" type="button" onclick="$('#input_{$ID}').val('{$Element.maxBuildable}')">max</button>
											</span>
									{elseif $NotBuilding && $Element.buyable}
											<span class="input-group-append">
												<button class="btn btn-warning" type="button" onclick="$('#input_{$ID}').val('0')">zero</button>
											</span>
											<input id="input_{$ID}" class="form-control" size="16" type="text" id="input_{$ID}" name="fmenge[{$ID}]" id="input_{$ID}" value="0" tabindex="{$smarty.foreach.FleetList.iteration}" />
											<span class="input-group-append">
												<button class="btn btn-warning" type="button" onclick="$('#input_{$ID}').val('{$Element.maxBuildable}')">max</button>
											</span>
									{else}
											<span class="input-group-append">
												<button disabled="disabled" class="btn btn-warning" type="button" onclick="$('#input_{$ID}').val('0')">zero</button>
											</span>
											<input id="input_{$ID}" disabled="disabled" class="form-control" size="16" type="text" id="input_{$ID}" name="fmenge[{$ID}]" id="input_{$ID}" value="0" tabindex="{$smarty.foreach.FleetList.iteration}" />
											<span class="input-group-append">
												<button disabled="disabled" class="btn btn-warning" type="button" onclick="$('#input_{$ID}').val('{$Element.maxBuildable}')">max</button>
											</span>
									{/if}
								</div>
							</div>
						</div>
					</div>
				</div>
				
				<div class="modal fade" id="info_{$ID}" tabindex="-1" role="dialog" aria-labelledby="info_{$ID}" aria-hidden="true" style="display: none;">
					<div class="modal-dialog modal-lg modal-info" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h4 class="modal-title">{$LNG.tech.{$ID}}</h4>
								<button type="button" class="close" data-dismiss="modal" aria-label="Close">
								<span aria-hidden="true">×</span>
								</button>
							</div>
							<div class="modal-body">
								{assign var="info" value=$infoObj->show($ID)}
								{assign var="elementID" value=$info.elementID}
								{assign var="productionTable" value=$info.productionTable}
								{assign var="FleetInfo" value=$info.FleetInfo}
								{assign var="gateData" value=$info.gateData}
								{assign var="MissileList" value=$info.MissileList}
								{assign var="CurrentLevel" value=$info.CurrentLevel}
								{include file="page.information.default.tpl"}
							</div>
						</div>
					<!-- /.modal-content -->
					</div>
				<!-- /.modal-dialog -->
				</div>
				{if !$smarty.foreach.List.last}
					<hr/>
				{/if}
			{/foreach}
			{if $NotBuilding}
				<button type="submit" class="btn btn-success btn-lg btn-block mt-1 mt-md-0">{$LNG.bd_build_ships}</button>
			{else}
				<button type="submit" disabled="disabled" class="btn btn-danger btn-lg btn-block mt-1 mt-md-0">{$LNG.bd_build_ships}</button>
			{/if}
			</div>
		</div>
	</div>
</div>
</form>
{/block}
{block name="script" append}
<script type="text/javascript">
data			= {$BuildList|json};
bd_operating	= '{$LNG.bd_operating}';
bd_available	= '{$LNG.bd_available}';
</script>
{if !empty($BuildList)}
<script src="scripts/base/bcmath.js"></script>
<script src="scripts/game/shipyard.js"></script>
<script type="text/javascript">
$(function() {
    ShipyardInit();
});
</script>
{/if}
{/block}