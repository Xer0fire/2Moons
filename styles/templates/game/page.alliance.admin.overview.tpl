{block name="title" prepend}{$LNG.lm_alliance}{/block}
{block name="content"}
	<div class="card">
		<div class="card-header">
			{$LNG.al_manage_alliance}
		</div>
		<div class="card-body">
			<div class="row justify-content-around">
				<div class="col-12 col-md-auto">
					<a href="game.php?page=alliance&amp;mode=admin&amp;action=permissions">{$LNG.al_manage_ranks}</a>
				</div>
				<div class="col-12 col-md-auto">
					<a href="game.php?page=alliance&amp;mode=admin&amp;action=members">{$LNG.al_manage_members}</a>
				</div>
				{if $rights.SEEAPPLY || $rights.MANAGEAPPLY}
					<a href="game.php?page=alliance&mode=admin&amp;action=mangeApply">{$LNG.al_manage_apply}</a>
				{/if}
				{if $rights.DIPLOMATIC}
					<div class="col-12 col-md-auto">
						<a href="game.php?page=alliance&amp;mode=admin&amp;action=diplomacy">{$LNG.al_manage_diplo}</a>
					</div>
				{/if}
			</div>
		</div>
	</div>

	<div class="card">
		<div class="card-header">
			{$LNG.al_texts} <span id="textModeDisp">({$LNG.al_mode}{$LNG.al_outside_text})</span>
			<div class="card-actions">
				<a href="#" class="btn-minimize" data-toggle="collapse" data-target="#alliance-optionstext" aria-expanded="true"><i class="fa fa-chevron-up"></i></a>
			</div>
		</div>
		<div class="card-body-container collapse show" id="alliance-optionstext">
			<div class="card-body">
				<form action="game.php?page=alliance&mode=admin&send=1" method="post">
				<input id="textMode" type="hidden" name="textMode" value="{$textMode}">
				<input type="hidden" name="send" value="1">
				<div class="row justify-content-around">
					<div class="col-12 col-md-auto">
						<a href="#" onclick="textMode('{$LNG.al_outside_text}')">{$LNG.al_outside_text}</a>
					</div>
					<div class="col-12 col-md-auto">
						<a href="#" onclick="textMode('{$LNG.al_inside_text}')">{$LNG.al_inside_text}</a>
					</div>
					<div class="col-12 col-md-auto">
						<a href="#" onclick="textMode('{$LNG.al_request_text}')">{$LNG.al_request_text}</a>
					</div>
				</div>
				<div class="row">
					<div class="col">
						<div id="trumbowyg"></div>
					</div>
				</div>
				<div class="row mt-2">
					<div class="col">
						<input class="btn btn-block btn-lg btn-warning" type="reset" value="{$LNG.al_circular_reset}">
					</div>
					<div class="col">
						<input class="btn btn-block btn-lg btn-success" type="submit" value="{$LNG.al_save}">
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="card">
		<div class="card-header">
			{$LNG.al_manage_options}
			<div class="card-actions">
				<a href="#" class="btn-minimize" data-toggle="collapse" data-target="#alliance-options" aria-expanded="true"><i class="fa fa-chevron-up"></i></a>
			</div>
		</div>
		<div class="card-body-container collapse show" id="alliance-options">
			<div class="card-body">
				<div class="row">
					<div class="col">
						{$LNG.al_tag}
					</div>
					<div class="col">
						<input class="form-control" type="text" name="ally_tag" value="{$ally_tag}" size="8" maxlength="8" required>
					</div>
				</div>
				<div class="row mt-2">
					<div class="col">
						{$LNG.al_name}
					</div>
					<div class="col">
						<input class="form-control" type="text" name="ally_name" value="{$ally_name}" size="20" maxlength="30" required>
					</div>
				</div>
				<div class="row mt-2">
					<div class="col">
						{$LNG.al_manage_founder_rank}
					</div>
					<div class="col">
						<input class="form-control" type="text" name="owner_range" value="{$ally_owner_range}" size="30">
					</div>
				</div>
				<div class="row mt-2">
					<div class="col">
						{$LNG.al_web_site}
					</div>
					<div class="col">
						<input class="form-control" type="text" name="web" value="{$ally_web}" size="70">
					</div>
				</div>
				<div class="row mt-2">
					<div class="col">
						{$LNG.al_manage_image}
					</div>
					<div class="col">
						<input class="form-control" type="text" name="image" value="{$ally_image}" size="70">
					</div>
				</div>
				<div class="row mt-2">
					<div class="col">
						{$LNG.al_view_events}
					</div>
					<div class="col">
						<select class="form-control" name="events[]" size="{$available_events|@count}" multiple>
							{foreach $available_events as $id => $mission}
								{foreach $ally_events as $selected_events}
									{if $selected_events == $id}
										{assign var=selected value=selected}
										{break}
									{else}
										{assign var=selected value=''}
									{/if}
								{/foreach}
								<option value="{$id}" {$selected}>{$mission}</option>
							{/foreach}
						</select>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="card">
		<div class="card-header">
			{$LNG.al_manage_requests}
			<div class="card-actions">
				<a href="#" class="btn-minimize" data-toggle="collapse" data-target="#alliance-applications" aria-expanded="true"><i class="fa fa-chevron-up"></i></a>
			</div>
		</div>
		<div class="card-body-container collapse show" id="alliance-applications">
			<div class="card-body">
				<div class="row">
					<div class="col">
						{$LNG.al_manage_requests}
					</div>
					<div class="col">
						{html_options class="form-control" name=request_notallow options=$RequestSelector selected=$ally_request_notallow}
					</div>
				</div>
				<div class="row mt-2">
					<div class="col">
						{$LNG.al_set_max_members}
					</div>
					<div class="col">
						<div class="input-group">
							<div class="input-group-prepend">
								<span class="input-group-text">{$ally_members} /</span>
							</div>
							<input class="form-control" type="number" min="1" name="ally_max_members" value="{$ally_max_members}" size="8">
						</div>
					</div>
				</div>
				<div class="row mt-2">
					<div class="col">
						{$LNG.al_manage_request_min_points}
					</div>
					<div class="col">
						<input class="form-control" type="number" min="0" name="request_min_points" value="{$ally_request_min_points}" size="30">
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="row">
		<div class="col">
			<input class="btn btn-block btn-lg btn-warning" type="reset" value="{$LNG.al_circular_reset}">
		</div>
		<div class="col">
			<input class="btn btn-block btn-lg btn-success" type="submit" value="{$LNG.al_save}">
		</div>
	</div>
	</form>

	{if $AllianceOwner}
		<div class="card mt-4">
			<div class="card-header">
				{$LNG.al_owner_options}
			<div class="card-actions">
				<a href="#" class="btn-minimize" data-toggle="collapse" data-target="#alliance-ownerop" aria-expanded="true"><i class="fa fa-chevron-up"></i></a>
			</div>
		</div>
			<div class="card-body-container collapse show" id="alliance-ownerop">
				<div class="card-body">
					<div class="row">
						<div class="col">
							<form action="game.php?page=alliance&amp;mode=admin&amp;action=close" method="post">
								<input class="btn btn-block btn-lg btn-danger" type="submit" value="{$LNG.al_disolve_alliance}" onclick="return confirm('{$LNG.al_close_ally}');">
							</form>
						</div>
					</div>
					<div class="row mt-3">
						<div class="col">
							<form action="game.php?page=alliance&amp;mode=admin&amp;action=transfer" method="post">
								<input class="btn btn-block btn-lg btn-danger" type="submit" value="{$LNG.al_transfer_alliance}">
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	{/if}
{/block}
{block name="script" append}
	<link href="scripts/base/trumbowyg/ui/trumbowyg.min.css" rel="stylesheet">
	<script type="text/javascript" src="scripts/base/trumbowyg/trumbowyg.min.js"></script>
	<script type="text/javascript">
	function textMode(mode) {
		switch (mode){
			case '{$LNG.al_outside_text}':
				$('#textMode').val('external');
				$('#trumbowyg').empty().html(stripslashes({$ally_description}));
				break;
			case '{$LNG.al_inside_text}':
				$('#textMode').val('internal');
				$('#trumbowyg').empty().html(stripslashes({$ally_text}));
				break;
			case '{$LNG.al_request_text}':
				$('#textMode').val('apply');
				$('#trumbowyg').empty().html(stripslashes({$ally_request}));
				break;
			default:
		}
		$('#textModeDisp').html('({$LNG.al_mode}'+mode+')');
		localStorage.setItem("omicron-alliance-admin-textmode", mode);
	}
	$(function() {
		$('#trumbowyg').trumbowyg({
			btns: ['viewHTML','|','strong','em','link','|','fullscreen'],
			autogrow: true
		});
		var aat = localStorage.getItem("omicron-alliance-admin-textmode");
		if (aat) {
			textMode(aat);
		}
	});
	</script>
{/block}