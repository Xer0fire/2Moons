{block name="title" prepend}{$LNG.lm_alliance}{/block}
{block name="content"}
    <div class="row">
		<div class="col">
			<div class="card">
				<div class="card-header">
					{$LNG.al_alliance}
				</div>
				<div class="card-body-container collapse show" id="resources">
					<div class="card-body">
						<div class="row">
							<div class="col">
								<a href="game.php?page=alliance&amp;mode=create" class="btn btn-success btn-lg btn-block mt-1">{$LNG.al_alliance_make}</a>
							</div>
							<div class="col">
								<a href="game.php?page=alliance&amp;mode=search" class="btn btn-success btn-lg btn-block mt-1">{$LNG.al_alliance_search}</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
{/block}