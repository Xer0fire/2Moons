{block name="title" prepend}{$LNG.lm_options}{/block}
{block name="content"}
	<div class="card">
		<div class="card-header">
			{$LNG.op_vacation_mode_active_message} {$vacationUntil}
		</div>
		<div class="card-body">
			<form action="game.php?page=settings&amp;mode=send" method="post">
				<div class="row">
					<div class="col-7 col-md-6 align-self-center">
						{$LNG.op_end_vacation_mode}
					</div>
					<div class="col-4 col-md-6">
						<label class="switch switch-text switch-lg switch-success">
							<input class="switch-input" name="vacation" type="checkbox" value="1" {if !$canVacationDisbaled}disabled{/if}>
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
				<div class="row mt-4">
					<div class="col">
						<input class="btn btn-block btn-lg btn-success" value="{$LNG.op_save_changes}" type="submit">
					</div>
				</div>
			</form>
		</div>
	</div>
{/block}