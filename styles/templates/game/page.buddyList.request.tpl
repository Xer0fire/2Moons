{block name="content"}
	<script type="text/javascript">
		function check(){
			if($('#text').val().length == 0) {
				toastr["error"]('{$LNG.mg_empty_text}',"{$LNG.toastr_error}");
				return false;
			} else {
				$('submit').attr('disabled','disabled');
				$.post('game.php?page=buddyList&mode=send&ajax=1', $('#buddy').serialize(), function(data) {
					toastr["success"](data,"{$LNG.toastr_success}");
					return true;
				}, 'json');
				$('#friendReqModal').modal('hide');
			}
		}
	</script>
	<form name="buddy" id="buddy" action="" class="form-horizontal">
		<input type="hidden" name="id" value="{$id}">
		<div class="row form-group">
			<div class="col-4">
				{$LNG.bu_player}
			</div>
			<div class="col">
				<input class="form-control" disabled="disabled" type="text" name="to" size="40" value="{$username} ">
			</div>
		</div>
		<div class="row form-group">
			<div class="col-4">
				{$LNG.bu_request_text}
				<br/>
				{$LNG.bu_characters}:
				<br/>
				(<span id="cntChars">0</span>&nbsp;/&nbsp;5.000)
			</div>
			<div class="col">
				<textarea class="form-control" name="text" id="text" cols="40" rows="10" onkeyup="$('#cntChars').text($(this).val().length);"></textarea>
			</div>
		</div>
		<div class="row">
			<div class="col">
				<input id="submit" class="btn btn-block btn-success" type="button" onClick="check();" name="button" value="{$LNG.bu_send}">
			</div>
		</div>
	</form>
{/block}