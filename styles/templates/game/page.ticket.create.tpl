{block name="title" prepend}{$LNG.ti_create_head} - {$LNG.lm_support}{/block}
{block name="content"}
	<div class="card">
		<div class="card-header">
			{$LNG.ti_create_head}
		</div>
		<div class="card-body">
			<form action="game.php?page=ticket&mode=send" method="post" id="form">
				<input type="hidden" name="id" value="0">
				<div class="row">
					<div class="col-12 col-md-4 align-self-center">
						<label for="category">{$LNG.ti_category}</label>
					</div>
					<div class="col-12 col-md-8">
						<select class="form-control" id="category" name="category">{html_options options=$categoryList}</select>
					</div>
				</div>
				<div class="row mt-2">
					<div class="col-12 col-md-4 align-self-center">
						<label for="subject">{$LNG.ti_subject}</label>
					</div>
					<div class="col-12 col-md-8">
						<input class="form-control" type="text" id="subject" name="subject" size="40" maxlength="255">
					</div>
				</div>
				<div class="row mt-2">
					<div class="col-12 col-md-4 align-self-center">
						<label for="message">{$LNG.ti_message}</label>
					</div>
					<div class="col-12 col-md-8">
						<textarea class="form-control" id="message" name="message" row="60" cols="8" style="height:100px;"></textarea>
					</div>
				</div>
				<div class="row mt-3">
					<div class="col">
						<input class="btn btn-block btn-success" type="submit" value="{$LNG.ti_submit}">
					</div>
				</div>
			</form>
		</div>
	</div>
{/block}