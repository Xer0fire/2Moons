{block name="title" prepend}{$LNG.lm_research}{/block}
{block name="content"}
    <div class="row">
		<div class="col">
			<div class="card">
				<div class="card-header">
					{$LNG.al_your_request_title}
				</div>
				<div class="card-body-container collapse show" id="resources">
					<div class="card-body">
						<form action="game.php?page=alliance&amp;mode=cancelApply" method="post">
							<div class="row mt-2">
								<div class="col-12">
									{$request_text}
								</div>
							</div>
							<div class="row mt-4">
								<div class="col">
									<input class="btn btn-block btn-lg btn-warning" value="{$LNG.al_apply_delete}" type="submit">
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
{/block}