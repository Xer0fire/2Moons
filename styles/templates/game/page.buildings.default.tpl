{block name="title" prepend}{$LNG.lm_buildings}{/block}
{block name="content"}
	{if !empty($Queue)}
	<div class="row">
		<div class="col-md-12">
			<div class="card border-0">
				<div class="card-header">
					{$LNG.lm_queue}
					<div class="card-actions">
					<a href="#" class="btn-minimize" data-toggle="collapse" data-target="#buildingsqueue" aria-expanded="true"><i class="fa fa-chevron-up"></i></a>
					</div>
				</div>
				<div class="card-body-container collapse show" id="buildingsqueue">
					<div class="card-body">
						<div id="buildlist" class="buildlist">
							{foreach $Queue as $List}
								{$ID = $List.element}
								<div class="row">
									<div class="col-8 align-self-center">
										{if !($isBusy.research && ($ID == 6 || $ID == 31)) && !($isBusy.shipyard && ($ID == 15 || $ID == 21)) && $RoomIsOk && $CanBuildElement && $BuildInfoList[$ID].buyable}
											<form class="build_form" action="game.php?page=buildings" method="post">
												<input type="hidden" name="cmd" value="insert">
												<input type="hidden" name="building" value="{$ID}">
												<button type="submit" class="build-submit">{$List@iteration}. {$LNG.tech.{$ID}} {$List.level}
													{if $List.destroy}
														{$LNG.bd_dismantle}
													{/if}
												</button>
											</form>
											<span style="color:lime" data-time="{$List.endtime}" class="timer">{$List.display}</span>
										{else}
											{$List@iteration}. {$LNG.tech.{$ID}} {$List.level} {if $List.destroy}{$LNG.bd_dismantle}{/if}
											<br/>
											<span style="color:lime" data-time="{$List.endtime}" class="timer">{$List.display}</span>
										{/if}
										{if $List@first}
											{assign var="firstqueuename" value="{$LNG.tech.{$ID}}"}
											{assign var="firstqueuelvl" value="{$List.level}"}
											{assign var="firstqueueresttime" value="{$List.time}"}
											<div class="progress">
												<div class="progress-bar progress-bar-striped progress-bar-animated bg-info" role="progressbar" data-time="{$List.resttime}" aria-valuenow="0.01" aria-valuemin="0" aria-valuemax="100"></div>
											</div>
									</div>
									<div class="col-4 text-md-center align-self-center">
										<div id="time" data-time="{$List.time}"><br></div>
										<form action="game.php?page=buildings" method="post" class="build_form">
											<input type="hidden" name="cmd" value="cancel">
											<button type="submit" class="btn btn-warning btn-sm">{$LNG.bd_cancel}</button>
										</form>
									</div>
										{else}
									</div>
									<div class="col-4 text-md-center align-self-center">
										<form action="game.php?page=buildings" method="post" class="build_form">
											<input type="hidden" name="cmd" value="remove">
											<input type="hidden" name="listid" value="{$List@iteration}">
											<button type="submit" class="btn btn-warning btn-sm">{$LNG.bd_cancel}</button>
										</form>
									</div>
										{/if}
								</div>
								{if !$List@last}
									<hr/>
								{/if}
							{/foreach}
						</div>
					</div>
				</div>
					<div class="card-footer">
						<div class="row">
							<div class="col-12 text-center">
								{$firstqueuename} ({$firstqueuelvl}) <div id="timequeue" class="d-inline-block" data-time="{$firstqueueresttime}"></div>
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
			  Buildings
				<div class="card-actions">
				<a href="game.php?page=resources"><i class="fa fa-leaf"></i></a>
				{if isModuleAvailable($smarty.const.MODULE_RESEARCH) && $navResearch > 0}
				<a href="game.php?page=research"><i class="fa fa-flask"></i></a>
				{/if}
			  </div>
			</div>
			<div class="card-body" id="buildings">
				{foreach from=$BuildInfoList key=ID item=Element name=List}
					<div class="row">
						<div class="col-4 col-xl-2 d-none d-sm-block align-self-center"><div class="mx-auto build-sprite sprite-{$ID}"></div></div>
						<div class="col-12 col-sm-8 col-xl-10">
							<div class="row content-center">
								<div class="col-sm-8">
									<p class="h5"><a href='#' onclick='info({$ID}, "{$LNG.tech.$ID}")' data-toggle='modal' data-target='#infoModal'>{$LNG.tech.{$ID}}</a></p>
								</div>
								<div class="col-sm-4">
									<span class="float-sm-right">{if $Element.level > 0} {$LNG.bd_lvl} {$Element.level}{if $Element.maxLevel != 255}/{$Element.maxLevel}{/if}{/if}</span>
								</div>
							</div>
							<div class="row">
								<div class="col-sm-8">{$LNG.fgf_time} {$Element.elementTime|time} {if !empty($Element.infoEnergy)}</br> {$LNG.bd_next_level} {$Element.infoEnergy}{/if}</div>
							</div>
							<div class="row">
								<div class="col d-none d-md-block">
									{$LNG.shortDescription.{$ID}}
								</div>
							</div>
							<hr/>
							<div class="row">
								<div class="col-sm-12">Required to improve to level {$Element.levelToBuild+1}:</div>
							</div>
							{foreach $Element.costResources as $RessID => $RessAmount}{/foreach}
							<div class="row content-center mb-2">
							{foreach $ResourceCost.$ID as $ResID => $ResAmount}
								<div class="col">
									<div class="media">
										<div class="d-flex mr-2 align-self-center res-sprite sprite-{$LNG.sprite.{$ResID}}"></div>
										<div class="media-body">
											<span class="{if $ResAmount.overflow == 0}text-green{else}text-red{/if}">{$ResAmount.cost|number}</span><br/>
											{if $ResAmount.overflow != 0}{$ResAmount.overflow|number}{/if}
										</div>
									</div>
								</div>
							{/foreach}
							</div>
							<div class="row content-center">
								{if $Element.maxLevel == $Element.levelToBuild}
									<div class="col btn-group">
										<button type="button" class="btn btn-danger btn-lg mt-1 mt-md-0 dropdown-toggle dropdown-toggle-split" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
												<button type="button" disabled="disabled" class="btn btn-danger btn-lg btn-block mt-1 mt-md-0">{$LNG.bd_maxlevel}</button>
											<span class="sr-only">Toggle Dropdown</span>
										</button>
										<div class="dropdown-menu">
											<button type="button" class="btn btn-danger btn-lg btn-block" data-toggle="modal" data-target="#{$LNG.bd_dismantle}_{$ID}">
												{$LNG.bd_dismantle}
											</button>
										</div>
									</div>
								{elseif ($isBusy.research && ($ID == 6 || $ID == 31)) || ($isBusy.shipyard && ($ID == 15 || $ID == 21))}
									<div class="col">
										<button type="button" disabled="disabled" class="btn btn-danger btn-lg btn-block mt-1 mt-md-0">{$LNG.bd_working}</button>
									</div>
								{else}
									{if $RoomIsOk}
										<div class="col btn-group">
										{if $CanBuildElement && $Element.buyable}
											{if $Element.levelToBuild != 0 && ($Element.level != 0 || $Element.inQueue == FALSE) }
												<button type="button" class="btn btn-success btn-lg mt-1 mt-md-0 dropdown-toggle dropdown-toggle-split" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
											{else}
												<span class="w-100">
											{/if}
												<form action="game.php?page=buildings" method="post" class="btn-block">
													<input type="hidden" name="cmd" value="insert">
													<input type="hidden" name="building" value="{$ID}">
													<button type="submit" class="btn btn-success btn-lg btn-block mt-1 mt-md-0">Improve ({$LNG.bd_lvl} {$Element.levelToBuild+1})</button>
												</form>
											{if $Element.levelToBuild != 0 && ($Element.level != 0 || $Element.inQueue == FALSE) }
												<span class="sr-only">Toggle Dropdown</span>
												</button>
												<div class="dropdown-menu">
													<button type="button" class="btn btn-danger btn-lg btn-block" data-toggle="modal" data-target="#{$LNG.bd_dismantle}_{$ID}">
														{$LNG.bd_dismantle}
													</button>
												</div>
											{else}
												<span>
											{/if}
										{else}
											{if $Element.levelToBuild != 0 && ($Element.level != 0 || $Element.inQueue == FALSE) }
												<button type="button" class="btn btn-danger btn-lg mt-1 mt-md-0 dropdown-toggle dropdown-toggle-split" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
											{else}
												<span class="w-100">
											{/if}
													<button type="button" disabled="disabled" class="btn btn-danger btn-lg btn-block mt-1 mt-md-0">Improve ({$LNG.bd_lvl} {$Element.levelToBuild+1})</button>
											{if $Element.levelToBuild != 0 && ($Element.level != 0 || $Element.inQueue == FALSE) }
												<span class="sr-only">Toggle Dropdown</span>
											</button>
												<div class="dropdown-menu">
													<button type="button" class="btn btn-danger btn-lg btn-block" data-toggle="modal" data-target="#{$LNG.bd_dismantle}_{$ID}">
														{$LNG.bd_dismantle}
													</button>
												</div>
											{else}
												</span>
											{/if}
										{/if}
									{else}
										{if $Element.levelToBuild != 0 && ($Element.level != 0 || $Element.inQueue == FALSE) }
											<button type="button" class="btn btn-danger btn-lg mt-1 mt-md-0 dropdown-toggle dropdown-toggle-split" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
										{else}
											<span class="w-100">
										{/if}
												<button type="button" disabled="disabled" class="btn btn-danger btn-lg btn-block mt-1 mt-md-0">{$LNG.bd_no_more_fields}</button>
										{if $Element.levelToBuild != 0 && ($Element.level != 0 || $Element.inQueue == FALSE) }
											<span class="sr-only">Toggle Dropdown</span>
										</button>
											<div class="dropdown-menu">
												<button type="button" class="btn btn-danger btn-lg btn-block" data-toggle="modal" data-target="#{$LNG.bd_dismantle}_{$ID}">
													{$LNG.bd_dismantle}
												</button>
											</div>
										{else}
											</span>
										{/if}
									{/if}
									</div>
								{/if}
							</div>
						</div>
					</div>

					<div class="modal fade" id="{$LNG.bd_dismantle}_{$ID}" tabindex="-1" role="dialog" aria-labelledby="{$LNG.bd_dismantle}_{$ID}" aria-hidden="true">
						<div class="modal-dialog modal-danger" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<h4 class="modal-title">{$LNG.bd_dismantle} {$LNG.tech.{$ID}} ({$Element.level})</h4>
									<button type="button" class="close" data-dismiss="modal" aria-label="Close">
									<span aria-hidden="true">×</span>
									</button>
								</div>
								<div class="modal-body">
									<div class="row">
										<div class="col">
											{$LNG.bd_price_for_destroy}
										</div>
									</div>
									<div class="row">
									{foreach $Element.destroyResources as $ResType => $ResCount}
										<div class="col">
											<div class="media">
												<div class="d-flex mr-2 mt-1 align-self-center res-sprite sprite-{$LNG.sprite.{$ResType}}"></div>
												<div class="media-body">
													<span class="{if empty($Element.destroyOverflow[$RessID])}text-green{else}text-red{/if}">{$ResCount|number}</span>
												</div>
											</div>
										</div>
									{/foreach}
									</div>
									<div class="row">
										<div class="col">
											{$LNG.bd_destroy_time} {$Element.destroyTime|time}
										</div>
									</div>
								</div>
								<div class="modal-footer">
									<form action='game.php?page=buildings' method='post' class='build_form'>
										<input type='hidden' name='cmd' value='destroy'>
										<input type='hidden' name='building' value='{$ID}'>
										<button type='submit' class='btn btn-danger'>{$LNG.bd_dismantle}</button>
									</form>
								</div>
							</div>
						<!-- /.modal-content -->
						</div>
					<!-- /.modal-dialog -->
					</div>

					{if !$smarty.foreach.List.last}
						<hr/>
					{/if}
				{/foreach}
				</div>
			</div>
		</div>
	</div>

	<div class="modal fade" id="infoModal" tabindex="-1" role="dialog" aria-labelledby="infoModal" style="display: none;" aria-hidden="true">
		<div class="modal-dialog modal-primary modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title"></h4>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div id="infoModalBody" class="modal-body"></div>
			</div>
		</div>
	</div>
{/block}