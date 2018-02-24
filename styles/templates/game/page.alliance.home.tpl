{block name="title" prepend}{$LNG.lm_alliance}{/block}
{block name="content"}
	{if $ally_image != ''}
		<div class="row">
			<div class="col-12">
				<div class="card">
					<div class="card-header">
						{$LNG.al_manage_image}
						<div class="card-actions">
							<a href="#" class="btn-minimize" data-toggle="collapse" data-target="#alliance-image" aria-expanded="true"><i class="fa fa-chevron-up"></i></a>
						</div>
					</div>
					<div class="card-body-container collapse show" id="alliance-image">
						<div class="card-body p-0">
							<img class="img-fluid" src="{$ally_image}" alt="{$ally_name}-alliance-image" />
						</div>
					</div>
				</div>
			</div>
		</div>
	{/if}

	<div class="row">
		<div class="col-12">
			<div class="card">
				<div class="card-header">
					{$LNG.al_ally_information}
					<div class="card-actions">
						<a href="#" class="btn-minimize" data-toggle="collapse" data-target="#alliance-info" aria-expanded="true"><i class="fa fa-chevron-up"></i></a>
					</div>
				</div>
				<div class="card-body-container collapse show" id="alliance-info">
					<div class="card-body">
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
								{$ally_max_members} / {$ally_members}{if $rights.MEMBERLIST} (<a href="?page=alliance&amp;mode=memberList">{$LNG.al_user_list}</a>){/if}
							</div>
						</div>
						<div class="row mb-2 mb-md-0">
							<div class="col-12 col-md-4">
								{$LNG.al_rank}
							</div>
							<div class="col-12 col-md-8">
								{$rankName}{if $rights.ADMIN} (<a href="?page=alliance&amp;mode=admin">{$LNG.al_manage_alliance}</a>){/if}
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
						{if $rights.ROUNDMAIL}
							<div class="row">
								<div class="col-12 col-md-4">
									{$LNG.al_circular_message}
								</div>
								<div class="col-12 col-md-8">
									<a href="game.php?page=alliance&mode=circular">{$LNG.al_send_circular_message}</a>
								</div>
							</div>
						{/if}
					</div>
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
						<a href="#" class="btn-minimize" data-toggle="collapse" data-target="#alliance-events" aria-expanded="true"><i class="fa fa-chevron-up"></i></a>
					</div>
				</div>
				<div class="card-body-container collapse show" id="alliance-events">
					<div class="card-body">
						{if $rights.EVENTS}
							{if $ally_events}
								{foreach $ally_events as $member => $events}
									<div class="row">
										<div class="col-12">
											{$member}
										</div>
									</div>
									{foreach $events as $index => $fleet}
										<div class="row">
											<div class="col-6">
												<span id="fleettime_{$index}" class="fleets" data-fleet-end-time="{$fleet.returntime}" data-fleet-time="{$fleet.resttime}">-</span>
											</div>
											<div class="col-6">
												{$fleet.text}
											</div>
										</div>
									{/foreach}
								{/foreach}
							{else}
								<div class="row">
									<div class="col-12">
										{$LNG.al_no_events}
									</div>
								</div>
							{/if}
						{/if}
						<div class="row">
							<div class="col-12">
								{if $ally_description}{$ally_description}{else}{$LNG.al_description_message}{/if}
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="row">
		<div class="col-12">
			<div class="card">
				<div class="card-header">
					{$LNG.al_inside_section}
					<div class="card-actions">
						<a href="#" class="btn-minimize" data-toggle="collapse" data-target="#alliance-internal" aria-expanded="true"><i class="fa fa-chevron-up"></i></a>
					</div>
				</div>
				<div class="card-body-container collapse show" id="alliance-internal">
					<div class="card-body">
						{$ally_text}
					</div>
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
				<div class="card-body-container collapse show" id="alliance-diplo">
					<div class="card-body">
						{if $DiploInfo}
							{assign var=iterator value=[0,1,2,3,4,5]}
							{foreach from=$iterator item=diplonum}
								{if !empty($DiploInfo.$diplonum)}
									<div class="row">
										<div class="col-12 text-center">
											{$LNG.al_diplo_level.$diplonum}
										</div>
									</div>
									<div class="row justify-content-around">
										{foreach item=PaktInfo from=$DiploInfo.$diplonum}
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
	</div>

	<div class="row">
		<div class="col-12">
			<div class="card">
				<div class="card-header">
					{$LNG.pl_fightstats}
					<div class="card-actions">
						<a href="#" class="btn-minimize" data-toggle="collapse" data-target="#alliance-stats" aria-expanded="true"><i class="fa fa-chevron-up"></i></a>
					</div>
				</div>
				<div class="card-body-container collapse show" id="alliance-stats">
					<div class="card-body">
						<div class="row">
							<div class="col-6">
								{$LNG.pl_totalfight}
							</div>
							<div class="col-6">
								{$totalfight|number}
							</div>
						</div>
						<div class="row">
							<div class="col-6">
								{$LNG.pl_fightwon}
							</div>
							<div class="col-6">
								{$fightwon|number} {if $totalfight}({round($fightwon / $totalfight * 100, 2)}%){/if}
							</div>
						</div>
						<div class="row">
							<div class="col-6">
								{$LNG.pl_fightlose}
							</div>
							<div class="col-6">
								{$fightlose|number} {if $totalfight}({round($fightlose / $totalfight * 100, 2)}%){/if}
							</div>
						</div>
						<div class="row">
							<div class="col-6">
								{$LNG.pl_fightdraw}
							</div>
							<div class="col-6">
								{$fightdraw|number} {if $totalfight}({round($fightdraw / $totalfight * 100, 2)}%){/if}
							</div>
						</div>
						<div class="row">
							<div class="col-6">
								{$LNG.pl_unitsshot}
							</div>
							<div class="col-6">
								{$unitsshot}
							</div>
						</div>
						<div class="row">
							<div class="col-6">
								{$LNG.pl_unitslose}
							</div>
							<div class="col-6">
								{$unitslose}
							</div>
						</div>
						<div class="row">
							<div class="col-6">
								{$LNG.pl_dermetal}
							</div>
							<div class="col-6">
								{$dermetal}
							</div>
						</div>
						<div class="row">
							<div class="col-6">
								{$LNG.pl_dercrystal}
							</div>
							<div class="col-6">
								{$dercrystal}
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	{if !$isOwner}
		<div class="row">
			<div class="col-12">
				<a class="btn btn-danger btn-lg btn-block mb-4" href="game.php?page=alliance&amp;mode=close" onclick="return confirm('{$LNG.al_leave_ally}');">{$LNG.al_leave_alliance}</a>
			</div>
		</div>
	{/if}
{/block}