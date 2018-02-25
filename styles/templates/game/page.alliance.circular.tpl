{block name="title" prepend}{$LNG.lm_alliance}{/block}
{block name="content"}
	<script type="text/javascript">
		function check(){
			if($('#text').val().length == 0) {
				toastr["error"]('{$LNG.mg_empty_text}',"{$LNG.toastr_error}");
				return false;
			} else {
				$('submit').attr('disabled','disabled');
				$.post('game.php?page=alliance&mode=circular&action=send&ajax=1', $('#message').serialize(), function(data) {
					toastr["success"]("{$LNG.mg_msg_sended}","{$LNG.toastr_success}");
					return true;
				}, 'json');
				$('#messageModal').modal('hide');
			}
		}
	</script>
	<form name="message" id="message" action="" class="form-horizontal">
		<div class="row form-group">
			<div class="col-4">
				{$LNG.al_receiver}
			</div>
			<div class="col">
				{html_options class="form-control" name=rankID options=$RangeList}
			</div>
		</div>
		<div class="row form-group">
			<div class="col-4">
				{$LNG.mg_subject}
			</div>
			<div class="col">
				<input class="form-control" type="text" name="subject" id="subject" size="40" maxlength="40" value="{if !empty($subject)}{$subject}{else}{$LNG.mg_no_subject}{/if}">
			</div>
		</div>
		<div class="row form-group">
			<div class="col-4">
				{$LNG.mg_message}
				<br/>
				{$LNG.mg_characters}:
				<br/>
				(<span id="cntChars">0</span>&nbsp;/&nbsp;5.000)
			</div>
			<div class="col">
				<textarea class="form-control" name="text" id="text" cols="40" rows="10" onkeyup="$('#cntChars').text($(this).val().length);"></textarea>
			</div>
		</div>
		<div class="row">
			<div class="col">
				<input id="submit" class="btn btn-block btn-success" type="button" onClick="check();" name="button" value="{$LNG.al_circular_send_submit}">
			</div>
		</div>
	</form>
{/block}