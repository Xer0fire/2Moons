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
							<input class="form-control form-control-sm" type="text" id="system" name="system" size="3" maxlength="3" onkeyup="updateVars()" value="{$system}">
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
	<table class="table519 shortcut" style="table-layout: fixed;">
		<tr style="height:20px;">
			<th colspan="{$themeSettings.SHORTCUT_ROWS_ON_FLEET1}">{$LNG.fl_shortcut} (<a href="#" onclick="EditShortcuts();return false" class="shortcut-link-edit shortcut-link">{$LNG.fl_shortcut_edition}</a><a href="#" onclick="SaveShortcuts();return false" class="shortcut-edit">{$LNG.fl_shortcut_save}</a>)</th>
		</tr>
		{foreach $shortcutList as $shortcutID => $shortcutRow}
			{if ($shortcutRow@iteration % $themeSettings.SHORTCUT_ROWS_ON_FLEET1) === 1}<tr style="height:20px;" class="shortcut-row">{/if}			
			<td style="width:{100 / $themeSettings.SHORTCUT_ROWS_ON_FLEET1}%" class="shortcut-colum shortcut-isset">
				<div class="shortcut-link">
					<a href="javascript:setTarget({$shortcutRow.galaxy},{$shortcutRow.system},{$shortcutRow.planet},{$shortcutRow.type});updateVars();">{$shortcutRow.name}{if $shortcutRow.type == 1}{$LNG.fl_planet_shortcut}{elseif $shortcutRow.type == 2}{$LNG.fl_debris_shortcut}{elseif $shortcutRow.type == 3}{$LNG.fl_moon_shortcut}{/if} [{$shortcutRow.galaxy}:{$shortcutRow.system}:{$shortcutRow.planet}]</a>
				</div>
				<div class="shortcut-edit">
					<input type="text" class="shortcut-input" name="shortcut[{$shortcutID}][name]" value="{$shortcutRow.name}">
					<div class="shortcut-delete" title="{$LNG.fl_dlte_shortcut}"></div>
				</div>
				<div class="shortcut-edit">
					<input type="text" class="shortcut-input" name="shortcut[{$shortcutID}][galaxy]" value="{$shortcutRow.galaxy}" size="3" maxlength="2">:<input type="text" class="shortcut-input" name="shortcut[{$shortcutID}][system]" value="{$shortcutRow.system}" size="3" maxlength="3">:<input type="text" class="shortcut-input" name="shortcut[{$shortcutID}][planet]" value="{$shortcutRow.planet}" size="3" maxlength="2">
					<select class="shortcut-input" name="shortcut[{$shortcutID}][type]">
						{html_options selected=$shortcutRow.type options=$typeSelect}
					</select>
				</div>
			</td>
			{if $shortcutRow@last && ($shortcutRow@iteration % $themeSettings.SHORTCUT_ROWS_ON_FLEET1) !== 0}
			{$to = $themeSettings.SHORTCUT_ROWS_ON_FLEET1 - ($shortcutRow@iteration % $themeSettings.SHORTCUT_ROWS_ON_FLEET1)}
			{for $foo=1 to $to}
			<td class="shortcut-colum" style="width:{100 / $themeSettings.SHORTCUT_ROWS_ON_FLEET1}%">&nbsp;</td>
			{/for}
			{/if}
			{if ($shortcutRow@iteration % $themeSettings.SHORTCUT_ROWS_ON_FLEET1) === 0}</tr>{/if}
		{foreachelse}
		<tr style="height:20px;" class="shortcut-none">
			<td colspan="{$themeSettings.SHORTCUT_ROWS_ON_FLEET1}">{$LNG.fl_no_shortcuts}</td>
		</tr>
		{/foreach}
		<tr style="height:20px;" class="shortcut-edit shortcut-new">
			<td>
				<div class="shortcut-link">
					
				</div>
				<div class="shortcut-edit">
					<input type="text" class="shortcut-input" name="shortcut[][name]" placeholder="{$LNG.fl_shortcut_name}">
					<div class="shortcut-delete" title="{$LNG.fl_dlte_shortcut}"></div>
				</div>
				<div class="shortcut-edit">
					<input type="text" class="shortcut-input" name="shortcut[][galaxy]" value="" size="3" maxlength="2" placeholder="G" pattern="[0-9]*">:<input type="text" class="shortcut-input" name="shortcut[][system]" value="" size="3" maxlength="3" placeholder="S" pattern="[0-9]*">:<input type="text" class="shortcut-input" name="shortcut[][planet]" value="" size="3" maxlength="2" placeholder="P" pattern="[0-9]*">
					<select class="shortcut-input" name="shortcut[][type]">
						{html_options options=$typeSelect}
					</select>
				</div>
			</td>
		</tr>
		<tr style="height:20px;" class="shortcut-edit">
			<td colspan="{$themeSettings.SHORTCUT_ROWS_ON_FLEET1}">
				<a href="#" onclick="AddShortcuts();return false">{$LNG.fl_shortcut_add}</a>
			</td>
		</tr>		
	</table>
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
	<table class="table519" style="table-layout: fixed;">
		<tr style="height:20px;">
			<th colspan="{$themeSettings.COLONY_ROWS_ON_FLEET1}">{$LNG.fl_acs_title}</th>
		</tr>
		{foreach $ACSList as $ACSRow}
		{if ($ACSRow@iteration % $themeSettings.ACS_ROWS_ON_FLEET1) === 1}<tr style="height:20px;">{/if}
		<tr style="height:20px;">
			<td><a href="javascript:setACSTarget({$ACSRow.galaxy},{$ACSRow.system},{$ACSRow.planet},{$ACSRow.planet_type},{$ACSRow.id});">{$ACSRow.name} - [{$ACSRow.galaxy}:{$ACSRow.system}:{$ACSRow.planet}]</a></td>
		</tr>
		{if $ACSRow@last && ($ACSRow@iteration % $themeSettings.ACS_ROWS_ON_FLEET1) !== 0}
		{$to = $themeSettings.ACS_ROWS_ON_FLEET1 - ($ACSRow@iteration % $themeSettings.ACS_ROWS_ON_FLEET1)}
		{for $foo=1 to $to}<td>&nbsp;</td>{/for}
		{/if}
		{if ($ACSRow@iteration % $themeSettings.ACS_ROWS_ON_FLEET1) === 0}</tr>{/if}
		{/foreach}
	</table>
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