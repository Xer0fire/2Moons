<div class="row">
	<div class="col">
		{$LNG.longDescription.$elementID}
	</div>
</div>
<div class="row">
	<div class="col">
		{if !empty($FleetInfo)}
			{if !empty($FleetInfo.rapidfire.to)}
				<p>
				{foreach $FleetInfo.rapidfire.to as $rapidfireID => $shoots}
					{$LNG.in_rf_again} {$LNG.tech.$rapidfireID}: <span style="color:#00ff00">{$shoots|number}</span><br>
				{/foreach}
				</p>
			{/if}
			{if !empty($FleetInfo.rapidfire.from)}
				<p>
				{foreach $FleetInfo.rapidfire.from as $rapidfireID => $shoots}
					{$LNG.in_rf_from} {$LNG.tech.$rapidfireID}: <span style="color:#ff0000">{$shoots|number}</span><br>
				{/foreach}
				</p>
			{/if}
		{/if}
	</div>
</div>

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