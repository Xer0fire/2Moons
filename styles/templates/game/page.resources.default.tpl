{block name="title" prepend}{$LNG.lm_resources}{/block}
{block name="content"}
<form action="?page=resources" method="post">
<input type="hidden" name="mode" value="send">
<table style="width:760px;">
<tbody>
<tr>
	<th colspan="5">{$header}</th>
</tr>
<tr style="height:22px">
	<td style="width:40%">&nbsp;</td>
	<td style="width:10%">{$LNG.tech.901}</td>
	<td style="width:10%">{$LNG.tech.902}</td>
	<td style="width:10%">{$LNG.tech.903}</td>
	<td style="width:10%">{$LNG.tech.911}</td>
</tr>
<tr style="height:22px">
	<td>{$LNG.rs_basic_income}</td>
	<td>{$basicProduction.901|number}</td>
	<td>{$basicProduction.902|number}</td>
	<td>{$basicProduction.903|number}</td>
	<td>{$basicProduction.911|number}</td>
	<td><input value="{$LNG.rs_calculate}" type="submit"></td>
</tr>
{foreach $productionList as $productionID => $productionRow}
<tr style="height:22px">
	<td>{$LNG.tech.$productionID } ({if $productionID  > 200}{$LNG.rs_amount}{else}{$LNG.rs_lvl}{/if} {$productionRow.elementLevel})</td>
	<td><span style="color:{if $productionRow.production.901 > 0}lime{elseif $productionRow.production.901 < 0}red{else}white{/if}">{$productionRow.production.901|number}</span></td>
	<td><span style="color:{if $productionRow.production.902 > 0}lime{elseif $productionRow.production.902 < 0}red{else}white{/if}">{$productionRow.production.902|number}</span></td>
	<td><span style="color:{if $productionRow.production.903 > 0}lime{elseif $productionRow.production.903 < 0}red{else}white{/if}">{$productionRow.production.903|number}</span></td>
	<td><span style="color:{if $productionRow.production.911 > 0}lime{elseif $productionRow.production.911 < 0}red{else}white{/if}">{$productionRow.production.911|number}</span></td>
	<td style="width:10%">
		{html_options name="prod[{$productionID}]" options=$prodSelector selected=$productionRow.prodLevel}
	</td>
</tr>
{/foreach}
{if empty($productionMoon) ||  $productionMoon.0.solarreflector == 0}
{else}
<tr style="height:22px">
	<td>{$LNG.tech.45} ({$LNG.rs_lvl} {$productionMoon.0.solarreflector}) [{$LNG.type_planet_3}]</td>
	<td>0</td>
	<td>0</td>
	<td>0</td>
	<td><span style="color:{if $productionMoon.0.energy > 0}lime{elseif $productionMoon.0.energy < 0}red{else}white{/if}">{$productionMoon.0.energy|number}</span></td>
</tr>
{/if}
<tr style="height:22px">
	<td>{$LNG.rs_storage_capacity}</td>
	<td><span style="color:lime;">{$storage.901}</span></td>
	<td><span style="color:lime;">{$storage.902}</span></td>
	<td><span style="color:lime;">{$storage.903}</span></td>
	<td>-</td>
</tr>
<tr style="height:22px">
	<td>Protected Production:</td>
	<td><span style="color:{if $protectedProduction.901 > 0}lime{elseif $protectedProduction.901 < 0}red{else}white{/if}">{$protectedProduction.901}</span></td>
	<td><span style="color:{if $protectedProduction.902 > 0}lime{elseif $protectedProduction.902 < 0}red{else}white{/if}">{$protectedProduction.902}</span></td>
	<td><span style="color:{if $protectedProduction.903 > 0}lime{elseif $protectedProduction.903 < 0}red{else}white{/if}">{$protectedProduction.903}</span></td>
	<td>-</span></td>
</tr>
<tr style="height:22px">
	<td>{$LNG.rs_sum}:</td>
	<td><span style="color:{if $totalProduction.901 > 0}lime{elseif $totalProduction.901 < 0}red{else}white{/if}">{$totalProduction.901|number}</span></td>
	<td><span style="color:{if $totalProduction.902 > 0}lime{elseif $totalProduction.902 < 0}red{else}white{/if}">{$totalProduction.902|number}</span></td>
	<td><span style="color:{if $totalProduction.903 > 0}lime{elseif $totalProduction.903 < 0}red{else}white{/if}">{$totalProduction.903|number}</span></td>
	<td><span style="color:{if $totalProduction.911 > 0}lime{elseif $totalProduction.911 < 0}red{else}white{/if}">{$totalProduction.911|number}</span></td>
</tr>
<tr style="height:22px">
	<td>{$LNG.rs_daily}</td>
	<td><span style="color:{if $dailyProduction.901 > 0}lime{elseif $dailyProduction.901 < 0}red{else}white{/if}">{$dailyProduction.901|number}</span></td>
	<td><span style="color:{if $dailyProduction.902 > 0}lime{elseif $dailyProduction.902 < 0}red{else}white{/if}">{$dailyProduction.902|number}</span></td>
	<td><span style="color:{if $dailyProduction.903 > 0}lime{elseif $dailyProduction.903 < 0}red{else}white{/if}">{$dailyProduction.903|number}</span></td>
	<td><span style="color:{if $dailyProduction.911 > 0}lime{elseif $dailyProduction.911 < 0}red{else}white{/if}">{$dailyProduction.911|number}</span></td>
</tr>
<tr style="height:22px">
	<td>{$LNG.rs_weekly}</td>
	<td><span style="color:{if $weeklyProduction.901 > 0}lime{elseif $weeklyProduction.901 < 0}red{else}white{/if}">{$weeklyProduction.901|number}</span></td>
	<td><span style="color:{if $weeklyProduction.902 > 0}lime{elseif $weeklyProduction.902 < 0}red{else}white{/if}">{$weeklyProduction.902|number}</span></td>
	<td><span style="color:{if $weeklyProduction.903 > 0}lime{elseif $weeklyProduction.903 < 0}red{else}white{/if}">{$weeklyProduction.903|number}</span></td>
	<td><span style="color:{if $weeklyProduction.911 > 0}lime{elseif $weeklyProduction.911 < 0}red{else}white{/if}">{$weeklyProduction.911|number}</span></td>
</tr>
</tbody>
</table>
</form>
{/block}