{block name="title" prepend}{$LNG.lm_buildings}{/block}
{block name="content"}
{if !empty($Queue)}
<div class="row">
<div class="col-md-12">
<div class="card border-0">
<div class="card-header">
Queue
<div class="card-actions">
<a href="#" class="btn-minimize" data-toggle="collapse" data-target="#events" aria-expanded="true"><i class="fa fa-chevron-up"></i></a>
</div>
</div>
<div class="card-body collapse show" id="events">
<div id="buildlist" class="buildlist">
	{foreach $Queue as $List}
		{$ID = $List.element}
		<div class="row">
			<div class="col-8">
				{if !($isBusy.research && ($ID == 6 || $ID == 31)) && !($isBusy.shipyard && ($ID == 15 || $ID == 21)) && $RoomIsOk && $CanBuildElement && $BuildInfoList[$ID].buyable}
					<form class="build_form" action="game.php?page=buildings" method="post">
						<input type="hidden" name="cmd" value="insert">
						<input type="hidden" name="building" value="{$ID}">
						<button type="submit" class="build_submit onlist">{$List@iteration}. {$LNG.tech.{$ID}} {$List.level}{if $List.destroy} {$LNG.bd_dismantle}{/if}</button>
					</form>
				{else}
					{$LNG.tech.{$ID}} {$List.level} {if $List.destroy}{$LNG.bd_dismantle}{/if}
				{/if}
				{if $List@first}
				<div id="progressbar" data-time="{$List.resttime}"></div>
			</div>
			<div class="col-4">
				<div id="time" data-time="{$List.time}"><br></div>
				<form action="game.php?page=buildings" method="post" class="build_form">
					<input type="hidden" name="cmd" value="cancel">
					<button type="submit" class="build_submit onlist">{$LNG.bd_cancel}</button>
				</form>
				
				<span style="color:lime" data-time="{$List.endtime}" class="timer">{$List.display}</span>
			</div>
		</div>
		{else}
			</div>
			<div class="col-4">
				<form action="game.php?page=buildings" method="post" class="build_form">
					<input type="hidden" name="cmd" value="remove">
					<input type="hidden" name="listid" value="{$List@iteration}">
					<button type="submit" class="build_submit onlist">{$LNG.bd_cancel}</button>
				</form>
				
				<span style="color:lime" data-time="{$List.endtime}" class="timer">{$List.display}</span>
			</div>
		</div>
		{/if}
	{/foreach}
		</div>
	</div>
  </div>
</div>
</div>
{/if}
{foreach $BuildInfoList as $ID => $Element}
<div class="row">
	<div class="col-md-12">
		<a href="#" onclick="return Dialog.info({$ID})">{$LNG.tech.{$ID}}</a>{if $Element.level > 0} ({$LNG.bd_lvl} {$Element.level}{if $Element.maxLevel != 255}/{$Element.maxLevel}{/if}){/if}
	</div>
</div>
<div class="row">
	<div class="col-md-10">
		<div class="media">
			<a href="#">
				<img class="mr-2" src="{$dpath}gebaeude/{$ID}.gif" alt="{$LNG.tech.{$ID}}" width="120" height="120">
			</a>
			<div class="media-body align-self-center">
				<span class="d-none d-md-block">{$LNG.shortDescription.{$ID}}</br></span>
				{foreach $Element.costResources as $RessID => $RessAmount}
					{$LNG.tech.{$RessID}}: <b><span style="color:{if $Element.costOverflow[$RessID] == 0}lime{else}red{/if}">{$RessAmount|number}</span></b>
				{/foreach}</br>
				{if $CanBuildElement && $Element.buyable}{else}{$LNG.bd_remaining}<br>{/if}
				{foreach $Element.costOverflow as $ResType => $ResCount}
					{if $ResCount|number != 0}{$LNG.tech.{$ResType}}: <span style="font-weight:700">{$ResCount|number}</span><br>{/if}
				{/foreach}
			</div>
		</div>
	</div>
	<div class="col-md-2 align-self-center">
		{if $Element.maxLevel == $Element.levelToBuild}
			<span style="color:red">{$LNG.bd_maxlevel}</span>
		{elseif ($isBusy.research && ($ID == 6 || $ID == 31)) || ($isBusy.shipyard && ($ID == 15 || $ID == 21))}
			<span style="color:red">{$LNG.bd_working}</span>
		{else}
			{if $RoomIsOk}
				{if $CanBuildElement && $Element.buyable}
				<form action="game.php?page=buildings" method="post" class="build_form">
					<input type="hidden" name="cmd" value="insert">
					<input type="hidden" name="building" value="{$ID}">
					<button type="submit" class="build_submit">{if $Element.level == 0}{$LNG.bd_build}{else}{$LNG.bd_build_next_level}{$Element.levelToBuild + 1}{/if}</button>
				</form>
				{else}
				<span style="color:red">{if $Element.level == 0}{$LNG.bd_build}{else}{$LNG.bd_build_next_level}{$Element.levelToBuild + 1}{/if}</span>
				{/if}
			{else}
			<span style="color:red">{$LNG.bd_no_more_fields}</span>
			{/if}
		{/if}
	</div>
</div>
<div class="row">
	<div class="col-md-9">
	{if !empty($Element.infoEnergy)}
		{$LNG.bd_next_level} {$Element.infoEnergy}<br>
	{/if}
	</div>
	<div class="col-md-3">
		<span class="float-none float-md-right">{$LNG.fgf_time} {$Element.elementTime|time}</span>
	</div>
</div>
<div class="row">
	<div class="col-auto">
	{if $Element.level > 0}
		{if $ID == 43}<a href="#" onclick="return Dialog.info({$ID})">{$LNG.bd_jump_gate_action}</a>{/if}
		{if ($ID == 44 && !$HaveMissiles) ||  $ID != 44}<br><a class="tooltip_sticky" data-tooltip-content="
			{* Start Destruction Popup *}
			<table style='width:300px'>
				<tr>
					<th colspan='2'>{$LNG.bd_price_for_destroy} {$LNG.tech.{$ID}} {$Element.level}</th>
				</tr>
				{foreach $Element.destroyResources as $ResType => $ResCount}
				<tr>
					<td>{$LNG.tech.{$ResType}}</td>
					<td><span style='color:{if empty($Element.destroyOverflow[$RessID])}lime{else}red{/if}'>{$ResCount|number}</span></td>
				</tr>
				{/foreach}
				<tr>
					<td>{$LNG.bd_destroy_time}</td>
					<td>{$Element.destroyTime|time}</td>
				</tr>
				<tr>
					<td colspan='2'>
						<form action='game.php?page=buildings' method='post' class='build_form'>
							<input type='hidden' name='cmd' value='destroy'>
							<input type='hidden' name='building' value='{$ID}'>
							<button type='submit' class='build_submit onlist'>{$LNG.bd_dismantle}</button>
						</form>
					</td>
				</tr>
			</table>
			{* End Destruction Popup *}
			">{$LNG.bd_dismantle}</a>{/if}
		{else}
			&nbsp;
		{/if}
	</div>
</div>
{/foreach}
{/block}