{block name="title" prepend}{$LNG.lm_fleet}{/block}
{block name="content"}
<div class="row">
	<div class="col-12">
		<div class="card">
			<div class="card-header">
				Fleet
				<div class="card-actions">
					<a href="game.php?page=galaxy"><i class="fa fa-globe"></i></a>
					<a href="game.php?page=shipyard&mode=fleet"><i class="fa fa-microchip"></i></a>
					<a href="#" class="btn-minimize" data-toggle="collapse" data-target="#fleetqueue" aria-expanded="true"><i class="fa fa-chevron-up"></i></a>
				</div>
			</div>
			<div class="card-body collapse show p-0" id="fleetqueue">
				<div class="table-responsive">
				<table class="table table-striped table-sm">
					<tr>
						<td>{$LNG.fl_number}</td>
						<td>{$LNG.fl_mission}</td>
						<td>{$LNG.fl_ammount}</td>
						<td>{$LNG.fl_beginning}</td>
						<td class="d-none d-md-table-cell">{$LNG.fl_departure}</td>
						<td>{$LNG.fl_destiny}</td>
						<td class="d-none d-md-table-cell">{$LNG.fl_arrival}</td>
						<td>{$LNG.fl_objective}</td>
						<td>{$LNG.fl_order}</td>
					</tr>
					{foreach name=FlyingFleets item=FlyingFleetRow from=$FlyingFleetList}
						<tr>
							<td>{$smarty.foreach.FlyingFleets.iteration}</td>
							<td>{$LNG["type_mission_{$FlyingFleetRow.mission}"]}
								{if $FlyingFleetRow.state == 1}
									 <a title="{$LNG.fl_returning}">{$LNG.fl_r}</a>
								{else}
									 <a title="{$LNG.fl_onway}">{$LNG.fl_a}</a>
								{/if}
							</td>
							<td>
								<a class="tooltip_sticky" data-tooltip-content="<table width='100%'><tr><th colspan='2' style='text-align:center;'>{$LNG.fl_info_detail}</th></tr>{foreach $FlyingFleetRow.FleetList as $shipID => $shipCount}<tr><td class='transparent'>{$LNG.tech.{$shipID}}:</td><td class='transparent'>{$shipCount}</td></tr>{/foreach}</table>">{$FlyingFleetRow.amount}</a>
							</td>
							<td>
								<a href="game.php?page=galaxy&amp;galaxy={$FlyingFleetRow.startGalaxy}&amp;system={$FlyingFleetRow.startSystem}">[{$FlyingFleetRow.startGalaxy}:{$FlyingFleetRow.startSystem}:{$FlyingFleetRow.startPlanet}]</a>
							</td>
							<td class="d-none d-md-table-cell" {if $FlyingFleetRow.state == 0} style="color:lime"{/if}>
								{$FlyingFleetRow.startTime}
							</td>
							<td>
								<a href="game.php?page=galaxy&amp;galaxy={$FlyingFleetRow.endGalaxy}&amp;system={$FlyingFleetRow.endSystem}">[{$FlyingFleetRow.endGalaxy}:{$FlyingFleetRow.endSystem}:{$FlyingFleetRow.endPlanet}]</a>
							</td>
							{if $FlyingFleetRow.mission == 4 && $FlyingFleetRow.state == 0}
								<td class="d-none d-md-table-cell">-</td>
							{else}
								<td class="d-none d-md-table-cell"{if $FlyingFleetRow.state != 0} style="color:lime"{/if}>
									{$FlyingFleetRow.endTime}
								</td>
							{/if}
							<td id="fleettime_{$smarty.foreach.FlyingFleets.iteration}" class="fleets" data-fleet-end-time="{$FlyingFleetRow.returntime}" data-fleet-time="{$FlyingFleetRow.resttime}">
								{pretty_fly_time({$FlyingFleetRow.resttime})}
							</td>
							<td>
								{if !$isVacation && $FlyingFleetRow.state != 1}
									<form action="game.php?page=fleetTable&amp;action=sendfleetback" method="post">
										<input name="fleetID" value="{$FlyingFleetRow.id}" type="hidden">
										<input value="{$LNG.fl_send_back}" type="submit">
									</form>
									{if $FlyingFleetRow.mission == 1}
										<form action="game.php?page=fleetTable&amp;action=acs" method="post">
											<input name="fleetID" value="{$FlyingFleetRow.id}" type="hidden">
											<input value="{$LNG.fl_acs}" type="submit">
										</form>
									{/if}
								{else}
									&nbsp;-&nbsp;
								{/if}
							</td>
						</tr>
					{foreachelse}
						<tr>
							<td>-</td>
							<td>-</td>
							<td>-</td>
							<td>-</td>
							<td class="d-none d-md-table-cell">-</td>
							<td>-</td>
							<td class="d-none d-md-table-cell">-</td>
							<td>-</td>
							<td>-</td>
						</tr>
					{/foreach}
					{if $maxFleetSlots == $activeFleetSlots}
						<tr>
							<td colspan="9">
								{$LNG.fl_no_more_slots}
							</td>
						</tr>
					{/if}
				</table>
				</div>
			</div>
			<div class="card-footer">
				<div class="row">
					<div class="col-5">
						{$LNG.fl_fleets} {$activeFleetSlots} / {$maxFleetSlots}
					</div>
					<div class="col-7 text-right">
						{$activeExpedition} / {$maxExpedition} {$LNG.fl_expeditions}
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
{if !empty($acsData)}
{include file="shared.fleetTable.acsTable.tpl"}
{/if}


<div class="row">
	<div class="col-12">
		<div class="card">
			<div class="card-header">
				{$LNG.fl_new_mission_title}
			</div>
			<div class="card-body">
				<form action="?page=fleetStep1" method="post">
					<input type="hidden" name="galaxy" value="{$targetGalaxy}">
					<input type="hidden" name="system" value="{$targetSystem}">
					<input type="hidden" name="planet" value="{$targetPlanet}">
					<input type="hidden" name="type" value="{$targetType}">
					<input type="hidden" name="target_mission" value="{$targetMission}">
					{foreach from=$FleetsOnPlanet key=ID item=FleetRow name=List}
						{if $smarty.foreach.List.first}
							<div class="row">
						{else}
							<div class="row mt-3 mt-md-0">
						{/if}
							<div class="col-12 col-md-6">
								{if $FleetRow.speed != 0} 
									<span class="h5">
										<a title="{$LNG.fl_speed_title} {$FleetRow.speed}">{$LNG.tech.{$FleetRow.id}}</a> (<span id="ship{$FleetRow.id}_value">{$FleetRow.count|number}</span>)
									</span>
								{/if}
							</div>
							{if $FleetRow.speed != 0}
								<div class="col-12 col-md-6">
									<div class="controls mt-1 col-12">
										<div class="input-group">
											<span class="input-group-append">
												<button class="btn btn-warning" type="button" onclick="$('ship{$FleetRow.id}_input').val('0')">zero</button>
											</span>
											<input id="ship{$FleetRow.id}_input" class="form-control" size="16" type="text" name="ship{$FleetRow.id}" value="0" tabindex="">
											<span class="input-group-append">
												<button class="btn btn-warning" type="button" onclick="javascript:maxShip('ship{$FleetRow.id}')">max</button>
											</span>
										</div>
									</div>
								</div>
							{/if}
						</div>
					{/foreach}
					<div class="row mt-3">
						{if count($FleetsOnPlanet) == 0}
							<div class="col">
								{$LNG.fl_no_ships}
							</div>
						{else}
							<div class="col">
								<button class="btn btn-lg btn-block btn-warning" type="button" onclick="javascript:noShips()">{$LNG.fl_remove_all_ships}</button>
							</div>
							<div class="col">
								<button class="btn btn-lg btn-block btn-warning" type="button" onclick="javascript:maxShips()">{$LNG.fl_select_all_ships}</button>
							</div>
						{/if}
					</div>
					<div class="row mt-3">
						<div class="col">
							{if $maxFleetSlots != $activeFleetSlots}
								<button class="btn btn-lg btn-block btn-success" type="submit">{$LNG.fl_continue}</button>
							{else}
								<button disabled="disabled" class="btn btn-lg btn-block btn-success" type="submit">{$LNG.fl_continue}</button>
							{/if}
							
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
{/block}
{block name="script" append}<script src="scripts/game/fleetTable.js"></script>{/block}