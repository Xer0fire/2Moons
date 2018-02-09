{block name="title" prepend}{$LNG.lm_alliance}{/block}
{block name="content"}
	<div class="row">
		<div class="col-12">
			<div class="card">
				<div class="card-header">
					{$LNG.al_ally_information}
					<div class="card-actions">
						<a href="#" class="btn-minimize" data-toggle="collapse" data-target="#alliance-info" aria-expanded="true"><i class="fa fa-chevron-up"></i></a>
					</div>
				</div>
				<div class="card-body collapse show" id="alliance-info">
					<div class="row mb-2 mb-md-0">
						<div class="col-12 col-md-4">
							{$LNG.al_ally_info_tag}
						</div>
						<div class="col-12 col-md-8">
							{$ally_tag}
						</div>
					</div>
					<div class="row mb-2 mb-md-0">
						<div class="col-12 col-md-4">
							{$LNG.al_ally_info_name}
						</div>
						<div class="col-12 col-md-8">
							{$ally_name}
						</div>
					</div>
					<div class="row mb-2 mb-md-0">
						<div class="col-12 col-md-4">
							{$LNG.al_ally_info_members}
						</div>
						<div class="col-12 col-md-8">
							{$ally_member_scount} / {$ally_max_members}
						</div>
					</div>
					{if $ally_web}
						<div class="row mb-2 mb-md-0">
							<div class="col-12 col-md-4">
								{$LNG.al_web_text}
							</div>
							<div class="col-12 col-md-8">
								<a href="{$ally_web}">{$ally_web}</a>
							</div>
						</div>
					{/if}
					{if $ally_request}
						<div class="row mb-2 mb-md-0">
							<div class="col-12 col-md-4">
								{$LNG.al_request}
							</div>
							<div class="col-12 col-md-8">
								{if $ally_request_min_points}
									<a href="game.php?page=alliance&amp;mode=apply&amp;id={$ally_id}">{$LNG.al_click_to_send_request}</a>
								{else}
									{$ally_request_min_points_info}
								{/if}
							</div>
						</div>
					{/if}
				</div>
			</div>
		</div>
	</div>

	<div class="row">
		<div class="col-12">
			<div class="card">
				<div class="card-header">
					{$LNG.al_events}
					<div class="card-actions">
						<a href="#" class="btn-minimize" data-toggle="collapse" data-target="#alliance-desc" aria-expanded="true"><i class="fa fa-chevron-up"></i></a>
					</div>
				</div>
				<div class="card-body collapse show" id="alliance-desc">
					{if !empty($ally_description)}
						{$ally_description}
					{else}
						{$LNG.al_description_message}
					{/if}
				</div>
			</div>
		</div>
	</div>

	<div class="row">
		<div class="col-12">
			<div class="card">
				<div class="card-header">
					{$LNG.al_diplo}
					<div class="card-actions">
						<a href="#" class="btn-minimize" data-toggle="collapse" data-target="#alliance-diplo" aria-expanded="true"><i class="fa fa-chevron-up"></i></a>
					</div>
				</div>
				<div class="card-body collapse show" id="alliance-diplo">
					{if $diplomaticData}
						{assign var=iterator value=[0,1,2,3,4,5]}
						{foreach from=$iterator item=diplonum}
							{if !empty($diplomaticData.$diplonum)}
								<div class="row">
									<div class="col-12 text-center">
										{$LNG.al_diplo_level.$diplonum}
									</div>
								</div>
								<div class="row justify-content-around">
									{foreach item=PaktInfo from=$diplomaticData.$diplonum}
										<div class="col-auto">
											<a href="?page=alliance&mode=info&amp;id={$PaktInfo.1}">{$PaktInfo.0}</a>
										</div>
									{/foreach}
								</div>
							{/if}
						{/foreach}
					{else}
						{$LNG.al_no_diplo}
					{/if}
				</div>
			</div>
		</div>
	</div>

	{if !empty($statisticData)}
	<div class="row">
		<div class="col-12">
			<div class="card">
				<div class="card-header">
					{$LNG.pl_fightstats}
					<div class="card-actions">
						<a href="#" class="btn-minimize" data-toggle="collapse" data-target="#alliance-stats" aria-expanded="true"><i class="fa fa-chevron-up"></i></a>
					</div>
				</div>
				<div class="card-body collapse show" id="alliance-stats">
					<div class="row">
						<div class="col-6">
							{$LNG.pl_totalfight}
						</div>
						<div class="col-6">
							{$statisticData.totalfight|number}
						</div>
					</div>
					<div class="row">
						<div class="col-6">
							{$LNG.pl_fightwon}
						</div>
						<div class="col-6">
							{$statisticData.fightwon|number} {if $statisticData.totalfight}({round($statisticData.fightwon / $statisticData.totalfight * 100, 2)}%){/if}
						</div>
					</div>
					<div class="row">
						<div class="col-6">
							{$LNG.pl_fightlose}
						</div>
						<div class="col-6">
							{$statisticData.fightlose|number} {if $statisticData.totalfight}({round($statisticData.fightlose / $statisticData.totalfight * 100, 2)}%){/if}
						</div>
					</div>
					<div class="row">
						<div class="col-6">
							{$LNG.pl_fightdraw}
						</div>
						<div class="col-6">
							{$statisticData.fightdraw|number} {if $statisticData.totalfight}({round($statisticData.fightdraw / $statisticData.totalfight * 100, 2)}%){/if}
						</div>
					</div>
					<div class="row">
						<div class="col-6">
							{$LNG.pl_unitsshot}
						</div>
						<div class="col-6">
							{$statisticData.unitsshot}
						</div>
					</div>
					<div class="row">
						<div class="col-6">
							{$LNG.pl_unitslose}
						</div>
						<div class="col-6">
							{$statisticData.unitslose}
						</div>
					</div>
					<div class="row">
						<div class="col-6">
							{$LNG.pl_dermetal}
						</div>
						<div class="col-6">
							{$statisticData.dermetal}
						</div>
					</div>
					<div class="row">
						<div class="col-6">
							{$LNG.pl_dercrystal}
						</div>
						<div class="col-6">
							{$statisticData.dercrystal}
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	{/if}
{/block}