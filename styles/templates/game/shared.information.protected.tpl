{$count = $productionTable.usedResource}

<table class="table table-responsive-sm table-sm">
	<tbody>
		<tr>
			<td colspan="2">
				<table>
				<tr>
					<th>{$LNG.in_level}</th>
				{if $count > 1}
					{foreach $productionTable.usedResource as $resourceID}
					<th colspan="2">{$LNG.tech.$resourceID}</th>
					{/foreach}
				</tr>
				<tr>
					<th>&nbsp;</th>
				{/if}
					{foreach $productionTable.usedResource as $resourceID}
					<th>{$LNG.in_protected}</th>
					<th>{$LNG.in_difference}</th>
					{/foreach}
				</tr>
				{foreach $productionTable.protected as $elementLevel => $productionData}
				<tr>
					<td><span{if $CurrentLevel == $elementLevel} style="color:#ff0000"{/if}>{$elementLevel}</span></td>
					{foreach $productionData as $resourceID => $protected}
					{$protectedDiff = $protected - $productionTable.protected.$CurrentLevel.$resourceID}
					<td><span style="color:{if $protected > 0}lime{elseif $protected < 0}red{else}white{/if}">{$protected|number}</span></td>
					<td><span style="color:{if $protectedDiff > 0}lime{elseif $protectedDiff < 0}red{else}white{/if}">{$protectedDiff|number}</span></td>
					{/foreach}
				</tr>
				{/foreach}
				</table>
			</td>
		</tr>
	</tbody>
</table>