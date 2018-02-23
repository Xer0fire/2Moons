{block name="title" prepend}{$LNG.lm_playercard}{/block}
{block name="content"}
	<div class="row">
		<div class="col-4">
			<span class="font-weight-bold">{$LNG.pl_name}</span>
		</div>
		<div class="col-8">
			{$name}
		</div>
	</div>
	<div class="row">
		<div class="col-4">
			<span class="font-weight-bold">{$LNG.pl_ally}</span>
		</div>
		<div class="col-8">
			{if $allyname}
				<a href="game.php?page=alliance&amp;mode=info&amp;id={$allyid}">{$allyname}</a>
			{else}
				-
			{/if}
		</div>
	</div>
	<div class="row mt-3">
		<div class="col-4">
			<span class="font-weight-bold">{$LNG.pl_pointstats}</span>
		</div>
		<div class="col-4">
			<span class="font-weight-bold">{$LNG.pl_points}</span>
		</div>
		<div class="col-4">
			<span class="font-weight-bold">{$LNG.pl_range}</span>
		</div>
	</div>
	<div class="row">
		<div class="col-4">
			{$LNG.pl_builds}
		</div>
		<div class="col-4">
			{$build_points}
		</div>
		<div class="col-4">
			{$build_rank}
		</div>
	</div>
	<div class="row">
		<div class="col-4">
			{$LNG.pl_tech}
		</div>
		<div class="col-4">
			{$tech_points}
		</div>
		<div class="col-4">
			{$tech_rank}
		</div>
	</div>
	<div class="row">
		<div class="col-4">
			{$LNG.pl_fleet}
		</div>
		<div class="col-4">
			{$fleet_points}
		</div>
		<div class="col-4">
			{$fleet_rank}
		</div>
	</div>
	<div class="row">
		<div class="col-4">
			{$LNG.pl_def}
		</div>
		<div class="col-4">
			{$defs_points}
		</div>
		<div class="col-4">
			{$defs_rank}
		</div>
	</div>
	<div class="row">
		<div class="col-4">
			<span class="font-weight-bold">{$LNG.pl_total}</span>
		</div>
		<div class="col-4">
			{$total_points}
		</div>
		<div class="col-4">
			{$total_rank}
		</div>
	</div>
	<div class="row mt-3">
		<div class="col-4">
			<span class="font-weight-bold">{$LNG.pl_fightstats}</span>
		</div>
		<div class="col-4">
			<span class="font-weight-bold">{$LNG.pl_fights}</span>
		</div>
		<div class="col-4">
			<span class="font-weight-bold">{$LNG.pl_fprocent}</span>
		</div>
	</div>
	<div class="row">
		<div class="col-4">
			{$LNG.pl_fightwon}
		</div>
		<div class="col-4">
			{$wons}
		</div>
		<div class="col-4">
			{$siegprozent} %
		</div>
	</div>
	<div class="row">
		<div class="col-4">
			{$LNG.pl_fightdraw}
		</div>
		<div class="col-4">
			{$draws}
		</div>
		<div class="col-4">
			{$drawsprozent} %
		</div>
	</div>
	<div class="row">
		<div class="col-4">
			{$LNG.pl_fightlose}
		</div>
		<div class="col-4">
			{$loos}
		</div>
		<div class="col-4">
			{$loosprozent} %
		</div>
	</div>
	<div class="row mt-3">
		<div class="col-12">
			<span class="font-weight-bold">{$playerdestory}</span>
		</div>
	</div>
	<div class="row">
		<div class="col-5">
			{$LNG.pl_unitsshot}
		</div>
		<div class="col-7">
			{$desunits}
		</div>
	</div>
	<div class="row">
		<div class="col-5">
			{$LNG.pl_unitslose}
		</div>
		<div class="col-7">
			{$lostunits}
		</div>
	</div>
	<div class="row">
		<div class="col-5">
			{$LNG.pl_dermetal}
		</div>
		<div class="col-7">
			{$kbmetal}
		</div>
	</div>
	<div class="row">
		<div class="col-5">
			{$LNG.pl_dercrystal}
		</div>
		<div class="col-7">
			{$kbcrystal}
		</div>
	</div>
{/block}