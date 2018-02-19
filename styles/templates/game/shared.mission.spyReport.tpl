<div class="spyReportContainer">
	<div class="row spyReportHead">
		<div class="col">
			<a href="game.php?page=galaxy&amp;galaxy={$targetPlanet.galaxy}&amp;system={$targetPlanet.system}">{$title}</a>
			<br/>
			{if $targetChance >= $spyChance}{$LNG.sys_mess_spy_destroyed}{else}{sprintf($LNG.sys_mess_spy_lostproba, $targetChance)}{/if}
		</div>
	</div>
	{foreach from=$spyData key=Class item=elementIDs name=List}
		<div class="spyReport{if !$smarty.foreach.List.first} mt-2{/if}">
			<div class="row class-{$Class}">
				<div class="col">
					<p class="spyReportCat">{$LNG.tech.$Class}</p>
				</div>
			</div>
			<div class="row spyReportDetail">
			{foreach from=$elementIDs key=elementID item=amount name=List2}
				<div class="col-6">{$LNG.tech.$elementID} <br/> {$amount|number}</div>
			{/foreach}
			</div>
		</div>
	{/foreach}
	<div class="spyRaportFooter">
		<a class="mt-3 btn btn-block btn-danger" href="game.php?page=fleetTable&amp;galaxy={$targetPlanet.galaxy}&amp;system={$targetPlanet.system}&amp;planet={$targetPlanet.planet}&amp;planettype={$targetPlanet.planet_type}&amp;target_mission=1">{$LNG.type_mission_1}</a>
		{if $isBattleSim}<br><a href="game.php?page=battleSimulator{foreach $spyData as $Class => $elementIDs}{foreach $elementIDs as $elementID => $amount}&amp;im[{$elementID}]={$amount}{/foreach}{/foreach}">{$LNG.fl_simulate}</a>{/if}
	</div>
</div>