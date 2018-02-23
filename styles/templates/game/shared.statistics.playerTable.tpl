<div class="table-responsive">
	<table class="table table-striped table-sm">
		<tr>
			<th>{$LNG.st_position}</th>
			<th>{$LNG.st_player}</th>
			<th>&nbsp;</th>
			<th>{$LNG.st_alliance}</th>
			<th>{$LNG.st_points}</th>
		</tr>
		{foreach name=RangeList item=RangeInfo from=$RangeList}
			<tr>
				<td>
					{if $RangeInfo.ranking == 0}
						<span class="text-blue">*</span>
					{elseif $RangeInfo.ranking < 0}
						<span class='text-red'>-{$RangeInfo.ranking}</span>
					{elseif $RangeInfo.ranking > 0}
						<span class='text-green'>+{$RangeInfo.ranking}</span>
					{/if}
					 {$RangeInfo.rank}
				</td>
				<td>
					<a href="#" onclick="playerCard({$RangeInfo.id})" data-toggle="modal" data-target="#playerModal"{if $RangeInfo.id == $CUser_id} class="text-green"{/if}>{$RangeInfo.name}</a>
				</td>
				<td>
					{if $RangeInfo.id != $CUser_id}
						<a href="#" onclick="PM({$RangeInfo.id},'')" data-toggle="modal" data-target="#messageModal">
							<i class="fa fa-envelope-o"></i>
						</a>
					{/if}
				</td>
				<td>
					{if $RangeInfo.allyid != 0}
						<a href="game.php?page=alliance&amp;mode=info&amp;id={$RangeInfo.allyid}">
							{if $RangeInfo.allyid == $CUser_ally}
								<span class="text-green">{$RangeInfo.allyname}</span>
							{else}
								{$RangeInfo.allyname}
							{/if}
						</a>
					{else}
						-
					{/if}</td>
				<td>
					{$RangeInfo.points}
				</td>
			</tr>
		{/foreach}
	</table>
</div>