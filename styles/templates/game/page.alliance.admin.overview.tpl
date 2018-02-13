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
			{$LNG.al_texts}
		</div>
		<div class="card-body">
			<form action="game.php?page=alliance&mode=admin" method="post">
				<input type="hidden" name="textMode" value="{$textMode}">
				<input type="hidden" name="send" value="1">
				<div class="row">
					<div class="col-12 col-md-auto">
						<a href="game.php?page=alliance&amp;mode=admin&amp;textMode=external">{$LNG.al_outside_text}</a>
					</div>
					<div class="col-12 col-md-auto">
						<a href="game.php?page=alliance&amp;mode=admin&amp;textMode=internal">{$LNG.al_inside_text}</a>
					</div>
					<div class="col-12 col-md-auto">
						<a href="game.php?page=alliance&amp;mode=admin&amp;textMode=apply">{$LNG.al_request_text}</a>
					</div>
				</div>
				<div class="row">
					<div class="col">
						<textarea name="text" id="text" cols="70" rows="15" class="tinymce">{$text}</textarea>
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

	<div class="card">
		<div class="card-header">
			{$LNG.al_manage_options}
		</div>
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

	<div class="card">
		<div class="card-header">
			{$LNG.al_manage_requests}
		</div>
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
	</form>

	<div class="row">
		<div class="col">
			<input class="btn btn-block btn-lg btn-warning" type="reset" value="{$LNG.al_circular_reset}">
		</div>
		<div class="col">
			<input class="btn btn-block btn-lg btn-success" type="submit" value="{$LNG.al_save}">
		</div>
	</div>

	{if $AllianceOwner}
		<div class="card mt-4">
			<div class="card-header">
				[[Owner options]]
			</div>
			<div class="card-body">
				<div class="row">
				</div>
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
	{/if}
{/block}
{block name="script" append}
	<script type="text/javascript" src="scripts/base/tinymce/tiny_mce_gzip.js"></script>
	<script type="text/javascript">
	$(function() {
		tinyMCE_GZ.init({
			plugins : 'bbcode,fullscreen',
			themes : 'advanced',
			languages : '{$lang}',
			disk_cache : true,
			debug : false
		}, function() {
			tinyMCE.init({
				language : '{$lang}',
				script_url : 'scripts/base/tinymce/tiny_mce.js',
				theme : "advanced",
				mode : "textareas",
				plugins : "bbcode,fullscreen",
				theme_advanced_buttons1 : "bold,italic,underline,undo,redo,link,unlink,image,forecolor,styleselect,removeformat,cleanup,code,fullscreen",
				theme_advanced_buttons2 : "",
				theme_advanced_buttons3 : "",
				theme_advanced_toolbar_location : "bottom",
				theme_advanced_toolbar_align : "center",
				theme_advanced_styles : "Code=codeStyle;Quote=quoteStyle",
				content_css : "{$dpath}formate.css",
				entity_encoding : "raw",
				add_unload_trigger : false,
				remove_linebreaks : false,
				fullscreen_new_window : false,
				fullscreen_settings : {
					theme_advanced_path_location : "top"
				}
			});
		});
	});
	</script>
{/block}