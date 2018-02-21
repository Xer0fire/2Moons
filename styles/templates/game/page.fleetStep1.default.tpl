{block name="title" prepend}{$LNG.lm_fleet}{/block}
{block name="content"}
	<div class="card">
		<div class="card-header">
			{$LNG.fl_send_fleet}
		</div>
		<div class="card-body">
			<form action="game.php?page=fleetStep2" method="post" onsubmit="return CheckTarget()" id="form">
				<input type="hidden" name="token" value="{$token}">
				<input type="hidden" name="fleet_group" value="0">
				<input type="hidden" name="target_mission" value="{$mission}">
				<div class="row form-group">
					<div class="col-12 col-md-3 align-self-center">
						{$LNG.fl_destiny}
					</div>
					<div class="controls mt-1 col-12 col-md-9">
						<div class="input-group">
							<input class="form-control form-control-sm" type="text" id="galaxy" name="galaxy" size="3" maxlength="2" onkeyup="updateVars()" value="{$galaxy}">
							<span class="ml-1 mr-1">:</span>
							<input class="form-control form-control-sm" type="text" id="system" name="system" size="3" maxlength="3" onkeyup="updateVars()" value="{$system}">
							<span class="ml-1 mr-1">:</span>
							<input class="form-control form-control-sm" type="text" id="planet" name="planet" size="3" maxlength="2" onkeyup="updateVars()" value="{$planet}">
							<select class="form-control form-control-sm" id="type" name="type" onchange="updateVars()">
								{html_options options=$typeSelect selected=$type}
							</select>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-12 col-md-3 align-self-center">
						{$LNG.fl_fleet_speed}
					</div>
					<div class="controls mt-1 col-12 col-md-9">
						<div class="input-group">
							<select class="form-control form-control-sm" id="speed" name="speed" onChange="updateVars()">
								{html_options options=$speedSelect}
							</select>
							<div class="input-group-append">
								<span class="input-group-text">
									<i class="fa fa-percent"></i>
								</span>
							</div>
						</div>
					</div>
				</div>
				<div class="row mt-1">
					<div class="col-12 col-md-3">
						{$LNG.fl_distance}
					</div>
					<div class="col-12 col-md-9">
						<span id="distance">-</span>
					</div>
				</div>
				<div class="row mt-1">
					<div class="col-12 col-md-3">
						{$LNG.fl_flying_time}
					</div>
					<div class="col-12 col-md-9">
						<span id="duration">-</span>
					</div>
				</div>
				<div class="row mt-1">
					<div class="col-12 col-md-3">
						{$LNG.fl_flying_arrival}
					</div>
					<div class="col-12 col-md-9">
						<span id="arrival">-</span>
					</div>
				</div>
				<div class="row mt-1">
					<div class="col-12 col-md-3">
						{$LNG.fl_flying_return}
					</div>
					<div class="col-12 col-md-9">
						<span id="return">-</span>
					</div>
				</div>
				<div class="row mt-1">
					<div class="col-12 col-md-3">
						{$LNG.fl_fuel_consumption}
					</div>
					<div class="col-12 col-md-9">
						<span id="consumption">-</span>
					</div>
				</div>
				<div class="row mt-1">
					<div class="col-12 col-md-3">
						{$LNG.fl_max_speed}
					</div>
					<div class="col-12 col-md-9">
						<span id="maxspeed">-</span>
					</div>
				</div>
				<div class="row mt-1">
					<div class="col-12 col-md-3">
						{$LNG.fl_cargo_capacity}
					</div>
					<div class="col-12 col-md-9">
						<span id="storage">-</span>
					</div>
				</div>
		</div>
	</div>

	{if isModuleAvailable($smarty.const.MODULE_SHORTCUTS)}
		<div class="card">
			<div class="card-header">
				{$LNG.fl_shortcut} 
				(
					<a href="#" onclick="EditShortcuts();" class="shortcut-link-edit">{$LNG.fl_shortcut_edition}</a>
					<a href="#" onclick="SaveShortcuts();" class="shortcut-link-save d-none">{$LNG.fl_shortcut_save}&nbsp;</a>
					<a href="#" onclick="AddShortcuts();" class="shortcut-link-save d-none">&nbsp;{$LNG.fl_shortcut_add}</a>
				)
				<div class="card-actions">
					<a href="#" class="btn-minimize" data-toggle="collapse" data-target="#fleet-shortcut" aria-expanded="true"><i class="fa fa-chevron-up"></i></a>
				</div>
			</div>
			<div class="card-body" id="fleet-shortcut">
				<span id="shortcut-max" data-shortcut="{$shortcutList|@count}"></span>
				<div id="shortcut-edit-new" class="col-12 col-md-6 d-none">
					<div class="row mb-1">
						<div class="col">
							<div class="input-group">
								<input type="text" id="shortcut-name" class="form-control form-control-sm" value="">
								<span class="input-group-append">
									<button type="button" class="btn btn-danger shortcut-delete" data-shortcut-no=""><i class="fa fa-times"></i></button>
								</span>
							</div>
						</div>
					</div>
					<div class="row mb-3">
						<div class="col">
							<div class="input-group">
								<input type="text" id="shortcut-galaxy" class="form-control form-control-sm" value="" size="3" maxlength="2">
								<span class="ml-1 mr-1">:</span>
								<input type="text" id="shortcut-system" class="form-control form-control-sm" value="" size="3" maxlength="2">
								<span class="ml-1 mr-1">:</span>
								<input type="text" id="shortcut-planet" class="form-control form-control-sm" value="" size="3" maxlength="2">
								<select id="shortcut-type" class="form-control form-control-sm">
									{html_options options=$typeSelect}
								</select>
							</div>
						</div>
					</div>
				</div>
				<div class="row shortcut-edit d-none">
					{foreach from=$shortcutList key=shortcutID item=shortcutRow name=List}
						<div id="shortcut-edit-{$shortcutID}" class="col-12 col-md-6">
							<div class="row mb-1">
								<div class="col">
									<div class="input-group">
										<input type="text" id="shortcut-name" class="form-control form-control-sm" value="{$shortcutRow.name}">
										<span class="input-group-append">
											<button type="button" class="btn btn-danger shortcut-delete" data-shortcut-no="{$shortcutID}"><i class="fa fa-times"></i></button>
										</span>
									</div>
								</div>
							</div>
							<div class="row mb-3">
								<div class="col">
									<div class="input-group">
										<input type="text" id="shortcut-galaxy" class="form-control form-control-sm" value="{$shortcutRow.galaxy}" size="3" maxlength="2">
										<span class="ml-1 mr-1">:</span>
										<input type="text" id="shortcut-system" class="form-control form-control-sm" value="{$shortcutRow.system}" size="3" maxlength="2">
										<span class="ml-1 mr-1">:</span>
										<input type="text" id="shortcut-planet" class="form-control form-control-sm" value="{$shortcutRow.planet}" size="3" maxlength="2">
										<select id="shortcut-type" class="form-control form-control-sm" data-scid="{$shortcutID}">
											{html_options selected=$shortcutRow.type options=$typeSelect}
										</select>
									</div>
								</div>
							</div>
						</div>
					{/foreach}
				</div>
				<div class="row justify-content-md-around shortcut-view">
					{foreach $shortcutList as $shortcutID => $shortcutRow}
						<div class="col-auto">
							<a href="javascript:setTarget({$shortcutRow.galaxy},{$shortcutRow.system},{$shortcutRow.planet},{$shortcutRow.type});updateVars();">
								{$shortcutRow.name}
								{if $shortcutRow.type == 1}
									{$LNG.fl_planet_shortcut}
								{elseif $shortcutRow.type == 2}
									{$LNG.fl_debris_shortcut}
								{elseif $shortcutRow.type == 3}
									{$LNG.fl_moon_shortcut}
								{/if}
								[{$shortcutRow.galaxy}:{$shortcutRow.system}:{$shortcutRow.planet}]
							</a>
						</div>
					{foreachelse}
						<div class="col-12 text-center">
							{$LNG.fl_no_shortcuts}
						</div>
					{/foreach}
				</div>
			</div>
		</div>
	{/if}
	
	<div class="card">
		<div class="card-header">
			{$LNG.fl_my_planets}
		</div>
		<div class="card-body">
			<div class="row justify-content-md-around">
			{foreach $colonyList as $ColonyRow}
				<div class="col-auto">
					<a href="javascript:setTarget({$ColonyRow.galaxy},{$ColonyRow.system},{$ColonyRow.planet},{$ColonyRow.type});updateVars();">
						{$ColonyRow.name}{if $ColonyRow.type == 3}{$LNG.fl_moon_shortcut}{/if} [{$ColonyRow.galaxy}:{$ColonyRow.system}:{$ColonyRow.planet}]
					</a>
				</div>
				{foreachelse}
					<div class="col-auto">{$LNG.fl_no_colony}</div>
			{/foreach}
			</div>
		</div>
	</div>
	
	{if $ACSList}
		<div class="card">
			<div class="card-header">
				{$LNG.fl_acs_title}
			</div>
			<div class="card-body">
				<div class="row justify-content-md-around">
					{foreach $ACSList as $ACSRow}
						<div class="col-auto">
							<a href="javascript:setACSTarget({$ACSRow.galaxy},{$ACSRow.system},{$ACSRow.planet},{$ACSRow.planet_type},{$ACSRow.id});">{$ACSRow.name} - [{$ACSRow.galaxy}:{$ACSRow.system}:{$ACSRow.planet}]</a>
						</div>
					{/foreach}
				</div>
			</div>
		</div>
	{/if}
	
	<div class="row mb-4">
		<div class="col-12">
			<button type="submit" class="btn btn-success btn-lg btn-block">{$LNG.fl_continue}</button>
		</div>
	</div>
			</form>
<script type="text/javascript">
data			= {$fleetdata|json};
shortCutRows	= {$themeSettings.SHORTCUT_ROWS_ON_FLEET1};
fl_no_shortcuts	= '{$LNG.fl_no_shortcuts}';
</script>
{/block}