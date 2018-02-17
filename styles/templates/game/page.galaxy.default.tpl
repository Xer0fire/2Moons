{block name="title" prepend}{$LNG.lm_galaxy}{/block}
{block name="content"}
	<div class="row">
		<div class="col-md-12">
			<div class="card border-0">
				<div class="card-header">
				{$LNG.gl_galaxy} {$LNG.gl_solar_system} [{$galaxy}:{$system}:x]
					<div class="card-actions">
						<a href="#" class="btn-minimize" data-toggle="collapse" data-target="#galaxy-explorer" aria-expanded="true"><i class="fa fa-chevron-up"></i></a>
					</div>
				</div>
				<div class="card-body collapse show" id="galaxy-explorer">
					<form action="?page=galaxy" method="post" id="galaxy_form">
						<input type="hidden" id="auto" value="dr">
						<div class="row">
							<div class="col-12 col-md-6">
								<div class="row content-center">
									<div class="controls mt-1 col-12">
										<label for="galaxy">{$LNG.gl_galaxy}</label>
										<div class="input-group">
											<span class="input-group-append">
												<button class="btn btn-warning" type="button" value="galaxyLeft" onclick="galaxy_submit('galaxyLeft')">
													<i class="fa fa-arrow-left"></i>
												</button>
											</span>
											<input class="form-control" size="16" type="text" name="galaxy" value="{$galaxy}" tabindex="">
											<span class="input-group-append">
												<button class="btn btn-warning" type="button" value="galaxyRight" onclick="galaxy_submit('galaxyRight')">
													<i class="fa fa-arrow-right"></i>
												</button>
											</span>
										</div>
									</div>
								</div>
							</div>
							<div class="col-12 col-md-6">
								<div class="row content-center">
									<div class="controls mt-1 col-12">
										<label for="system">{$LNG.gl_solar_system}</label>
										<div class="input-group">
											<span class="input-group-append">
												<button class="btn btn-warning" type="button" value="systemLeft" onclick="galaxy_submit('systemLeft')"><i class="fa fa-arrow-left"></i></button>
											</span>
											<input class="form-control" size="16" type="text" name="system" value="{$system}" tabindex="">
											<span class="input-group-append">
												<button class="btn btn-warning" type="button" value="systemRight" onclick="galaxy_submit('systemRight')"><i class="fa fa-arrow-right"></i></button>
											</span>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-12">
								<button type="submit" class="btn btn-success btn-block mt-2">{$LNG.gl_show}</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	<!--/.col-->
	</div>

	{if $action == 'sendMissle'}
	<div class="row">
		<div class="col-md-12">
			<div class="card border-0">
				<div class="card-header">
				{$LNG.gl_missil_launch} [{$galaxy}:{$system}:{$planet}]
				<div class="card-actions">
                    <a href="#" class="btn-close"><i class="fa fa-close"></i></a>
                  </div>
				</div>
				<div class="card-body" id="missileattack">
					<form action="?page=fleetMissile" method="post">
						<input type="hidden" name="galaxy" value="{$galaxy}">
						<input type="hidden" name="system" value="{$system}">
						<input type="hidden" name="planet" value="{$planet}">
						<input type="hidden" name="type" value="{$type}">
						<div class="row">
							<div class="col-12 col-md-6">
								<div class="row">
									<div class="controls mt-1 col-12">
										<label for="SendMI">{$missile_count}</label>
										<div class="input-group">
											<input class="form-control" size="16" type="text" name="SendMI" tabindex="">
											<span class="input-group-append">
												<button class="btn btn-warning" type="button" value="maxmissile" onclick="#">max</button>
											</span>
										</div>
									</div>
								</div>
							</div>
							<div class="col-12 col-md-6">
								<div class="row">
									<div class="controls mt-1 col-12">
										<label for="Target">{$LNG.gl_objective}</label>
										<div class="input-group">
											{html_options name=Target class="form-control" options=$missileSelector}
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-12">
								<button type="submit" class="btn btn-success btn-block mt-2">{$LNG.gl_missil_launch_action}</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	{/if}

	<div class="row">
		<div class="col-12">
			<a class="btn btn-warning btn-block" href="?page=fleetTable&amp;galaxy={$galaxy}&amp;system={$system}&amp;planet={$max_planets + 1}&amp;planettype=1&amp;target_mission=15">{$LNG.gl_out_space}</a>
		</div>
	</div>
	<div class="row">
		<div class="col-12">
			<div class="table-responsive">
				<table class="table table-striped table-sm">
					<tr>
						<th>{$LNG.gl_pos}</th>
						<th>{$LNG.gl_planet}</th>
						<th class="d-none d-md-table-cell">{$LNG.gl_name_activity}</th>
						<th>{$LNG.gl_moon}</th>
						<th>{$LNG.gl_debris}</th>
						<th>{$LNG.gl_player_estate}</th>
						<th>{$LNG.gl_alliance}</th>
						<th class="d-none d-md-table-cell">{$LNG.gl_actions}</th>
					</tr>
					{for $planet=1 to $max_planets}
						<tr>
						{if !isset($GalaxyRows[$planet])}
							<td>
								<a href="?page=fleetTable&amp;galaxy={$galaxy}&amp;system={$system}&amp;planet={$planet}&amp;planettype=1&amp;target_mission=7">{$planet}</a>
							</td>
							<td></td>
							<td class="d-none d-md-table-cell"></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td class="d-none d-md-table-cell"></td>
						{elseif $GalaxyRows[$planet] === false}
							<td>
								{$planet}
							</td>
							<td></td>
							<td class="d-none d-md-table-cell">{$LNG.gl_planet_destroyed}</td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td class="d-none d-md-table-cell"></td>
						{else}
							<td>
								{$planet}
							</td>
							{$currentPlanet = $GalaxyRows[$planet]}
							<td>
								<a class="position-relative" href="#" data-toggle="popover" data-html="true" data-content="
									{if $currentPlanet.missions.6}
										<a href='javascript:doit(6,{$currentPlanet.planet.id});'>{$LNG['type_mission_6']}</a>
										<br><br>
									{/if}
									{if $currentPlanet.planet.phalanx}
										<a href='javascript:OpenPopup(&quot;?page=phalanx&amp;galaxy={$galaxy}&amp;system={$system}&amp;planet={$planet}&amp;planettype=1&quot;, &quot;&quot;, 640, 510);'>{$LNG.gl_phalanx}</a>
										<br>
									{/if}
									{if $currentPlanet.missions.1}
										<a href='?page=fleetTable&amp;galaxy={$galaxy}&amp;system={$system}&amp;planet={$planet}&amp;planettype=1&amp;target_mission=1'>{$LNG['type_mission_1']}</a>
									<br>
									{/if}
									{if $currentPlanet.missions.5}
										<a href='?page=fleetTable&amp;galaxy={$galaxy}&amp;system={$system}&amp;planet={$planet}&amp;planettype=1&amp;target_mission=5'>{$LNG['type_mission_5']}</a>
										<br>
									{/if}
									{if $currentPlanet.missions.4}
										<a href='?page=fleetTable&amp;galaxy={$galaxy}&amp;system={$system}&amp;planet={$planet}&amp;planettype=1&amp;target_mission=4'>{$LNG['type_mission_4']}</a>
										<br>
									{/if}
									{if $currentPlanet.missions.3}
										<a href='?page=fleetTable&amp;galaxy={$galaxy}&amp;system={$system}&amp;planet={$planet}&amp;planettype=1&amp;target_mission=3'>{$LNG['type_mission_3']}</a>
										<br>{/if}
									{if $currentPlanet.missions.10}
										<a href='?page=galaxy&amp;action=sendMissle&amp;galaxy={$galaxy}&amp;system={$system}&amp;planet={$planet}'>{$LNG['type_mission_10']}</a>
										<br>
									{/if}
								" data-original-title="{$LNG.gl_planet} {$currentPlanet.planet.name} [{$galaxy}:{$system}:{$planet}]" data-placement="bottom">
								{if $currentPlanet.lastActivity == 'lessthan15'}
									<span class="badge ml-3 ml-md-0 ml-lg-4 pill-galaxy">
										<i class="fa fa-exclamation-triangle text-red"></i>
									</span>
								{elseif $currentPlanet.lastActivity == ''}
								{else}
									<span class="badge ml-3 ml-md-0 ml-lg-4 pill-galaxy pill-galaxy-yellow">
										{$currentPlanet.lastActivity}
									</span>
								{/if}
								<div class="mx-auto planet-sprite sprite-{$currentPlanet.planet.image}"></div>
								</a>
							</td>
							<td class="d-none d-md-table-cell">{$currentPlanet.planet.name}</td>
							<td>
								{if $currentPlanet.moon}
									
								<a href="#" data-toggle="popover" data-html="true" data-content="
									{$LNG.gl_features}<br/>
									{$LNG.gl_diameter} {$currentPlanet.moon.diameter|number}<br/>
									{$LNG.gl_temperature} {$currentPlanet.moon.temp_min}<br/><br/>
									{$LNG.gl_actions}<br/>
									{if $currentPlanet.missions.1}
										<a href='?page=fleetTable&amp;galaxy={$galaxy}&amp;system={$system}&amp;planet={$planet}&amp;planettype=3&amp;target_mission=1'>{$LNG['type_mission_1']}</a>
										<br>
									{/if}
									{if $currentPlanet.missions.3}
										<a href='?page=fleetTable&amp;galaxy={$galaxy}&amp;system={$system}&amp;planet={$planet}&amp;planettype=3&amp;target_mission=3'>{$LNG['type_mission_3']}</a>
										<br>
									{/if}
									{if $currentPlanet.missions.3}
										<a href='?page=fleetTable&amp;galaxy={$galaxy}&amp;system={$system}&amp;planet={$planet}&amp;planettype=3&amp;target_mission=4'>{$LNG['type_mission_4']}</a>
										<br>
									{/if}
									{if $currentPlanet.missions.5}
										<a href='?page=fleetTable&amp;galaxy={$galaxy}&amp;system={$system}&amp;planet={$planet}&amp;planettype=3&amp;target_mission=5'>{$LNG['type_mission_5']}</a>
										<br>
									{/if}
									{if $currentPlanet.missions.6}
										<a href='javascript:doit(6,{$currentPlanet.moon.id});'>{$LNG['type_mission_6']}</a>
										<br>
									{/if}
									{if $currentPlanet.missions.9}
										<a href='?page=fleetTable&amp;galaxy={$galaxy}&amp;system={$system}&amp;planet={$planet}&amp;planettype=3&amp;target_mission=9'>{$LNG['type_mission_9']}</a>
										<br>
									{/if}
									{if $currentPlanet.missions.10}
										<a href='?page=galaxy&amp;action=sendMissle&amp;galaxy={$galaxy}&amp;system={$system}&amp;planet={$planet}&amp;type=3'>{$LNG['type_mission_10']}</a>
										<br>
									{/if}
								" data-original-title="{$LNG.gl_moon} {$currentPlanet.moon.name} [{$galaxy}:{$system}:{$planet}]" data-placement="bottom">
								<div class="mx-auto planet-sprite sprite-mond"></div>
								</a>
								{/if}
							</td>
							<td>
								{if $currentPlanet.debris}
									<a href="#" data-toggle="popover" data-html="true" data-content="
										{$LNG.gl_resources}:<br/>
										{$LNG.tech.901}: {$currentPlanet.debris.metal|number}<br/>
										{$LNG.tech.902}: {$currentPlanet.debris.crystal|number}
										{if $currentPlanet.missions.8}
											<br/><br/>
											{$LNG.gl_actions}<br/>
											<a href='javascript:doit(8, {$currentPlanet.planet.id});'>{$LNG['type_mission_8']}</a>
										{/if}
									" data-original-title="{$LNG.gl_debris_field} [{$galaxy}:{$system}:{$planet}]" data-placement="bottom">
									<div class="mx-auto planet-sprite sprite-debris"></div>
									</a>
								{/if}
							</td>
							<td>
								<a href="#" data-toggle="popover" data-html="true" data-content="
									{$currentPlanet.user.playerrank}<br/>
									{if !$currentPlanet.ownPlanet}
										{if $currentPlanet.user.isBuddy}
											{$LNG.gl_buddy_request}
											<br/>
										{/if}
										<a href='#' onclick='PM({$currentPlanet.user.id},``)' data-toggle='modal' data-target='#messageModal'>{$LNG.write_message}</a>
										<br/>
										{$LNG.gl_playercard}
										<br/>
										<a href='?page=statistics&amp;who=1&amp;start={$currentPlanet.user.rank}'>{$LNG.gl_see_on_stats}</a>
									{/if}
								" data-original-title="{$currentPlanet.user.username}" data-placement="bottom">
								<span class="{foreach $currentPlanet.user.class as $class}{if !$class@first} {/if}galaxy-username-{$class}{/foreach} galaxy-username">
									{$currentPlanet.user.username}
								</span>
								{if !empty($currentPlanet.user.class)}
									<span>(</span>
										{foreach $currentPlanet.user.class as $class}
											{if !$class@first}
												&nbsp;
											{/if}
											<span class="galaxy-short-{$class} galaxy-short">
												{$ShortStatus.$class}
											</span>
										{/foreach}
									<span>)</span>
								{/if}
								</a>
							</td>
							<td>
								{if $currentPlanet.alliance}
									
									<a href="#" data-toggle="popover" data-html="true" data-content="
										{$currentPlanet.alliance.member}
										<br/>
										{if $currentPlanet.alliance.class}
											<a href='?page=alliance'>{$LNG.gl_alliance_page}</a>
										{else}
											<a href='?page=alliance&amp;mode=info&amp;id={$currentPlanet.alliance.id}'>{$LNG.gl_alliance_page}</a>
										{/if}
										<br/>
										<a href='?page=statistics&amp;start={$currentPlanet.alliance.rank}&amp;who=2'>{$LNG.gl_see_on_stats}</a>
										<br/>
										{if $currentPlanet.alliance.web}
											<a href='{$currentPlanet.alliance.web}' target='allyweb'>{$LNG.gl_alliance_web_page}</a>
										{/if}
									" data-original-title="{$currentPlanet.alliance.name}" data-placement="bottom">
										<span class="{foreach $currentPlanet.alliance.class as $class}{if !$class@first} {/if}galaxy-alliance-{$class}{/foreach} galaxy-alliance">{$currentPlanet.alliance.tag}</span>
									</a>
								{else}
									-
								{/if}
							</td>
							<td class="d-none d-md-table-cell">
								{if $currentPlanet.action}
									{if $currentPlanet.action.esp}
										<a class="mr-2" href="javascript:doit(6,{$currentPlanet.planet.id},{$spyShips|json|escape:'html'})">
											<i class="fa fa-eye"></i>
										</a>
									{/if}
									{if $currentPlanet.action.message}
										<a class="mr-2" href="#" onclick="PM({$currentPlanet.user.id},'')" data-toggle="modal" data-target="#messageModal">
											<i class="fa fa-envelope-o"></i>
										</a>
									{/if}
									{if $currentPlanet.action.buddy}
										<a class="mr-2" href="#" onclick="return Dialog.Buddy({$currentPlanet.user.id})">
											<i class="fa fa-magic"></i>
										</a>
									{/if}
									{if $currentPlanet.action.missle}
										<a class="mr-2" href="?page=galaxy&amp;action=sendMissle&amp;galaxy={$galaxy}&amp;system={$system}&amp;planet={$planet}&amp;type=1">
											<i class="fa fa-bolt"></i>
										</a>
									{/if}
								{/if}
								{if $currentPlanet.planet.phalanx}
									<a class="textForBlind" href="#" onclick="OpenPopup('?page=phalanx&amp;galaxy={$galaxy}&amp;system={$system}&amp;planet={$planet}&amp;planettype=1','',640,510);return false;"><i class="fa fa-assistive-listening-systems"></i>
									</a>
								{/if}
							</td>
						{/if}
						</tr>
					{/for}
				<tr>
					<td colspan="2">
						<a href="#" data-toggle="popover" data-html="true" data-content="
							<table>
								<tr>
								<td>
										{$LNG.gl_alliance_member}
									</td>
									<td>
										<span class='galaxy-alliance-member'>{$LNG.gl_short_member}</span>
									</td>
								</tr>
								<tr>
									<td>
										{$LNG.gl_alliance_enemy}
									</td>
									<td>
										<span class='galaxy-alliance-enemy'>{$LNG.gl_short_enemy}</span>
									</td>
								</tr>
								<tr>
									<td>
										{$LNG.gl_alliance_pact}
									</td>
									<td>
										<span class='galaxy-alliance-pact'>{$LNG.gl_short_alliance_pact}</span>
									</td>
								</tr>
								<tr>
									<td>
										{$LNG.gl_strong_player}
									</td>
									<td>
										<span class='galaxy-short-strong'>{$LNG.gl_short_strong}</span>
									</td>
								</tr>
								<tr>
									<td>
										{$LNG.gl_week_player}
									</td>
									<td>
										<span class='galaxy-short-noob'>{$LNG.gl_short_newbie}</span>
									</td>
								</tr>
								<tr>
									<td>
										{$LNG.gl_vacation}
									</td>
									<td>
										<span class='galaxy-short-vacation'>{$LNG.gl_short_vacation}</span>
									</td>
								</tr>
								<tr>
									<td>
										{$LNG.gl_banned}
									</td>
									<td>
										<span class='galaxy-short-banned'>{$LNG.gl_short_ban}</span>
									</td>
								</tr>
								<tr>
									<td>
										{$LNG.gl_inactive_seven}
									</td>
									<td>
										<span class='galaxy-short-inactive'>{$LNG.gl_short_inactive}</span>
									</td>
								</tr>
								<tr>
									<td>
										{$LNG.gl_inactive_twentyeight}
									</td>
									<td>
										<span class='galaxy-short-longinactive'>{$LNG.gl_short_long_inactive}</span>
									</td>
								</tr>
							</table>
						" data-original-title="{$LNG.gl_legend}" data-placement="bottom">
						{$LNG.gl_legend}
						</a>
					</td>
					<td colspan="6">({$planetcount})</td>
				</tr>
				</table>
			</div>
		</div>
	</div>

	<div class="row mt-4">
		<div class="col-md-12">
			<div class="card border-0">
				<div class="card-header">
				Fleet Status
				<div class="card-actions">
					<a href="game.php?page=fleetTable"><i class="fa fa-space-shuttle"></i></a>
					<a href="#" class="btn-minimize" data-toggle="collapse" data-target="#galaxy-fleet-status" aria-expanded="true"><i class="fa fa-chevron-up"></i></a>
				</div>
				</div>
				<div class="card-body collapse show" id="galaxy-fleet-status">
					<div class="row text-center">
						<div class="col-12 col-md-6">
							<span id="missiles">{$currentmip|number}</span> {$LNG.gl_avaible_missiles}
						</div>
						<div class="col-12 col-md-6">
							<span id="slots">{$maxfleetcount}</span>/{$fleetmax} {$LNG.gl_fleets}
						</div>
					</div>
					<div class="row text-center">
						<div class="col-12 col-md-6">
							<span id="elementID210">{$spyprobes|number}</span> {$LNG.gl_avaible_spyprobes}
						</div>
						<div class="col-12 col-md-6">
							<span id="elementID209">{$recyclers|number}</span> {$LNG.gl_avaible_recyclers}
						</div>
					</div>
					<div class="row">
							<span style="display: none;" id="fleetstatusrow">{$LNG.cff_fleet_target}</span>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="modal fade" id="messageModal" tabindex="-1" role="dialog" aria-labelledby="messageModal" style="display: none;" aria-hidden="true">
		<div class="modal-dialog modal-primary" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title">{$LNG.mg_send_new}</h4>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div id="messageModalBody" class="modal-body"></div>
			</div>
		</div>
	</div>
{/block}
{block name="script" append}
	<script type="text/javascript">
		status_ok		= '{$LNG.gl_ajax_status_ok}';
		status_fail		= '{$LNG.gl_ajax_status_fail}';
		MaxFleetSetting = {$settings_fleetactions};
	</script>
{/block}