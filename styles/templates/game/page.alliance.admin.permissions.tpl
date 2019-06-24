{block name="title" prepend}{$LNG.lm_alliance}{/block}
{block name="content"}
{$countRank = count($availableRanks)}
	<div class="row">
		<div class="col">
			<div class="card">
				<div class="card-header">
					{$LNG.al_configura_ranks}
					<div class="card-actions">
						<a href='#' data-toggle='modal' data-target='#createNewAllianceRankModal'><i class="fa fa-plus"></i></a>
					</div>
				</div>
				<div class="card-body-container">
					<div class="card-body p-0">
						<div class="table-responsive">
							<form action="game.php?page=alliance&amp;mode=admin&amp;action=permissionsSend" method="post">
								<input type="hidden" value="1" name="send">
								<table class="table table-striped table-sm tablesorter text-center pb-2">
								<tr>
									<th>{$LNG.al_dlte}</th>
									<th>{$LNG.al_rank_name}</th>
									{foreach $availableRanks as $rankName}
									<th>
										<a class="d-flex mr-2" href="#" data-toggle="popover" data-trigger="hover" data-html="true"
										 data-template="
											<div class='popover nav-popover' role='tooltip'><div class='arrow'></div><h3 class='popover-header'></h3><div class='popover-body'></div></div>
										" data-content="{$LNG.al_rank_desc[$rankName]}
										" data-original-title="{$rankName}" data-placement="bottom">
											<img class="mx-auto d-block" src="styles/resource/images/alliance/{$rankName}.png" alt="" width="16" height="16">
										</a>
									</th>
									{/foreach}
								</tr>
								{foreach $rankList as $rowId => $rankRow}
								<tr>
									<td><a href="game.php?page=alliance&amp;mode=admin&amp;action=permissionsSend&amp;deleteRank={$rowId}"><i class="fa fa-times fa-2x text-red"></i></a></td>
									<td><input class="form-control" type="text" name="rank[{$rowId}][rankName]" value="{$rankRow.rankName}"></td>
									{foreach $availableRanks as $rankId => $rankName}
									<td><input type="checkbox" name="rank[{$rowId}][{$rankId}]" value="1"{if $rankRow[$rankName]} checked{/if}{if !$ownRights[$rankName]} disabled{/if}></td>
									{/foreach}
								</tr>
								{foreachelse}
								<tr>
									<td colspan="{$countRank + 2}">{$LNG.al_no_ranks_defined}</td>
								</tr>
								{/foreach}
								<tr>
									<td class="p-0" colspan="{$countRank + 2}"><button type="submit" class="btn btn-success btn-lg btn-block mt-2">{$LNG.al_save}</button></td>
								</tr>
								</table>
							</form>
						</div>
					</div>
					<div class="card-footer">
						<a href="game.php?page=alliance&amp;mode=admin">{$LNG.al_back}</a> &nbsp; | &nbsp; <a href='#' data-toggle='modal' data-target='#legendModal'>{$LNG.gl_legend}</a>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="modal fade" id="legendModal" tabindex="-1" role="dialog" aria-labelledby="legendModal" style="display: none;" aria-hidden="true">
		<div class="modal-dialog modal-primary modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title">{$LNG.gl_legend}</h4>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div id="legendModalBody" class="modal-body">
					<table>
					{foreach $availableRanks as $rankName}
					<tr>
						<td><img src="styles/resource/images/alliance/{$rankName}.png" alt="" width="16" height="16"></td>
						<td colspan="{$countRank + 1}">{$LNG.al_rank_desc[$rankName]}</td>
					</tr>
					{/foreach}
					</table>
				</div>
			</div>
		</div>
	</div>

	<div class="modal fade" id="createNewAllianceRankModal" tabindex="-1" role="dialog" aria-labelledby="createNewAllianceRankModal" style="display: none;" aria-hidden="true">
		<div class="modal-dialog modal-primary modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title">{$LNG.al_create_new_rank}</h4>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div id="createNewAllianceRankModalBody" class="modal-body">
					<form action="game.php?page=alliance&amp;mode=admin&amp;action=permissionsSend" method="post">
						<table class="w-100">
							<tr>
								<td><label for="rankName">{$LNG.al_rank_name}</label></td>
								<td><input class="form-control" type="text" name="newrank[rankName]" size="20" maxlength="32" id="rankName" required></td>
							</tr>
							<tr>
								<th colspan="{$countRank + 2}">&nbsp;</th>
							</tr>
							{foreach $availableRanks as $rankId => $rankName}
							<tr>
								<td><img src="styles/resource/images/alliance/{$rankName}.png" alt="{$rankName}" width="16" height="16">&nbsp;<label for="rank_{$rankId}">{$LNG.al_rank_desc[$rankName]}</label></td>
								<td><input type="checkbox" name="newrank[{$rankId}]" value="1" id="rank_{$rankId}" title="{$LNG.al_rank_desc[$rankName]}"></td>
							</tr>
							{/foreach}
							<tr>
								<td colspan="{$countRank + 2}"><input class="btn btn-success btn-lg btn-block mt-2" type="submit" value="{$LNG.al_create}"></td>
							</tr>
						</table>
					</form>
				</div>
			</div>
		</div>
	</div>
{/block}