{block name="title" prepend}{$LNG.lm_alliance}{/block}
{block name="content"}
	<div class="row">
		<div class="col">
			<div class="card">
				<div class="card-header">
					{$LNG.al_request_list}
				</div>
				<div class="card-body-container collapse show" id="resources">
					<div class="card-body">
						<div class="row">
							<div class="col-12">
								{$LNG.al_candidate} / {$LNG.al_request_date}
							</div>
						</div>
						{foreach $applyList as $applyRow}
							<div class="row">
								<div class="col-12">
									<a href="game.php?page=alliance&amp;mode=admin&amp;action=detailApply&amp;id={$applyRow.id}">{$applyRow.username} / {$applyRow.time}</a>
								</div>
							</div>
						{foreachelse}
							<div class="row">
								<div class="col-12">
									{$LNG.al_no_requests}
								</div>
							</div>
						{/foreach}
						<div class="row mt-4">
							<div class="col-12">
								<a class="btn btn-block btn-lg btn-success" href="game.php?page=alliance">{$LNG.al_back}</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
{/block}