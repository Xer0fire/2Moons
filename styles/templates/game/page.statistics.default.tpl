{block name="title" prepend}{$LNG.lm_statistics}{/block}
{block name="content"}
<form name="stats" id="stats" method="post" action="">
	<div class="card">
		<div class="card-header">
			{$LNG.st_statistics} ({$LNG.st_updated}: {$stat_date})
		</div>
		<div class="card-body">
			<div class="form-group row">
				<label for="who" class="col-6 col-md-2 col-form-label">{$LNG.st_show}</label> 
				<div class="col-6 col-md-2">
					<select class="form-control" name="who" id="who" onchange="$('#stats').submit();">{html_options options=$Selectors.who selected=$who}</select>
				</div>
				<label for="type" class="col-6 mt-2 mt-md-0 col-md-2 col-form-label">{$LNG.st_per}</label> 
				<div class="col-6  mt-2 mt-md-0 col-md-2">
					<select class="form-control" name="type" id="type" onchange="$('#stats').submit();">{html_options options=$Selectors.type selected=$type}</select>
				</div>
				<label for="range" class="col-6 mt-2 mt-md-0 col-md-2 col-form-label">{$LNG.st_in_the_positions}</label> 
				<div class="col-6 mt-2 mt-md-0 col-md-2">
					<select class="form-control" name="range" id="range" onchange="$('#stats').submit();">{html_options options=$Selectors.range selected=$range}</select>
				</div>
			</div>
		</div>
	</div>
</form>
<table class="table519">
{if $who == 1}
	{include file="shared.statistics.playerTable.tpl"}
{elseif $who == 2}
	{include file="shared.statistics.allianceTable.tpl"}
{/if}
</table>
{/block}