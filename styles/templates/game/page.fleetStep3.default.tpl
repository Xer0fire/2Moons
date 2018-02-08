{block name="title" prepend}{$LNG.lm_fleet}{/block}
{block name="content"}
	<div class="card">
		<div class="card-header">
			{$LNG.fl_fleet_sended}
		</div>
		<div class="card-body">
			<div class="row">
				<div class="col-6">
					{$LNG.fl_mission}
				</div>
				<div class="col-6">
					{$LNG["type_mission_{$targetMission}"]}
				</div>
			</div>
			<div class="row">
				<div class="col-6">
					{$LNG.fl_distance}
				</div>
				<div class="col-6">
					{$distance|number}
				</div>
			</div>
			<div class="row">
				<div class="col-6">
					{$LNG.fl_fleet_speed}
				</div>
				<div class="col-6">
					{$MaxFleetSpeed|number}
				</div>
			</div>
			<div class="row">
				<div class="col-6">
					{$LNG.fl_fuel_consumption}
				</div>
				<div class="col-6">
					{$consumption|number}
				</div>
			</div>
			<div class="row">
				<div class="col-6">
					{$LNG.fl_from}
				</div>
				<div class="col-6">
					{$from}
				</div>
			</div>
			<div class="row">
				<div class="col-6">
					{$LNG.fl_destiny}
				</div>
				<div class="col-6">
					{$destination}
				</div>
			</div>
			<div class="row">
				<div class="col-6">
					{$LNG.fl_arrival_time}
				</div>
				<div class="col-6">
					{$fleetStartTime}
				</div>
			</div>
			<div class="row">
				<div class="col-6">
					{$LNG.fl_return_time}
				</div>
				<div class="col-6">
					{$fleetEndTime}
				</div>
			</div>
			<div class="row">
				<div class="col-12">
					{$LNG.fl_fleet}
				</div>
			</div>
			{foreach $FleetList as $ShipID => $ShipCount}
			<div class="row">
				<div class="col-6">
					{$LNG.tech.{$ShipID}}
				</div>
				<div class="col-6">
					{$ShipCount|number}
				</div>
			</div>
			{/foreach}
		</div>
	</div>
{/block}