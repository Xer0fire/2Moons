{block name="title" prepend}{$LNG.lm_alliance}{/block}
{block name="content"}
    <div class="row">
		<div class="col">
			<div class="card">
				<div class="card-header">
					{$al_write_request}
				</div>
				<div class="card-body-container collapse show" id="resources">
					<div class="card-body">
						<form action="game.php?page=alliance&amp;mode=apply&amp;id={$allyid}" method="post">
							<div class="row">
								<div class="col-12">
									<div id="trumbowyg"></div>
								</div>
							</div>
							<div class="row mt-4">
								<div class="col">
									<input class="btn btn-block btn-lg btn-success" value="{$LNG.al_applyform_send}" type="submit">
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
{/block}
{block name="script" append}
	<link href="scripts/base/trumbowyg/ui/trumbowyg.min.css" rel="stylesheet">
	<script type="text/javascript" src="scripts/base/trumbowyg/trumbowyg.min.js"></script>
	<script type="text/javascript">
	$(function() {
		$('#trumbowyg').trumbowyg({
			btns: ['viewHTML','|','strong','em','link','|','fullscreen'],
			autogrow: true
		});
	});
	</script>
{/block}