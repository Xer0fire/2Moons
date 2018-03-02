{block name="title" prepend}{$LNG.lm_buddylist}{/block}
{block name="content"}
	<div class="card">
		<div class="card-header">
			{$LNG.bu_buddy_list}
		</div>
		<div class="card-body p-0">
			<div class="table-responsive">
				<table class="table table-striped table-sm">
					<tr>
						<th>{$LNG.bu_player}</td>
						<th>Message</td>
						<th>{$LNG.bu_alliance}</th>
						<th>{$LNG.bu_coords}</th>
						<th>{$LNG.bu_online}</th>
						<th>{$LNG.bu_action}</th>
					</tr>
					{foreach $myBuddyList as $myBuddyID => $myBuddyRow}
						<tr>
							<td>
								<a href='#' onclick='playerCard({$myBuddyRow.id})' data-toggle='modal' data-target='#playerModal'>{$myBuddyRow.username}</a>
							</td>
							<td>
								<a href="#" onclick="PM({$myBuddyRow.id},'')" data-toggle="modal" data-target="#messageModal"><i class="fa fa-envelope-o"></i></a>
							</td>
							<td>
								{if {$myBuddyRow.ally_name}}
									<a href="game.php?page=alliance&amp;mode=info&amp;id={$myBuddyRow.ally_id}">{$myBuddyRow.ally_name}</a>
								{else}
									-
								{/if}</td>
							<td>
								<a href="game.php?page=galaxy&amp;galaxy={$myBuddyRow.galaxy}&amp;system={$myBuddyRow.system}">[{$myBuddyRow.galaxy}:{$myBuddyRow.system}:{$myBuddyRow.planet}]</a>
							</td>
							<td>
								{if $myBuddyRow.onlinetime < 4}
									<span style="color:lime">{$LNG.bu_connected}</span>
								{elseif $myBuddyRow.onlinetime >= 4 && $myBuddyRow.onlinetime <= 15}
									<span style="color:yellow">{$myBuddyRow.onlinetime} {$LNG.bu_minutes}</span>
								{else}
									<span style="color:red">{$LNG.bu_disconnected}</span>
								{/if}
							</td>
							<td>
								<a href="game.php?page=buddyList&amp;mode=delete&amp;id={$myBuddyID}"><i class="fa fa-times text-red"></i></a>
							</td>
						</tr>
					{foreachelse}
						<tr>
							<td colspan="5">{$LNG.bu_no_buddys}</td>
						</tr>
					{/foreach}
				</table>
			</div>
		</div>
	</div>

	{if  !empty($otherRequestList) || !empty($myRequestList)}
	<div class="card">
		<div class="card-header">
			[[Buddy List Requests]]
		</div>
		<div class="card-body p-0">
			<div class="table-responsive">
				<table class="table table-striped table-sm">
					{if !empty($otherRequestList)}
						<tr>
							<th colspan="5" style="text-align:center">{$LNG.bu_requests}</th></tr>
						<tr>
							<th>{$LNG.bu_player}</th>
							<th>{$LNG.bu_alliance}</th>
							<th>{$LNG.bu_coords}</th>
							<th>{$LNG.bu_text}</th>
							<th>{$LNG.bu_action}</th>
						</tr>
						{foreach $otherRequestList as $otherRequestID => $otherRequestRow}
							<tr>
								<td>
									<a href='#' onclick='playerCard({$otherRequestRow.id})' data-toggle='modal' data-target='#playerModal'>{$otherRequestRow.username}</a>
								</td>
								<td>
									{if {$otherRequestRow.ally_name}}
										<a href="game.php?page=alliance&amp;mode=info&amp;id={$otherRequestRow.ally_id}">{$otherRequestRow.ally_name}</a>
									{else}
										-
									{/if}
								</td>
								<td>
									<a href="game.php?page=galaxy&amp;galaxy={$otherRequestRow.galaxy}&amp;system={$otherRequestRow.system}">[{$otherRequestRow.galaxy}:{$otherRequestRow.system}:{$otherRequestRow.planet}]</a>
								</td>
								<td>
									{$otherRequestRow.text}
								</td>
								<td>
									<a href="game.php?page=buddyList&amp;mode=accept&amp;id={$otherRequestID}"><i class="fa fa-tick text-green"></i></a><a href="game.php?page=buddyList&amp;mode=delete&amp;id={$otherRequestID}"><i class="fa fa-times text-red"></i></a>
								</td>
							</tr>
						{foreachelse}
							<tr>
								<td colspan="5">{$LNG.bu_no_request}</td>
							</tr>
						{/foreach}
					{/if}
					{if !empty($myRequestList)}
						<tr>
							<th colspan="5" style="text-align:center">{$LNG.bu_my_requests}</th>
						</tr>
						<tr>
							<th>{$LNG.bu_player}</th>
							<th>{$LNG.bu_alliance}</th>
							<th>{$LNG.bu_coords}</th>
							<th>{$LNG.bu_text}</th>
							<th>{$LNG.bu_action}</th>
						</tr>
						{foreach $myRequestList as $myRequestID => $myRequestRow}
							<tr>
								<td>
									<a href='#' onclick='playerCard({$otherRequestRow.id})' data-toggle='modal' data-target='#playerModal'>{$myRequestRow.username}</a>
								</td>
								<td>
									{if {$myRequestRow.ally_name}}
										<a href="game.php?page=alliance&amp;mode=info&amp;id={$myRequestRow.ally_id}">{$myRequestRow.ally_name}</a>
									{else}
										-
									{/if}
								</td>
								<td>
									<a href="game.php?page=galaxy&amp;galaxy={$myRequestRow.galaxy}&amp;system={$myRequestRow.system}">[{$myRequestRow.galaxy}:{$myRequestRow.system}:{$myRequestRow.planet}]</a>
								</td>
								<td>
									{$myRequestRow.text}
								</td>
								<td>
									<a href="game.php?page=buddyList&amp;mode=delete&amp;id={$myRequestID}"><i class="fa fa-times text-red"></i></a>
								</td>
							</tr>
						{foreachelse}
							<tr>
								<td colspan="5">{$LNG.bu_no_request}</td>
							</tr>
						{/foreach}
					{/if}
				</table>
			</div>
		</div>
	</div>
	{/if}

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