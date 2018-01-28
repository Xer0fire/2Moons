{block name="title" prepend}{$LNG.lm_overview}{/block}
{block name="script" append}{/block}
{block name="content"}
          <div class="row">
            <div class="col-md-12">
              <div class="card border-0">
                <div class="card-header">
                  Events
                  <div class="card-actions">
                    <a href="game.php?page=fleetTable"><i class="fa fa-space-shuttle"></i></a>
                    <a href="#" class="btn-minimize" data-toggle="collapse" data-target="#events" aria-expanded="true"><i class="fa fa-chevron-up"></i></a>
                  </div>
                </div>
                <div class="card-body collapse show" id="events">
                  {foreach $fleets as $index => $fleet}
					<span id="fleettime_{$index}" class="fleets" data-fleet-end-time="{$fleet.returntime}" data-fleet-time="{$fleet.resttime}">{pretty_fly_time({$fleet.resttime})}</span>
					<span colspan="2">{$fleet.text}</span>
					<br/>
                  {/foreach}
                </div>
              </div>
            </div>
            <!--/.col-->
          </div>

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
                      {$resourceData.name}
                    </div>
                    <div class="col-md-auto">
						{if $shortlyNumber}
						{else}
							{if !isset($resourceData.current)}
								{$resourceData.current = $resourceData.max + $resourceData.used}
								<span class="res_current">
								<span{if $resourceData.current < 0} style="color:red"{/if}>{$resourceData.current|number} / {$resourceData.max|number}</span>
								{else}
								<span class="res_current" id="current_{$resourceData.name}" data-real="{$resourceData.current}">{$resourceData.current|number}</span>
							{/if}
							{if !isset($resourceData.current) || !isset($resourceData.max) || $resourceID == 911}
							{else}
								/ <span class="res_max" id="max_{$resourceData.name}">{$resourceData.max|number}</span>
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

		  <div class="row justify-content-md-center">
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
							<img class="d-flex mr-3" width="80" height="80" src="{$dpath}gebaeude/{$buildInfo.buildings['id']}.gif" alt="{$LNG.tech[$buildInfo.buildings['id']]}">
						{else}
							<img class="d-flex mr-3" width="80" height="80" src="#" alt="building placeholder">
						{/if}
						<div class="media-body align-self-center">
							{if $buildInfo.buildings}
								{$LNG.tech[$buildInfo.buildings['id']]} ({$buildInfo.buildings['level']})<br><div class="timer" data-time="{$buildInfo.buildings['timeleft']}">{$buildInfo.buildings['starttime']}</div>{else}{$LNG.ov_free}
							{/if}
						</div>
					</div>
                </div>
              </div>
            </div>
            <!--/.col-->

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
							<img class="d-flex mr-3" width="80" height="80" src="{$dpath}gebaeude/{$buildInfo.tech['id']}.gif" alt="{$LNG.tech[$buildInfo.tech['id']]}">
						{else}
							<img class="d-flex mr-3" width="80" height="80" src="#" alt="building placeholder">
						{/if}
						<div class="media-body align-self-center">
							{if $buildInfo.tech}{$LNG.tech[$buildInfo.tech['id']]} ({$buildInfo.tech['level']})<br><div class="timer" data-time="{$buildInfo.tech['timeleft']}">{$buildInfo.tech['starttime']}</div>{else}{$LNG.ov_free}{/if}
						</div>
					</div>
                </div>
              </div>
            </div>
            <!--/.col-->

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
							<img class="d-flex mr-3" width="80" height="80" src="{$dpath}gebaeude/{$buildInfo.fleet['id']}.gif" alt="{$LNG.tech[$buildInfo.fleet['id']]}">
						{else}
							<img class="d-flex mr-3" width="80" height="80" src="#" alt="building placeholder">
						{/if}
						<div class="media-body align-self-center">
							{if $buildInfo.fleet}{$LNG.tech[$buildInfo.fleet['id']]} ({$buildInfo.fleet['level']})<br><div class="timer" data-time="{$buildInfo.fleet['timeleft']}">{$buildInfo.fleet['starttime']}</div>{else}{$LNG.ov_free}{/if}
						</div>
					</div>
                </div>
              </div>
            </div>
            <!--/.col-->
          </div>
          <!--/.row-->
          <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-primary" role="document">
              <div class="modal-content">
                <div class="modal-header">
                  <h4 class="modal-title">[[PLANETNAME]]</h4>
                  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                  </button>
                </div>
                <div class="modal-body">
					<div class="col-auto">
						<ul class="nav nav-tabs" role="tablist">
							<li class="nav-item">
								<a class="nav-link active" data-toggle="tab" href="#rename" role="tab" aria-controls="rename">Rename Planet</a>
							</li>
							<li class="nav-item">
								<a class="nav-link" data-toggle="tab" href="#delete" role="tab" aria-controls="delete">Delete Planet</a>
							</li>
						</ul>

						<div class="tab-content">
						<div class="tab-pane active" id="rename" role="tabpanel">
							<form action="" method="post" class="form-horizontal">
								<div class="form-group row">
									<label class="col-md-3 col-form-label" for="hf-password">New Name</label>
									<div class="col-md-9">
										<input type="text" id="hf-password" name="hf-password" class="form-control" placeholder="New Name..">
									</div>
								</div>
								<div class="form-group form-actions">
									<button type="submit" class="btn btn-primary"><i class="fa fa-dot-circle-o"></i> Rename Planet</button>
								</div>
							</form>
						</div>
						<div class="tab-pane" id="delete" role="tabpanel">
							
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
    <script src="scripts/game/overview.js"></script>
{/block}