{block name="title" prepend}{$LNG.lm_alliance}{/block}
{block name="content"}
	<div class="card">
		<div class="card-header">
			{$al_users_list}
		</div>
		<div class="card-body p-0">
			<div class="table-responsive">
				<table id="memberList" class="table table-striped table-sm tablesorter text-center">
					<thead>
						<tr>
							<th>{$LNG.al_member}</th>
							<th>{$LNG.al_message}</th>
							<th>{$LNG.al_position}</th>
							<th>{$LNG.al_points}</th>
							<th>{$LNG.al_estate}</th>
							<th>{$LNG.al_member_since}</th>
						</tr>
					</thead>
					<tbody>
					{foreach $memberList as $userID => $memberListRow}
						<tr>
							<td class="align-middle">
								<a href='#' onclick='playerCard({$userID})' data-toggle='modal' data-target='#playerModal'>{$memberListRow.username}</a>
							</td>
							<td class="align-middle">
								<a href="#" onclick="PM({$userID},'')" data-toggle="modal" data-target="#messageModal"><i class="fa fa-envelope-o"></i></a>
							</td>
							<td class="align-middle">
								{$memberListRow.rankName}
							</td>
							<td class="align-middle" data-points="{$memberListRow.points}">
								{shortly_number($memberListRow.points)}
							</td>
							<td class="align-middle">
								{if $rights.ONLINESTATE}
									{if $memberListRow.onlinetime < 4}
										<span style="color:lime">{$LNG.al_memberlist_on}</span>
									{elseif $memberListRow.onlinetime <= 15}
										<span style="color:yellow">{$memberListRow.onlinetime} {$LNG.al_memberlist_min}</span>
									{else}
										<span style="color:red">{$LNG.al_memberlist_off}</span>
									{/if}
								{else}
									-
								{/if}
							</td>
							<td class="align-middle">
								{$memberListRow.register_time}
							</td>
						</tr>
					{/foreach}
					</tbody>
				</table>
			</div>
		</div>
		<div class="card-footer">
			<a href="game.php?page=alliance">{$LNG.al_back}</a>
		</div>
	</div>

	<div class="modal fade" id="messageModal" tabindex="-1" role="dialog" aria-labelledby="messageModal" style="display: none;" aria-hidden="true">
		<div class="modal-dialog modal-primary" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title">{$LNG.mg_send_new}</h4>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div id="messageModalBody" class="modal-body"></div>
			</div>
		</div>
	</div>
	<div class="modal fade" id="playerModal" tabindex="-1" role="dialog" aria-labelledby="playerModal" style="display: none;" aria-hidden="true">
		<div class="modal-dialog modal-primary" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title">{$LNG.lm_playercard}</h4>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div id="playerModalBody" class="modal-body"></div>
			</div>
		</div>
	</div>
{/block}
{block name="script" append}
<script src="scripts/base/jquery.tablesorter.js"></script>
<script>$(function() {
    $("#memberList").tablesorter({
		headers: { 
			0: { sorter: false } ,
			3: { sorter: false } 
		},
		debug: false
	}); 
});</script>
{/block}