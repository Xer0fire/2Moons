{block name="title" prepend}{$LNG.fcm_info}{/block}
{block name="content"}
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-12 col-md-5">
				<div class="card mt-3 p-4">
					<div class="card-body">
						<img class="img-fluid mb-3" src="styles/resources/img/logo-lg.png"/>
						<p class="text-muted">{$LNG.registerError}</p>
						<p>{$message}</p>
						{if !empty($redirectButtons)}
							{foreach $redirectButtons as $button}
								<a href="{$button.url}" class="btn btn-block btn-info">{$button.label}</a>
							{/foreach}
						{/if}
					</div>
				</div>
			</div>
		</div>
	</div>
{/block}