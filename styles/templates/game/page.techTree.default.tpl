{block name="title" prepend}{$LNG.lm_technology}{/block}
{block name="content"}
	<div class="row">
		<div id="accordion" role="tablist">
			{foreach $TechTreeList as $elementID => $requireList}
					{if !is_array($requireList)}
						</div>
						</div>
						</div>
						<div class="card">
						<div class="card-header" role="tab" id="{$elementID}">
							<a data-toggle="collapse" href="#{$elementID}-{$LNG.tech.$requireList}" aria-expanded="true" aria-controls="{$elementID}-{$LNG.tech.$requireList}">{$LNG.tech.$requireList}</a>
						</div>
						<div id="{$elementID}-{$LNG.tech.$requireList}" class="collapse" role="tabpanel" aria-labelledby="{$elementID}" data-parent="#accordion">
						<div class="card-body">
					{else}
						<div class="row">
							<div class="col-4 col-xl-2 d-none d-sm-block align-self-center"><div class="mx-auto build-sprite sprite-{$elementID}"></div></div>
							<div class="col-sm-4">
								<a href='#' onclick='info({$elementID}, "{$LNG.tech.$elementID}")' data-toggle='modal' data-target='#infoModal'>{$LNG.tech.{$elementID}}</a>
							</div>
							<div class="col-sm-4">
								{if $requireList}
									{foreach $requireList as $requireID => $NeedLevel}
										<a href='#' onclick='info({$requireID}, "{$LNG.tech.$requireID}")' data-toggle='modal' data-target='#infoModal'><span style="color:{if $NeedLevel.own < $NeedLevel.count}red{else}lime{/if};">{$LNG.tech.$requireID} ({$LNG.tt_lvl} {min($NeedLevel.count, $NeedLevel.own)}/{$NeedLevel.count})</span></a>{if !$NeedLevel@last}<br>{/if}
									{/foreach}
								{/if}
							</div>
						</div>
						<hr/>
					{/if}
			{/foreach}
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