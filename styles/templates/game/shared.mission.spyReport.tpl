<div class="spyReport">
	<div class="row">
		<div class="col">
			<a href="game.php?page=galaxy&amp;galaxy={$targetPlanet.galaxy}&amp;system={$targetPlanet.system}">{$title}</a>
			<br/>
			{if $targetChance >= $spyChance}{$LNG.sys_mess_spy_destroyed}{else}{sprintf($LNG.sys_mess_spy_lostproba, $targetChance)}{/if}
		</div>
	</div>
	{foreach from=$spyData key=Class item=elementIDs name=List}
		<div class="spyReportContainer{if !$smarty.foreach.List.first} mt-2{/if}">
			<div class="row class-{$Class}">
				<div class="spyReportHead col">
					{$LNG.tech.$Class}
				</div>
			</div>
			{foreach from=$elementIDs key=elementID item=amount name=List2}
				{if ($amount@iteration % 2) === 1}<div class="row{if !$smarty.foreach.List2.first} mt-1{/if}">{/if}
					<div class="col-6">{$LNG.tech.$elementID} - {$amount|number}</div>
				{if ($amount@iteration % 2) === 0}</div>{/if}
			{/foreach}
		</div>
	{/foreach}
	<div class="spyRaportFooter">
		<a class="mt-3 btn btn-block btn-danger" href="game.php?page=fleetTable&amp;galaxy={$targetPlanet.galaxy}&amp;system={$targetPlanet.system}&amp;planet={$targetPlanet.planet}&amp;planettype={$targetPlanet.planet_type}&amp;target_mission=1">{$LNG.type_mission_1}</a>
		{if $isBattleSim}<br><a href="game.php?page=battleSimulator{foreach $spyData as $Class => $elementIDs}{foreach $elementIDs as $elementID => $amount}&amp;im[{$elementID}]={$amount}{/foreach}{/foreach}">{$LNG.fl_simulate}</a>{/if}
	</div>
</div>