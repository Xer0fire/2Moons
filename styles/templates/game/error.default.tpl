{block name="title" prepend}{$LNG.fcm_info}{/block}
{block name="content"}
<div class="row">
	<div class="col">
		<div class="alert alert-info" role="alert">
			<h4 class="alert-heading">{$LNG.fcm_info}</h4>
			<p>{$message}</p>
			{if !empty($redirectButtons)}
				<hr><p class="mb-0">{foreach $redirectButtons as $button}<a href="{$button.url}"><button>{$button.label}</button></a>{/foreach}</p>
			{/if}
		</div>
	</div>
</div>
{/block}