{block name="title" prepend}{$LNG.lm_research}{/block}
{block name="content"}
	{if !empty($Queue)}
	<div class="row">
		<div class="col-md-12">
			<div class="card border-0">
				<div class="card-header">
					{$LNG.lm_queue}
					<div class="card-actions">
					<a href="#" class="btn-minimize" data-toggle="collapse" data-target="#researchqueue" aria-expanded="true"><i class="fa fa-chevron-up"></i></a>
					</div>
				</div>
				<div class="card-body-container collapse show" id="researchqueue">
					<div class="card-body">
						<div id="buildlist" class="buildlist">
							{foreach $Queue as $List}
								{$ID = $List.element}
								<div class="row">
									<div class="col-8 align-self-center">
										{if isset($ResearchList[$List.element])}
											{$CQueue = $ResearchList[$List.element]}
										{/if}
										{if isset($CQueue) && $CQueue.maxLevel != $CQueue.level && !$IsFullQueue && $CQueue.buyable}
											<form action="game.php?page=research" method="post" class="build_form">
												<input type="hidden" name="cmd" value="insert">
												<input type="hidden" name="tech" value="{$ID}">
												<button type="submit" class="build-submit">{$List@iteration}. {$LNG.tech.{$ID}} {$List.level}{if !empty($List.planet)} @ {$List.planet}{/if}</button>
											</form>
										{else}
											{$List@iteration}. {$LNG.tech.{$ID}} {$List.level}{if !empty($List.planet)} @ {$List.planet}{/if}
											{if !$List@first}
												<br/>
												<span style="color:lime" data-time="{$List.endtime}" class="timer">{$List.display}</span>
											{/if}
										{/if}
										{if $List@first}
											{assign var="firstqueuename" value="{$LNG.tech.{$ID}}"}
											{assign var="firstqueuelvl" value="{$List.level}"}
											{assign var="firstqueueresttime" value="{$List.resttime}"}
											<div class="progress">
												<div class="progress-bar progress-bar-striped progress-bar-animated bg-info" role="progressbar" data-time="{$List.resttime}" aria-valuenow="0.01" aria-valuemin="0" aria-valuemax="100"></div>
											</div>
											<span style="color:lime" data-time="{$List.endtime}" class="timer">{$List.display}</span>
									</div>
									<div class="col-4 text-md-center align-self-center">
										<div id="time" data-time="{$List.time}"><br></div>
										<form action="game.php?page=research" method="post" class="build_form">
											<input type="hidden" name="cmd" value="cancel">
											<button type="submit" class="btn btn-warning btn-sm">{$LNG.bd_cancel}</button>
										</form>
									</div>
								</div>
										{else}
									</div>
									<div class="col-4 text-md-center align-self-center">
										<form action="game.php?page=research" method="post" class="build_form">
										<input type="hidden" name="cmd" value="remove">
										<input type="hidden" name="listid" value="{$List@iteration}">
										<button type="submit" class="btn btn-warning btn-sm">{$LNG.bd_cancel}</button>
										</form>
									</div>
								</div>
										{/if}
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
	{if $IsLabinBuild}
	<div class="row">
		<div class="col">
			<div class="alert alert-danger" role="alert">
				{$LNG.bd_building_lab}
			</div>
		</div>
	</div>
	{/if}
	<div class="row">
		<div class="col-md-12">
		  <div class="card border-0">
			<div class="card-header">
			  Research
				<div class="card-actions">
				<a href="game.php?page=resources"><i class="fa fa-leaf"></i></a>
				<a href="game.php?page=buildings"><i class="fa fa-university"></i></a>
			  </div>
			</div>
			<div class="card-body" id="research">
				{assign var="i" value="1" nocache}
				<div class="row">
				{foreach from=$ResearchList key=ID item=Element name=List}
					<div class="col-md-4 mt-3 mb-3">
						<div class="row">
							<div class="col-md-12">
								<div class="build-sprite-comp sprite-{$ID} float-right"></div>
								<div class="row content-center">
									<div class="col">
										<span class="float-sm-right">{if $Element.level > 0} {$LNG.bd_lvl} {$Element.level}{if $Element.maxLevel != 255}/{$Element.maxLevel}{/if}{/if}</span>
										<p class="h5"><a href='#' onclick='info({$ID}, "{$LNG.tech.$ID}")' data-toggle='modal' data-target='#infoModal'>{$LNG.tech.{$ID}}</a></p>
										{$LNG.fgf_time} {$Element.elementTime|time}
									</div>
								</div>
								{foreach $Element.costResources as $RessID => $RessAmount}{/foreach}
								<div class="row">
									<div class="col">Required to improve to level {$Element.levelToBuild+1}:</div>
								</div>
								<div class="row content-center mb-2">
								{foreach $ResourceCost.$ID as $ResID => $ResAmount}
									<div class="col">
										<div class="media">
											<div class="d-flex mr-2 align-self-center res-sprite sprite-{$LNG.sprite.{$ResID}}"></div>
											<div class="media-body">
												<span class="{if $ResAmount.overflow == 0}text-green{else}text-red{/if}">{$ResAmount.cost|number}</span>
											</div>
										</div>
									</div>
								{/foreach}
								</div>
								<div class="row content-center">
									<div class="col">
										{if $Element.maxLevel == $Element.levelToBuild}
											<button type="button" disabled="disabled" class="btn btn-danger btn-lg btn-block mt-1 mt-md-0">{$LNG.bd_maxlevel}</button>
										{elseif $IsLabinBuild || $IsFullQueue || !$Element.buyable}
											<button type="button" disabled="disabled" class="btn btn-danger btn-lg btn-block mt-1 mt-md-0">Improve ({$LNG.bd_lvl} {$Element.levelToBuild+1})</button>
										{else}
											<form action="game.php?page=research" method="post" class="btn-block">
												<input type="hidden" name="cmd" value="insert">
												<input type="hidden" name="tech" value="{$ID}">
												<button type="submit" class="btn btn-success btn-lg btn-block mt-1 mt-md-0">Improve ({$LNG.bd_lvl} {$Element.levelToBuild+1})</button>
											</form>
										{/if}
									</div>
								</div>
							</div>
						</div>
					</div>

					{if ($i % 3 == 0) }
						</div>
						<div class="row">
					{/if}
					{$i = $i + 1}

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
{block name="script" append}
    {if !empty($Queue)}
        <script src="scripts/game/research.js"></script>
    {/if}
{/block}