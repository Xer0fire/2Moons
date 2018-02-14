<div class="row">
	<div class="col">
		{$LNG.longDescription.$elementID}
	</div>
</div>
{if !empty($FleetInfo)}
	{if !empty($FleetInfo.rapidfire.to)}
		<div class="row mt-2">
			<div class="col">
				{foreach from=$FleetInfo.rapidfire.from key=rapidfireID item=shoots name=RFfrom}
					{$LNG.in_rf_again} {$LNG.tech.$rapidfireID}: <span style="color:#00ff00">{$shoots|number}</span>
					{if !$smarty.foreach.RFfrom.last}
						<br/>
					{/if}
				{/foreach}
			</div>
		</div>
	{/if}
	{if !empty($FleetInfo.rapidfire.from)}
		<div class="row mt-2">
			<div class="col">
				{foreach from=$FleetInfo.rapidfire.from key=rapidfireID item=shoots name=RFto}
					{$LNG.in_rf_from} {$LNG.tech.$rapidfireID}: <span style="color:#ff0000">{$shoots|number}</span>
					{if !$smarty.foreach.RFto.last}
						<br/>
					{/if}
				{/foreach}
			</div>
		</div>
	{/if}
{/if}

{if !empty($productionTable.production)}
<hr/>
{include file="shared.information.production.tpl"}
{/if}
{if !empty($productionTable.storage)}
<hr/>
{include file="shared.information.storage.tpl"}
{/if}
{if !empty($FleetInfo)}
<hr/>
{include file="shared.information.shipInfo.tpl"}
{/if}
{if !empty($gateData)}
<hr/>
{include file="shared.information.gate.tpl"}
{/if}
{if !empty($MissileList)}
<hr/>
{include file="shared.information.missiles.tpl"}
{/if}
{if !empty($productionTable.protected)}
<hr/>
{include file="shared.information.protected.tpl"}
{/if}