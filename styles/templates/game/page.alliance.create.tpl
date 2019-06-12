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
						<form action="game.php?page=alliance&amp;mode=create&amp;action=send" method="post">
							<div class="row">
								<div class="col">
									<p class="h5">{$LNG.al_make_alliance}</p>
								</div>
							</div>
							<div class="row">
								<div class="col-12 col-md-6 align-self-center">
									{$LNG.al_make_ally_tag_required}
								</div>
								<div class="col-12 col-md-6">
									<input class="form-control" type="text" name="atag" size="8" maxlength="8" value="">
								</div>
							</div>
							<div class="row mt-2">
								<div class="col-12 col-md-6 align-self-center">
									{$LNG.al_make_ally_name_required}
								</div>
								<div class="col-12 col-md-6">
									<input class="form-control" type="text" name="aname" size="20" maxlength="30" value="">
								</div>
							</div>
							<div class="row mt-4">
								<div class="col">
									<input class="btn btn-block btn-lg btn-success" value="{$LNG.al_make_submit}" type="submit">
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
{/block}