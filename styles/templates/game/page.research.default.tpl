{block name="title" prepend}{$LNG.lm_research}{/block}
{block name="content"}
{if !empty($Queue)}
<div class="row">
<div class="col-md-12">
<div class="card border-0">
<div class="card-header">
Queue
<div class="card-actions">
<a href="#" class="btn-minimize" data-toggle="collapse" data-target="#researchqueue" aria-expanded="true"><i class="fa fa-chevron-up"></i></a>
</div>
</div>
<div class="card-body collapse show" id="researchqueue">
<div id="buildlist" class="buildlist">
	{foreach $Queue as $List}
		{$ID = $List.element}
		<div class="row">
		<div class="col-8">
			{if isset($ResearchList[$List.element])}
				{$CQueue = $ResearchList[$List.element]}
			{/if}
			{if isset($CQueue) && $CQueue.maxLevel != $CQueue.level && !$IsFullQueue && $CQueue.buyable}
				<form action="game.php?page=research" method="post" class="build_form">
					<input type="hidden" name="cmd" value="insert">
					<input type="hidden" name="tech" value="{$ID}">
					<button type="submit" class="build_submit onlist">{$List@iteration}. {$LNG.tech.{$ID}} {$List.level}{if !empty($List.planet)} @ {$List.planet}{/if}</button>
				</form>
			{else}
				{$List@iteration}. {$LNG.tech.{$ID}} {$List.level}{if !empty($List.planet)} @ {$List.planet}{/if}
			{/if}
			{if $List@first}
			<div id="progressbar" data-time="{$List.resttime}"></div>
		</div>
		<div class="col-4">
			<div id="time" data-time="{$List.time}"><br></div>
			<form action="game.php?page=research" method="post" class="build_form">
				<input type="hidden" name="cmd" value="cancel">
				<button type="submit" class="build_submit onlist">{$LNG.bd_cancel}</button>
			</form>

			<span style="color:lime" data-time="{$List.endtime}" class="timer">{$List.display}</span>
			</div>
		</div>
			{else}
			</div>
			<div class="col-4">
			<form action="game.php?page=research" method="post" class="build_form">
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
{if $IsLabinBuild}
<div class="row">
	<div class="col-md-12">
		{$LNG.bd_building_lab}
	</div>
</div>
{/if}
{foreach $ResearchList as $ID => $Element}
<div class="row">
	<div class="col-md-12">
		<a href="#" onclick="return Dialog.info({$ID})">{$LNG.tech.{$ID}}</a>{if $Element.level != 0} ({$LNG.bd_lvl} {$Element.level}{if $Element.maxLevel != 255}/{$Element.maxLevel}{/if}){/if}
	</div>
</div>
<div class="row">
	<div class="col-md-10">
		<div class="media">
			<a href="#">
				<img class="mr-2" src="{$dpath}gebaeude/{$ID}.gif" alt="" class="top" width="120" height="120">
			</a>
			<div class="media-body align-self-center">
				<span class="d-none d-md-block">{$LNG.shortDescription.{$ID}}</br></span>
				{foreach $Element.costResources as $RessID => $RessAmount}
						{$LNG.tech.{$RessID}}: <b><span style="color:{if $Element.costOverflow[$RessID] == 0}lime{else}red{/if}">{$RessAmount|number}</span></b>
				{/foreach}</br>
				{if $IsLabinBuild || $IsFullQueue || $Element.buyable}{else}{$LNG.bd_remaining}<br>{/if}
				{foreach $Element.costOverflow as $ResType => $ResCount}
					{if $ResCount|number != 0}{$LNG.tech.{$ResType}}: <span style="font-weight:700">{$ResCount|number}</span>{/if}
				{/foreach}
			</div>
		</div>
	</div>
	<div class="col-md-2 align-self-center">
		{if $Element.maxLevel == $Element.levelToBuild}
			<span style="color:red">{$LNG.bd_maxlevel}</span>
		{elseif $IsLabinBuild || $IsFullQueue || !$Element.buyable}
			<span style="color:red">{if $Element.level == 0}{$LNG.bd_tech}{else}{$LNG.bd_tech_next_level}{$Element.levelToBuild + 1}{/if}</span>
		{else}
			<form action="game.php?page=research" method="post" class="build_form">
				<input type="hidden" name="cmd" value="insert">
				<input type="hidden" name="tech" value="{$ID}">
				<button type="submit" class="build_submit">{if $Element.level == 0}{$LNG.bd_tech}{else}{$LNG.bd_tech_next_level}{$Element.levelToBuild + 1}{/if}</button>
			</form>
		{/if}
	</div>
</div>
<div class="row">
	<div class="col-md-12">
		<span class="float-none float-md-right">{$LNG.fgf_time} {$Element.elementTime|time}</span>
	</div>
</div>
{/foreach}
{/block}
{block name="script" append}
    {if !empty($Queue)}
        <script src="scripts/game/research.js"></script>
    {/if}
{/block}