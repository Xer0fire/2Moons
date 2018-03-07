<div class="row">
	<div class="col align-self-center">
		<strong>{$LNG.in_jump_gate_select_ships}</strong>
	</div>
</div>
{if $gateData.restTime != 0}
	<div class="row">
		<div class="col align-self-center">
			{$LNG.in_jump_gate_wait_time} {$gateData.nextTime}&nbsp;(<span class="countdown" data-time="{$gateData.restTime}">{pretty_fly_time($gateData.restTime)}</span>)
		</div>
	</div>
{else}
	<div class="row">
		<div class="col align-self-center">
			{$LNG.in_jump_gate_start_moon}
		</div>
		<div class="col align-self-center">
			{$gateData.startLink}
		</div>
	</div>
	{if !empty($gateData.gateList)}
		<div class="row">
			<div class="col align-self-center">
				{$LNG.in_jump_gate_finish_moon}
			</div>
			<div class="col align-self-center">
				{html_options options=$gateData.gateList name="jmpto" class="jumpgate form-control-sm"}
			</div>
		</div>
		<div class="row">
			<div class="col align-self-center">
				<strong>{$LNG.fl_ship_type} / {$LNG.fl_ship_available}</strong>
			</div>
		</div>
		{foreach $gateData.fleetList as $fleetID => $amount}
			<div class="row">
				<div class="col-12 col-md-6 align-self-center">
					{$LNG.tech.$fleetID} (<span id="ship{$fleetID}_value">{$amount|number}</span>)
				</div>
				<div class="col-12 col-md-6 align-self-center">
					<div class="controls p-0 mt-1 col align-self-center-12">
						<div class="input-group">
							<span class="input-group-append">
								<button class="btn btn-warning" type="button" onclick="$('#ship{$fleetID}_input').val('0')">zero</button>
							</span>
							<input class="jumpgate form-control" name="ship[{$fleetID}]" id="ship{$fleetID}_input" size="7" value="0" type="text" tabindex="">
							<span class="input-group-append">
								<input class="btn btn-warning" onclick="Gate.max({$fleetID});" value="max" type="button">
							</span>
						</div>
					</div>
				</div>
			</div>
		{/foreach}
		<div class="row mt-4">
			<div class="col align-self-center">
				<input class="btn btn-block btn-success" value="{$LNG.in_jump_gate_jump}" type="button" onclick="Gate.submit();">
			</div>
		</div>
	{else}
		<div class="row">
			<div class="col align-self-center">
				<span class="text-red">{$LNG.in_jump_gate_no_target}</span>
			</div>
		</div>
	{/if}
{/if}