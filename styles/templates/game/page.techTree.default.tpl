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
							<a href="#" onclick="return Dialog.info({$elementID})">{$LNG.tech.$elementID}</a>
						</div>
						<div class="col-sm-4">
							{if $requireList}
								{foreach $requireList as $requireID => $NeedLevel}
									<a href="#" onclick="return Dialog.info({$elementID})"><span style="color:{if $NeedLevel.own < $NeedLevel.count}red{else}lime{/if};">{$LNG.tech.$requireID} ({$LNG.tt_lvl} {min($NeedLevel.count, $NeedLevel.own)}/{$NeedLevel.count})</span></a>{if !$NeedLevel@last}<br>{/if}
								{/foreach}
							{/if}
						</div>
					</div>
					<hr/>
				{/if}
		{/foreach}
	</div>
</div>
{/block}