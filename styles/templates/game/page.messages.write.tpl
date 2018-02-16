{block name="content"}
	<script type="text/javascript">
		function check(){
			if($('#text').val().length == 0) {
				toastr["error"]('{$LNG.mg_empty_text}');
				return false;
			} else {
				$('submit').attr('disabled','disabled');
				$.post('game.php?page=messages&mode=send&id={$id}&ajax=1', $('#message').serialize(), function(data) {
					toastr["success"](data);
					return true;
				}, 'json');
				$('#messageModal').modal('hide');
			}
		}
	</script>
	<form name="message" id="message" action="">
		<div class="row">
			<div class="col">
				{$LNG.mg_send_to}
			</div>
			<div class="col">
				<input type="text" name="to" size="40" value="{$OwnerRecord.username} [{$OwnerRecord.galaxy}:{$OwnerRecord.system}:{$OwnerRecord.planet}]">
			</div>
		</div>
		<div class="row">
			<div class="col">
				{$LNG.mg_subject}
			</div>
			<div class="col">
				<input type="text" name="subject" id="subject" size="40" maxlength="40" value="{if !empty($subject)}{$subject}{else}{$LNG.mg_no_subject}{/if}">
			</div>
		</div>
		<div class="row">
			<div class="col">
				{$LNG.mg_message}
				<br/>
				(<span id="cntChars">0</span>&nbsp;/&nbsp;5.000&nbsp;{$LNG.mg_characters})
			</div>
			<div class="col">
				<textarea name="text" id="text" cols="40" rows="10" onkeyup="$('#cntChars').text($(this).val().length);"></textarea>
			</div>
		</div>
		<div class="row">
			<div class="col">
				<input id="submit" class="btn btn-block btn-success" type="button" onClick="check();" name="button" value="{$LNG.mg_send}">
			</div>
		</div>
	</form>
{/block}