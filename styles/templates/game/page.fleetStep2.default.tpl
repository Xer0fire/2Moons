{block name="title" prepend}{$LNG.lm_fleet}{/block}
{block name="content"}
	<div class="card">
		<div class="card-header">
			{$galaxy}:{$system}:{$planet} - {$LNG["type_planet_{$type}"]}
		</div>
		<div class="card-body">
			<form action="game.php?page=fleetStep3" method="post">
				<input type="hidden" name="token" value="{$token}">
				<div class="row">
					<div class="col-12 col-md-4">
						<div class="row">
							<div class="col-12">
								{$LNG.fl_mission}
							</div>
						</div>
						<div class="row">
							<div class="col-12 form-group">
							{foreach $MissionSelector as $MissionID}
								<div class="form-check p-0">
									<input id="radio_{$MissionID}" type="radio" name="mission" value="{$MissionID}" {if $mission == $MissionID}checked="checked"{/if}>
									<label for="radio_{$MissionID}">{$LNG["type_mission_{$MissionID}"]}</label>
									{if $MissionID == 15}<span>{$LNG.fl_expedition_alert_message}</span>{/if}
									{if $MissionID == 11}<span>{$fl_dm_alert_message}</span>{/if}
								</div>
							{/foreach}
							</div>
						</div>
					</div>
					<div class="col-12 col-md-8">
						<div class="row">
							<div class="col-12">
								{$LNG.fl_resources}
							</div>
						</div>
						<div class="row">
							<div class="col-12 form-group">
								<div class="input-group">
									<div class="input-group-prepend">
										<span class="input-group-text"><img src="{$dpath}images/{$LNG.tech.901}.gif"></span>
									</div>
									<div class="input-group-prepend">
										<button class="btn btn-warning" type="button">zero</button>
									</div>
									<input name="metal" type="text" class="form-control" value="0" onchange="calculateTransportCapacity();">
									<div class="input-group-append">
										<button class="btn btn-warning" type="button" onclick="javascript:maxResource('metal')">{$LNG.fl_max}</button>
									</div>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-12 form-group">
								<div class="input-group">
									<div class="input-group-prepend">
										<span class="input-group-text"><img src="{$dpath}images/{$LNG.tech.902}.gif"></span>
									</div>
									<div class="input-group-prepend">
										<button class="btn btn-warning" type="button">zero</button>
									</div>
									<input name="crystal" type="text" class="form-control" value="0" onchange="calculateTransportCapacity();">
									<div class="input-group-append">
										<button class="btn btn-warning" type="button" onclick="javascript:maxResource('crystal')">{$LNG.fl_max}</button>
									</div>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-12 form-group">
								<div class="input-group">
									<div class="input-group-prepend">
										<span class="input-group-text"><img src="{$dpath}images/{$LNG.tech.903}.gif"></span>
									</div>
									<div class="input-group-prepend">
										<button class="btn btn-warning" type="button">zero</button>
									</div>
									<input name="deuterium" type="text" class="form-control" value="0" onchange="calculateTransportCapacity();">
									<div class="input-group-append">
										<button class="btn btn-warning" type="button" onclick="javascript:maxResource('deuterium')">{$LNG.fl_max}</button>
									</div>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-12">
								{$LNG.fl_resources_left}: <span id="remainingresources">-</span>
							</div>
						</div>
						<div class="row">
							<div class="col-12">
								<button class="btn btn-block btn-success" type="button" onclick="javascript:maxResources()">{$LNG.fl_all_resources}</button>
							</div>
						</div>
						<div class="row">
							<div class="col-12">
								{$LNG.fl_fuel_consumption}: <span id="consumption" class="consumption">{$consumption}</span>
							</div>
						</div>
						{if $StaySelector}
							<div class="row">
								<div class="col-12 form-group">
									<div class="input-group">
										<label class="col-form-label">{$LNG.fl_hold_time}</label>
										<div class="input-group-append">
											{html_options class="form-control" name=staytime options=$StaySelector} {$LNG.fl_hours}
										</div>
									</div>
								</div>
							</div>
						{/if}
					</div>
				</div>
				<div class="row">
					<div class="col-12">
						<button class="btn btn-block btn-success mt-2" type="submit">{$LNG.fl_continue}</button>
					</div>
				</div>
			</form>
		</div>
	</div>
<script type="text/javascript">
data	= {$fleetdata|json};
</script>
{/block}
