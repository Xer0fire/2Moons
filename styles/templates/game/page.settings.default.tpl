{block name="title" prepend}{$LNG.lm_options}{/block}
{block name="content"}
	{if $userAuthlevel > 0}
	<div class="card">
		<div class="card-header">
			{$LNG.op_admin_title_options}
		</div>
		<div class="card-body">
			<form action="game.php?page=settings" method="post">
			<input type="hidden" name="mode" value="send">
			<div class="row">
				<div class="col-7 col-md-6 align-self-center">
					{$LNG.op_admin_planets_protection}
				</div>
				<div class="col-4 col-md-6">
					<label class="switch switch switch-text switch-lg switch-success">
						<input class="switch-input" name="adminprotection" type="checkbox" value="1" {if $adminProtection > 0}checked='checked'{/if}>
						<span class="switch-label" data-on="On" data-off="Off"></span>
						<span class="switch-handle"></span>
					</label>
				</div>
			</div>
		</div>
	</div>
	{/if}

	<div class="card">
		<div class="card-header">
			[[Options]]
		</div>
		<div class="card-body">
			{if $userAuthlevel == 0}
			<form action="game.php?page=settings" method="post">
			<input type="hidden" name="mode" value="send">
			{/if}
				<div class="row">
					<div class="col">
						<p class="h5">{$LNG.op_user_data}</p>
					</div>
				</div>
				<div class="row">
					<div class="col-12 col-md-6 align-self-center">
						{$LNG.op_username}
					</div>
					<div class="col-12 col-md-6">
						{if $changeNickTime < 0}<input class="form-control" name="username" size="20" value="{$username}" type="text">{else}{$username}{/if}
					</div>
				</div>
				<div class="row mt-2">
					<div class="col-12 col-md-6 align-self-center">
						{$LNG.op_old_pass}
					</div>
					<div class="col-12 col-md-6">
						<input class="form-control" name="password" size="20" type="password" class="autocomplete">
					</div>
				</div>
				<div class="row mt-2">
					<div class="col-12 col-md-6 align-self-center">
						{$LNG.op_new_pass}
					</div>
					<div class="col-12 col-md-6">
						<input class="form-control" name="newpassword" size="20" maxlength="40" type="password" class="autocomplete">
					</div>
				</div>
				<div class="row mt-2">
					<div class="col-12 col-md-6 align-self-center">
						{$LNG.op_repeat_new_pass}
					</div>
					<div class="col-12 col-md-6">
						<input class="form-control" name="newpassword2" size="20" maxlength="40" type="password" class="autocomplete">
					</div>
				</div>
				<div class="row mt-2">
					<div class="col-12 col-md-6 align-self-center">
						<a title="{$LNG.op_email_adress_descrip}">{$LNG.op_email_adress}</a>
					</div>
					<div class="col-12 col-md-6">
						<input class="form-control" name="email" maxlength="64" size="20" value="{$email}" type="text">
					</div>
				</div>
				<div class="row mt-2">
					<div class="col-12 col-md-6 align-self-center">
						{$LNG.op_permanent_email_adress}
					</div>
					<div class="col-12 col-md-6">
						{$permaEmail}
					</div>
				</div>
				<div class="row mt-4">
					<div class="col">
						<p class="h5">{$LNG.op_general_settings}</p>
					</div>
				</div>
				<div class="row">
					<div class="col-12 col-md-6 align-self-center">
						{$LNG.op_timezone}
					</div>
					<div class="col-12 col-md-6">
						{html_options class="form-control" name=timezone options=$Selectors.timezones selected=$timezone}
					</div>
				</div>
				{if count($Selectors.lang) > 1}
				<div class="row mt-2">
					<div class="col-12 col-md-6 align-self-center">
						{$LNG.op_lang}
					</div>
					<div class="col-12 col-md-6">
						{html_options class="form-control" name=language options=$Selectors.lang selected=$userLang}
					</div>
				</div>
				{/if}
				<div class="row mt-2">
					<div class="col-12 col-md-6 align-self-center">
						{$LNG.op_sort_planets_by}
					</div>
					<div class="col-12 col-md-6">
						{html_options class="form-control" name=planetSort options=$Selectors.Sort selected=$planetSort}
					</div>
				</div>
				<div class="row mt-2">
					<div class="col-12 col-md-6 align-self-center">
						{$LNG.op_sort_kind}
					</div>
					<div class="col-12 col-md-6">
						{html_options class="form-control" name=planetOrder options=$Selectors.SortUpDown selected=$planetOrder}
					</div>
				</div>
				{if count($Selectors.Skins) > 1}
				<div class="row mt-2">
					<div class="col-12 col-md-6 align-self-center">
						{$LNG.op_skin_example}
					</div>
					<div class="col-12 col-md-6">
						{html_options class=form-control options=$Selectors.Skins selected=$theme name="theme" id="theme"}
					</div>
				</div>
				{/if}
				<div class="row mt-3 mt-md-2">
					<div class="col-7 col-md-6 align-self-center">
						{$LNG.op_active_build_messages}
					</div>
					<div class="col-4 col-md-6">
						<label class="switch switch-text switch-lg switch-success">
							<input class="switch-input" name="queueMessages" type="checkbox" value="1" {if $queueMessages == 1}checked="checked"{/if}>
							<span class="switch-label" data-on="On" data-off="Off"></span>
							<span class="switch-handle"></span>
						</label>
					</div>
				</div>
				<div class="row mt-2">
					<div class="col-7 col-md-6 align-self-center">
						{$LNG.op_active_spy_messages_mode}
					</div>
					<div class="col-4 col-md-6">
						<label class="switch switch-text switch-lg switch-success">
							<input class="switch-input" name="spyMessagesMode" type="checkbox" value="1" {if $spyMessagesMode == 1}checked="checked"{/if}>
							<span class="switch-label" data-on="On" data-off="Off"></span>
							<span class="switch-handle"></span>
						</label>
					</div>
				</div>
				<div class="row mt-2">
					<div class="col-7 col-md-6 align-self-center">
						{$LNG.op_block_pm}
					</div>
					<div class="col-4 col-md-6">
						<label class="switch switch-text switch-lg switch-success">
							<input class="switch-input" name="blockPM" type="checkbox" value="1" {if $blockPM == 1}checked="checked"{/if}>
							<span class="switch-label" data-on="On" data-off="Off"></span>
							<span class="switch-handle"></span>
						</label>
					</div>
				</div>
				<div class="row mt-4">
					<div class="col">
						<p class="h5">{$LNG.op_galaxy_settings}</p>
					</div>
				</div>
				<div class="row">
					<div class="col-12 col-md-6 align-self-center">
						<a title="{$LNG.op_spy_probes_number_descrip}">{$LNG.op_spy_probes_number}</a>
					</div>
					<div class="col-12 col-md-6">
						<input class="form-control" name="spycount" size="{$spycount|count_characters + 3}" value="{$spycount}" type="int">
					</div>
				</div>
				<div class="row mt-2">
					<div class="col-12 col-md-6 align-self-center">
						{$LNG.op_max_fleets_messages}
					</div>
					<div class="col-12 col-md-6">
						<input class="form-control" name="fleetactions" maxlength="2" size="{$fleetActions|count_characters + 2}" value="{$fleetActions}" type="int">
					</div>
				</div>
				<div class="row mt-4">
					<div class="col">
						<p class="h5">{$LNG.op_shortcut}</p>
					</div>
				</div>
				<div class="row">
					<div class="col-7 col-md-6 align-self-center">
						<i class="fa fa-eye"></i> {$LNG.op_spy}
					</div>
					<div class="col-4 col-md-6">
						<label class="switch switch-text switch-lg switch-success">
							<input class="switch-input" name="galaxySpy" type="checkbox" value="1" {if $galaxySpy == 1}checked="checked"{/if}>
							<span class="switch-label" data-on="On" data-off="Off"></span>
							<span class="switch-handle"></span>
						</label>
					</div>
				</div>
				<div class="row mt-2">
					<div class="col-7 col-md-6 align-self-center">
						<i class="fa fa-envelope-o"></i> {$LNG.op_write_message}
					</div>
					<div class="col-4 col-md-6">
						<label class="switch switch-text switch-lg switch-success">
							<input class="switch-input" name="galaxyMessage" type="checkbox" value="1" {if $galaxyMessage == 1}checked="checked"{/if}>
							<span class="switch-label" data-on="On" data-off="Off"></span>
							<span class="switch-handle"></span>
						</label>
					</div>
				</div>
				<div class="row mt-2">
					<div class="col-7 col-md-6 align-self-center">
						<i class="fa fa-magic"></i> {$LNG.op_add_to_buddy_list}
					</div>
					<div class="col-4 col-md-6">
						<label class="switch switch-text switch-lg switch-success">
							<input class="switch-input" name="galaxyBuddyList" type="checkbox" value="1" {if $galaxyBuddyList == 1}checked="checked"{/if}>
							<span class="switch-label" data-on="On" data-off="Off"></span>
							<span class="switch-handle"></span>
						</label>
					</div>
				</div>
				<div class="row mt-2">
					<div class="col-7 col-md-6 align-self-center">
						<i class="fa fa-bolt"></i> {$LNG.op_missile_attack} 
					</div>
					<div class="col-4 col-md-6">
						<label class="switch switch-text switch-lg switch-success">
							<input class="switch-input" name="galaxyMissle" type="checkbox" value="1" {if $galaxyMissle == 1}checked="checked"{/if}>
							<span class="switch-label" data-on="On" data-off="Off"></span>
							<span class="switch-handle"></span>
						</label>
					</div>
				</div>
				<div class="row mt-4">
					<div class="col">
						<p class="h5">{$LNG.op_vacation_delete_mode}</p>
					</div>
				</div>
				<div class="row">
					<div class="col-7 col-md-6 align-self-center">
						<a title="{$LNG.op_activate_vacation_mode_descrip}">{$LNG.op_activate_vacation_mode}</a>
					</div>
					<div class="col-4 col-md-6">
						<label class="switch switch-text switch-lg switch-warning">
							<input class="switch-input" name="vacation" type="checkbox" value="1">
							<span class="switch-label" data-on="On" data-off="Off"></span>
							<span class="switch-handle"></span>
						</label>
					</div>
				</div>
				<div class="row mt-2">
					<div class="col-7 col-md-6 align-self-center">
						<a title="{$LNG.op_dlte_account_descrip}">{$LNG.op_dlte_account}</a>
					</div>
					<div class="col-4 col-md-6">
						<label class="switch switch-text switch-lg switch-danger">
							<input class="switch-input" name="delete" type="checkbox" value="1" {if $delete > 0}checked="checked"{/if}>
							<span class="switch-label" data-on="On" data-off="Off"></span>
							<span class="switch-handle"></span>
						</label>
					</div>
				</div>
				{if isModuleAvailable($smarty.const.MODULE_BANNER)}
				<div class="row mt-2">
					<div class="col-12 col-md-6 align-self-center">
						{$LNG.ov_userbanner}
					</div>
					<div class="col-12 col-md-6">
						<img src="userpic.php?id={$userid}" alt="" width="590" height="95" id="userpic"><br><br><table><tr><td class="transparent">HTML:</td><td class="transparent"><input type="text" value='<a href="{$SELF_URL}{if $ref_active}index.php?ref={$userid}{/if}"><img src="{$SELF_URL}userpic.php?id={$userid}"></a>' readonly="readonly" style="width:450px;"></td></tr><tr><td class="transparent">BBCode:</td><td class="transparent"><input type="text" value="[url={$SELF_URL}{if $ref_active}index.php?ref={$userid}{/if}][img]{$SELF_URL}userpic.php?id={$userid}[/img][/url]" readonly="readonly" style="width:450px;"></td></tr></table>
					</div>
				</div>
				{/if}
				<div class="row mt-4">
					<div class="col">
						<input class="btn btn-block btn-lg btn-success" value="{$LNG.op_save_changes}" type="submit">
					</div>
				</div>
			</form>
		</div>
	</div>
{/block}