{block name="title" prepend}{$LNG.lm_overview}{/block}
{block name="script" append}{/block}
{block name="content"}
          <div class="row">
            <div class="col-md-12">
              <div class="card border-0">
                <div class="card-header">
                  Fleet Events{if sizeof($fleets) != 0} ({sizeof($fleets)}){/if}
                  <div class="card-actions">
                    <a href="game.php?page=fleetTable"><i class="fa fa-space-shuttle"></i></a>
                    <a href="#" class="btn-minimize" data-toggle="collapse" data-target="#fleetevents" aria-expanded="true"><i class="fa fa-chevron-up"></i></a>
                  </div>
                </div>
                  <div class="card-body-container collapse show" id="fleetevents">
					<div class="card-body">
						{foreach $fleets as $index => $fleet}
							<span id="fleettime_{$index}" class="fleets" data-fleet-end-time="{$fleet.returntime}" data-fleet-time="{$fleet.resttime}">{pretty_fly_time({$fleet.resttime})}</span>
							<span colspan="2">{$fleet.text}</span>
							<br/>
						{/foreach}
					</div>
                </div>
              </div>
            </div>
            <!--/.col-->
          </div>

		{if $is_news}
			<div class="row">
				<div class="col-md-12">
					<div class="card border-0">
						<div class="card-header">
							{$LNG.ov_news}
							<div class="card-actions">
								<a href="#" class="btn-minimize" data-toggle="collapse" data-target="#news" aria-expanded="true"><i class="fa fa-chevron-up"></i></a>
							</div>
						</div>
						<div class="card-body-container collapse show" id="news">
							<div class="card-body">
								<div class="row">
									<div class="col-12">
										{$news}
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		{/if}

          <div class="row">
            <div class="col-md-12">
              <div class="card border-0">
                <div class="card-header">
                  {$LNG["type_planet_{$planet_type}"]} {$planetname}
				  <div class="card-actions">
                    <a href="game.php?page=resources"><i class="fa fa-leaf"></i></a>
                    <a href="#" class="btn-setting"><i class="fa fa-cog"></i></a>
                  </div>
                </div>
                <div class="card-body">
                  <div class="row">
                    <div class="col-md-3">
                      {$LNG.ov_server_time}
                    </div>
                    <div class="col-md-auto">
                      <span class="servertime">{$servertime}</span>
                    </div>
                  </div>
                  <!--/.row-->
                  {foreach $resourceTable as $resourceID => $resourceData}
                  <div class="row">
                    <div class="col-md-3">
                      {$resourceData.LNGname}
                    </div>
                    <div class="col-md-auto">
						{if $shortlyNumber}
						{else}
							{if !isset($resourceData.current)}
								{$resourceData.current = $resourceData.max + $resourceData.used}
									<span class="ovr_current {if $resourceData.current < 0} text-red{/if}">{$resourceData.current|number} / {$resourceData.max|number}</span>
								{else}
								{if isset($resourceData.production)}
									<span class="text-green">(+{$resourceData.production|number})</span> 
								{/if}
								<span class="ovr_current" id="ovr_{$resourceData.name}" data-real="{$resourceData.current}">{$resourceData.current|number}</span>
							{/if}
							{if !isset($resourceData.current) || !isset($resourceData.max) || $resourceID == 911}
							{else}
								/ <span class="text-green" id="max_{$resourceData.name}">{$resourceData.max|number}
								</span>
							{/if}
						{/if}
                    </div>
                  </div>
                  <!--/.row-->
                  {/foreach}
                  <div class="row">
                    <div class="col-md-3">
                      {$LNG.ov_diameter}
                    </div>
                    <div class="col-md-auto">
                      {$planet_diameter} {$LNG.ov_distance_unit} (<a title="{$LNG.ov_developed_fields}">{$planet_field_current}</a> / <a title="{$LNG.ov_max_developed_fields}">{$planet_field_max}</a> {$LNG.ov_fields})
                    </div>
                  </div>
                  <!--/.row-->
                  <div class="row">
                    <div class="col-md-3">
                      {$LNG.ov_temperature}
                    </div>
                    <div class="col-md-auto">
                      {$LNG.ov_aprox} {$planet_temp_min}{$LNG.ov_temp_unit} {$LNG.ov_to} {$planet_temp_max}{$LNG.ov_temp_unit}
                    </div>
                  </div>
                  <!--/.row-->
                  <div class="row">
                    <div class="col-md-3">
                      {$LNG.ov_position}
                    </div>
                    <div class="col-md-auto">
                      <a href="game.php?page=galaxy&amp;galaxy={$galaxy}&amp;system={$system}">[{$galaxy}:{$system}:{$planet}]</a>
                    </div>
                  </div>
                  <!--/.row-->
                  <div class="row">
                    <div class="col-md-3">
                      {$LNG.ov_points}
                    </div>
                    <div class="col-md-auto">
                      {$rankInfo}
                    </div>
                  </div>
                  <!--/.row-->
                </div>
              </div>
            </div>
            <!--/.col-->
          </div>

		  <div class="row justify-content-around">
            <div class="col-md-auto">
              <div class="card border-0">
                <div class="card-header">
                  Building
				  <div class="card-actions">
                    <a href="game.php?page=buildings"><i class="fa fa-university"></i></a>
                  </div>
                </div>
                <div class="card-body">
					<div class="media">
						{if $buildInfo.buildings}
							<div class="d-flex mr-3 build-sprite sprite-{$buildInfo.buildings['id']}"></div>
						{/if}
						<div class="media-body align-self-center">
							{if $buildInfo.buildings}
								{$LNG.tech[$buildInfo.buildings['id']]} ({$buildInfo.buildings['level']})<br><div class="timer" data-time="{$buildInfo.buildings['timeleft']}">{$buildInfo.buildings['starttime']}</div>{else}{$LNG.ov_free_building}
							{/if}
						</div>
					</div>
                </div>
              </div>
            </div>
            <!--/.col-->

			{if isModuleAvailable($smarty.const.MODULE_RESEARCH) && $navResearch > 0}
            <div class="col-md-auto">
              <div class="card border-0">
                <div class="card-header">
                  Research
				  <div class="card-actions">
                    <a href="game.php?page=research"><i class="fa fa-flask"></i></a>
                  </div>
                </div>
                <div class="card-body">
					<div class="media">
						{if $buildInfo.tech}
							<div class="d-flex mr-3 build-sprite sprite-{$buildInfo.tech['id']}"></div>
						{/if}
						<div class="media-body align-self-center">
							{if $buildInfo.tech}{$LNG.tech[$buildInfo.tech['id']]} ({$buildInfo.tech['level']})<br><div class="timer" data-time="{$buildInfo.tech['timeleft']}">{$buildInfo.tech['starttime']}</div>{else}{$LNG.ov_free_research}{/if}
						</div>
					</div>
                </div>
              </div>
            </div>
            <!--/.col-->
            {/if}
			
			{if isModuleAvailable($smarty.const.MODULE_RESEARCH) && $navShipyard > 0}
            <div class="col-md-auto">
              <div class="card border-0">
                <div class="card-header">
                  Hanger
				  <div class="card-actions">
                    <a href="game.php?page=shipyard&mode=fleet"><i class="fa fa-microchip"></i></a>
                    <a href="game.php?page=shipyard&mode=defense"><i class="fa fa-flag"></i></a>
                  </div>
                </div>
                <div class="card-body">
					<div class="media">
						
						{if $buildInfo.fleet}
							<div class="d-flex mr-3 build-sprite sprite-{$buildInfo.fleet['id']}"></div>
						{/if}
						<div class="media-body align-self-center">
							{if $buildInfo.fleet}{$LNG.tech[$buildInfo.fleet['id']]} ({$buildInfo.fleet['level']})<br><div class="timer" data-time="{$buildInfo.fleet['timeleft']}">{$buildInfo.fleet['starttime']}</div>{else}{$LNG.ov_free_fleet}{/if}
						</div>
					</div>
                </div>
              </div>
            </div>
            <!--/.col-->
            {/if}
          </div>
          <!--/.row-->

		{if $ref_active}
			<div class="row">
				<div class="col-md-12">
					<div class="card border-0">
						<div class="card-header">
							{$LNG.ov_reflink}
							<div class="card-actions">
								<a href="#" class="btn-minimize" data-toggle="collapse" data-target="#referal" aria-expanded="true"><i class="fa fa-chevron-up"></i></a>
							</div>
						</div>
						<div class="card-body-container collapse show" id="referal">
							<div class="card-body">
								<div class="row">
									<div class="col-12">
										<input id="referral" class="form-control type="text" disabled="disabled" value="{$path}index.php?ref={$userid}" />
									</div>
								</div>
								<div class="row">
										{foreach $RefLinks as $RefID => $RefLink}
											<div class="col-6">
												<a href="#" onclick="return Dialog.Playercard({$RefID}, '{$RefLink.username}');">{$RefLink.username}</a>
											</div>
											<div class="col-6 text-right">
												{{$RefLink.points|number}} / {$ref_minpoints|number}
											</div>
										{foreachelse}
											<div class="col-12">
												{$LNG.ov_noreflink}
											</div>
										{/foreach}
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		{/if}

          <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-primary" role="document">
              <div class="modal-content">
                <div class="modal-header">
                  <h4 class="modal-title">{$LNG["type_planet_{$planet_type}"]} {$planetname}</h4>
                  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                  </button>
                </div>
                <div class="modal-body">
					<div class="col-auto">
						<ul class="nav nav-tabs" role="tablist">
							<li class="nav-item">
								<a class="nav-link active" data-toggle="tab" href="#rename" role="tab" aria-controls="rename">{$LNG.ov_planet_rename}</a>
							</li>
							<li class="nav-item">
								<a class="nav-link" data-toggle="tab" href="#delete" role="tab" aria-controls="delete">{$LNG.ov_delete_planet}</a>
							</li>
						</ul>

						<div class="tab-content">
							<div class="tab-pane active" id="rename" role="tabpanel">
								<div class="form-group row">
									<label class="col-md-3 col-form-label" for="name">{$LNG.ov_rename_label}</label>
									<div class="col-md-9">
										<input class="left" type="text" name="name" id="name" size="25" maxlength="20" autocomplete="off" />
									</div>
								</div>
								<div class="form-group form-actions">
									<input class="btn btn-primary" type="button" onclick="checkrename()" value="{$LNG.ov_planet_rename}" />
								</div>
							</div>
							<div class="tab-pane" id="delete" role="tabpanel">
								<div class="form-group row">
									<label class="col-md-3 col-form-label" for="password">{$LNG.ov_password}</label>
									<div class="col-md-9">
										<input class="left" type="password" name="password" id="password" size="25" maxlength="20" autocomplete="off">
									</div>
								</div>
								<div class="form-group form-actions">
									<input class="btn btn-primary" type="button" onclick="checkcancel()" value="{$LNG.ov_delete_planet}" />
								</div>
							</div>
						</div>
					</div>
                </div>
              </div>
              <!-- /.modal-content -->
            </div>
            <!-- /.modal-dialog -->
          </div>
{/block}
{block name="script" append}
		{if !$vmode}
		<script type="text/javascript">
		var viewShortlyNumber	= {$shortlyNumber|json};
		var vacation			= {$vmode};
        $(function() {
		{foreach $resourceTable as $resourceID => $resourceData}
		{if isset($resourceData.production)}
            resourceTicker({
                available: {$resourceData.current|json},
                limit: [0, {$resourceData.max|json}],
                production: {$resourceData.production|json},
                valueElem: "ovr_{$resourceData.name}"
            }, true);
		{/if}
		{/foreach}
        });
		</script>
		{/if}
    <script src="scripts/game/overview.js"></script>
    <script src="scripts/game/overview.actions.js"></script>
{/block}