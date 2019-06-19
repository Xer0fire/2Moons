{block name="title" prepend}{$LNG.lm_alliance}{/block}
{block name="content"}
	<form action="game.php?page=alliance&amp;mode=admin&amp;action=sendAnswerToApply&amp;id={$applyDetail.applyID}" method="post">
		<div class="row">
			<div class="col">
				<div class="card">
					<div class="card-header">
						{$LNG.al_request_from} {$applyDetail.username} / {$apply_time}
					</div>
					<div class="card-body-container collapse show" id="resources">
						<div class="card-body p-0">
							<div class="table-responsive">
								<table class="table table-striped table-sm">
								<tr>
									<td colspan="2">{$LNG.pl_name}</td>
									<td colspan="2">{$applyDetail.username}</td>
								</tr>
								<tr>
									<td colspan="2">{$LNG.pl_homeplanet}</td>
									<td colspan="2">{$applyDetail.name} <a href="#" onclick="parent.location = 'game.php?page=galaxy&galaxy={$applyDetail.galaxy}&system={$applyDetail.system}';return false;">[{$applyDetail.coordinates}]</a></td>
								</tr>
								<tr>
									<td colspan="2">{$LNG.al_request_register_time}</td>
									<td colspan="2">{$register_time}</td>
								</tr>
								<tr>
									<td colspan="2">{$LNG.al_request_last_onlinetime}</td>
									<td colspan="2">{$onlinetime}</td>
								</tr>
								<tr>
									<th colspan="2">&nbsp;</th>
									<th colspan="1">{$LNG.pl_points}</th>
									<th colspan="1">{$LNG.pl_range}</th>
								</tr>
								<tr>
									<td colspan="2">{$LNG.pl_tech}</td>
									<td colspan="1">{$applyDetail.tech_points}</td>
									<td colspan="1">{$applyDetail.tech_rank}</td>
								</tr>
								<tr>
									<td colspan="2">{$LNG.pl_builds}</td>
									<td colspan="1">{$applyDetail.build_points}</td>
									<td colspan="1">{$applyDetail.build_rank}</td>
								</tr>
								<tr>
									<td colspan="2">{$LNG.pl_def}</td>
									<td colspan="1">{$applyDetail.defs_points}</td>
									<td colspan="1">{$applyDetail.defs_rank}</td>
								</tr>
								<tr>
									<td colspan="2">{$LNG.pl_fleet}</td>
									<td colspan="1">{$applyDetail.fleet_points}</td>
									<td colspan="1">{$applyDetail.fleet_rank}</td>
								</tr>
								<tr>
									<td colspan="2">{$LNG.pl_total}</td>
									<td colspan="1">{$applyDetail.total_points}</td>
									<td colspan="1">{$applyDetail.total_rank}</td>
								</tr>
								<tr>
									<th colspan="2">{$LNG.pl_fightstats}</th>
									<th colspan="1">{$LNG.pl_fights}</th>
									<th colspan="1">{$LNG.pl_fprocent}</th>
								</tr>
								<tr>
									<td colspan="2">{$LNG.pl_fightwon}</td>
									<td colspan="1">{$applyDetail.wons}</td>
									<td colspan="1">{$applyDetail.wons_percentage} %</td>
								</tr>
								<tr>
									<td colspan="2">{$LNG.pl_fightdraw}</td>
									<td colspan="1">{$applyDetail.draws}</td>
									<td colspan="1">{$applyDetail.draws_percentage} %</td>
								</tr>
								<tr>
									<td colspan="2">{$LNG.pl_fightlose}</td>
									<td colspan="1">{$applyDetail.loos}</td>
									<td colspan="1">{$applyDetail.loos_percentage} %</td>
								</tr>
								<tr>
									<td colspan="2">{$LNG.pl_totalfight}</td>
									<td colspan="1">{$applyDetail.total_fights}</td>
									<td colspan="1">100 %</td>
								</tr>
								<tr>
									<td colspan="2">{$LNG.pl_unitsshot}</td>
									<td colspan="2">{$applyDetail.desunits}</td>
								</tr>
								<tr>
									<td colspan="2">{$LNG.pl_unitslose}</td>
									<td colspan="2">{$applyDetail.lostunits}</td>
								</tr>
								<tr>
									<td colspan="2">{$LNG.pl_dermetal}</td>
									<td colspan="2">{$applyDetail.kbmetal}</td>
								</tr>
								<tr>
									<td colspan="2">{$LNG.pl_dercrystal}</td>
									<td colspan="2">{$applyDetail.kbcrystal}</td>
								</tr>
								{if !empty($applyDetail.text)}
								<tr>
									<th colspan="4">{$LNG.al_message}</th>
								</tr>
								<tr>
									<td colspan="4">{$applyDetail.text}</td>
								</tr>
								{/if}
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col">
				<div class="card">
					<div class="card-header">
						{$LNG.al_reply_to_request}
					</div>
					<div class="card-body pt-0 pb-0">
						<div class="row">
							<div class="col">
								<div id="trumbowyg"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="row pb-4">
			<div class="col-6">
				<button class="btn btn-block btn-lg btn-success" type="submit" name="answer" value="yes">{$LNG.al_acept_request}</button>
			</div>
			<div class="col-6">
				<button class="btn btn-block btn-lg btn-danger" type="submit" name="answer" value="no">{$LNG.al_decline_request}</button>
			</div>
		</div>
	</form>
{/block}
{block name="script" append}
	<link href="scripts/base/trumbowyg/ui/trumbowyg.min.css" rel="stylesheet">
	<script type="text/javascript" src="scripts/base/trumbowyg/trumbowyg.min.js"></script>
	<script type="text/javascript">
	$(function() {
		$('#trumbowyg').trumbowyg({
			btns: ['viewHTML','|','strong','em','link','|','fullscreen'],
			autogrow: true
		});
	});
	</script>
{/block}