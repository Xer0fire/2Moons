{block name="title" prepend}{$LNG.lm_buildings}{/block}
{block name="content"}
{if !empty($Queue)}
<div class="row">
<div class="col-md-12">
<div class="card border-0">
<div class="card-header">
Queue
<div class="card-actions">
<a href="#" class="btn-minimize" data-toggle="collapse" data-target="#buildingsqueue" aria-expanded="true"><i class="fa fa-chevron-up"></i></a>
</div>
</div>
<div class="card-body collapse show" id="buildingsqueue">
<div id="buildlist" class="buildlist">
	{foreach $Queue as $List}
		{$ID = $List.element}
		<div class="row">
			<div class="col-8">
				{if !($isBusy.research && ($ID == 6 || $ID == 31)) && !($isBusy.shipyard && ($ID == 15 || $ID == 21)) && $RoomIsOk && $CanBuildElement && $BuildInfoList[$ID].buyable}
					<form class="build_form" action="game.php?page=buildings" method="post">
						<input type="hidden" name="cmd" value="insert">
						<input type="hidden" name="building" value="{$ID}">
						<button type="submit" class="build_submit onlist">{$List@iteration}. {$LNG.tech.{$ID}} {$List.level}{if $List.destroy} {$LNG.bd_dismantle}{/if}</button>
					</form>
				{else}
					{$List@iteration}. {$LNG.tech.{$ID}} {$List.level} {if $List.destroy}{$LNG.bd_dismantle}{/if}
				{/if}
				{if $List@first}
				<div id="progressbar" data-time="{$List.resttime}"></div>
			</div>
			<div class="col-4">
				<div id="time" data-time="{$List.time}"><br></div>
				<form action="game.php?page=buildings" method="post" class="build_form">
					<input type="hidden" name="cmd" value="cancel">
					<button type="submit" class="build_submit onlist">{$LNG.bd_cancel}</button>
				</form>
				
				<span style="color:lime" data-time="{$List.endtime}" class="timer">{$List.display}</span>
			</div>
		</div>
		{else}
			</div>
			<div class="col-4">
				<form action="game.php?page=buildings" method="post" class="build_form">
					<input type="hidden" name="cmd" value="remove">
					<input type="hidden" name="listid" value="{$List@iteration}">
					<button type="submit" class="build_submit onlist">{$LNG.bd_cancel}</button>
				</form>
				
				<span style="color:lime" data-time="{$List.endtime}" class="timer">{$List.display}</span>
			</div>
		</div>
		{/if}
	{/foreach}
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
			<a href="game.php?page=research"><i class="fa fa-flask"></i></a>
		  </div>
		</div>
		<div class="card-body" id="buildings">
			{foreach from=$BuildInfoList key=ID item=Element name=List}
				<div class="row">
					<div class="col d-none d-sm-block align-self-center"><img class="img-fluid" src="{$dpath}gebaeude/{$ID}.gif" alt="{$LNG.tech.{$ID}}"/></div>
					<div class="col-sm-10">
						<div class="row content-center">
							<div class="col-sm-8">
								<p class="h5"><a href="#" data-toggle="modal" data-target="#info_{$ID}">{$LNG.tech.{$ID}}</a></p>
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
						<div class="row content-center">
						{foreach $ResourceCost.$ID as $ResID => $ResAmount}
							<div class="col">
								<div class="media">
									<img class="d-flex mr-2 align-self-center" src="{$dpath}images//{$LNG.tech.{$ResID}}.gif">
									<div class="media-body">
										<span class="{if $ResAmount.overflow == 0}text-green{else}text-red{/if}">{$ResAmount.cost|number}</span><br/>
										{$ResAmount.overflow|number}
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
										<button type="button" class="btn btn-success btn-lg mt-1 mt-md-0 dropdown-toggle dropdown-toggle-split" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
											<form action="game.php?page=buildings" method="post" class="btn-block">
												<input type="hidden" name="cmd" value="insert">
												<input type="hidden" name="building" value="{$ID}">
												<button type="submit" class="btn btn-success btn-lg btn-block mt-1 mt-md-0">Improve ({$LNG.bd_lvl} {$Element.levelToBuild+1})</button>
											</form>
											<span class="sr-only">Toggle Dropdown</span>
										</button>
										<div class="dropdown-menu">
											<button type="button" class="btn btn-danger btn-lg btn-block" data-toggle="modal" data-target="#{$LNG.bd_dismantle}_{$ID}">
												{$LNG.bd_dismantle}
											</button>
										</div>
									{else}
										<button type="button" class="btn btn-danger btn-lg mt-1 mt-md-0 dropdown-toggle dropdown-toggle-split" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
												<button type="button" disabled="disabled" class="btn btn-danger btn-lg btn-block mt-1 mt-md-0">Improve ({$LNG.bd_lvl} {$Element.levelToBuild+1})</button>
											<span class="sr-only">Toggle Dropdown</span>
										</button>
										<div class="dropdown-menu">
											<button type="button" class="btn btn-danger btn-lg btn-block" data-toggle="modal" data-target="#{$LNG.bd_dismantle}_{$ID}">
												{$LNG.bd_dismantle}
											</button>
										</div>
									{/if}
								{else}
									<button type="button" class="btn btn-danger btn-lg mt-1 mt-md-0 dropdown-toggle dropdown-toggle-split" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
											<button type="button" disabled="disabled" class="btn btn-danger btn-lg btn-block mt-1 mt-md-0">{$LNG.bd_no_more_fields}</button>
										<span class="sr-only">Toggle Dropdown</span>
									</button>
									<div class="dropdown-menu">
										<button type="button" class="btn btn-danger btn-lg btn-block" data-toggle="modal" data-target="#{$LNG.bd_dismantle}_{$ID}">
											{$LNG.bd_dismantle}
										</button>
									</div>
								{/if}
								</div>
							{/if}
						</div>
					</div>
				</div>
				
				<div class="modal fade" id="info_{$ID}" tabindex="-1" role="dialog" aria-labelledby="info_{$ID}" aria-hidden="true" style="display: none;">
					<div class="modal-dialog modal-info" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h4 class="modal-title">{$LNG.tech.{$ID}}</h4>
								<button type="button" class="close" data-dismiss="modal" aria-label="Close">
								<span aria-hidden="true">×</span>
								</button>
							</div>
							<div class="modal-body">
								{assign var="info" value=$infoObj->show($ID)}
								{assign var="elementID" value=$info.elementID}
								{assign var="productionTable" value=$info.productionTable}
								{assign var="FleetInfo" value=$info.FleetInfo}
								{assign var="gateData" value=$info.gateData}
								{assign var="MissileList" value=$info.MissileList}
								{assign var="CurrentLevel" value=$info.CurrentLevel}
								{include file="page.information.default.tpl"}
							</div>
						</div>
					<!-- /.modal-content -->
					</div>
				<!-- /.modal-dialog -->
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
											<img class="d-flex mr-2 mt-1 align-self-center" src="{$dpath}images//{$LNG.tech.{$ResType}}.gif">
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
{/block}