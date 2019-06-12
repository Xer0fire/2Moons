{block name="title" prepend}{$LNG.lm_alliance}{/block}
{block name="content"}
    <div class="row">
		<div class="col">
			<div class="card">
				<div class="card-header">
					{$LNG.al_find_alliances}
					<div class="card-actions">
						<a href="#" class="btn-minimize" data-toggle="collapse" data-target="#resources" aria-expanded="true"><i class="fa fa-chevron-up"></i></a>
				  </div>
				</div>
				<div class="card-body-container collapse show" id="resources">
					<div class="card-body">
						<form action="game.php?page=alliance&amp;mode=search" method="post">
							<div class="row">
								<div class="col">
									<p class="h5">{$LNG.al_find_alliances}</p>
								</div>
							</div>
							<div class="row">
								<div class="col-12 col-md-6 align-self-center">
									{$LNG.al_find_text}
								</div>
								<div class="col-12 col-md-6">
									<input class="form-control" type="text" name="searchtext" size="8" maxlength="8" value="{$searchText}">
								</div>
							</div>
							<div class="row mt-4">
								<div class="col">
									<input class="btn btn-block btn-lg btn-success" value="{$LNG.al_find_submit}" type="submit">
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	{if !empty($searchList)}
	<div class="row">
		<div class="col">
			<div class="card">
				<div class="card-header">
					{$LNG.al_find_results}
					<div class="card-actions">
						<a href="#" class="btn-minimize" data-toggle="collapse" data-target="#resources" aria-expanded="true"><i class="fa fa-chevron-up"></i></a>
				  </div>
				</div>
				<div class="card-body-container collapse show" id="resources">
					<div class="card-body">
						<div class="row">
							<div class="col-4">
								{$LNG.al_ally_info_tag}
							</div>
							<div class="col-4">
								{$LNG.al_ally_info_name}
							</div>
							<div class="col-4">
								{$LNG.al_ally_info_members}
							</div>
						</div>
						{foreach $searchList as $searchRow}
						<div class="row">
							<div class="col-4">
								<a href="game.php?page=alliance&amp;mode=apply&amp;id={$searchRow.id}">{$searchRow.tag}</a>
							</div>
							<div class="col-4">
								<a href="game.php?page=alliance&amp;mode=apply&amp;id={$searchRow.id}">{$searchRow.name}</a>
							</div>
							<div class="col-4">
								<a href="game.php?page=alliance&amp;mode=apply&amp;id={$searchRow.id}">{$searchRow.members}</a>
							</div>
						</div>
						{foreachelse}
							<div class="row">
								<div class="col-12">
									{$LNG.al_find_no_alliances}
								</div>
							</div>
						{/foreach}
					</div>
				</div>
			</div>
		</div>
	</div>
	{/if}

{/block}