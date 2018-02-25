{block name="title" prepend}{$LNG.lm_alliance}{/block}
{block name="content"}
	<form name="message" id="message" class="form-horizontal">
		<div class="row form-group">
			<div class="col-4">
				{$LNG.al_diplo_ally}
			</div>
			<div class="col">
				{html_options name="ally_id" class="form-control" values=$IdList output=$AllyList}
			</div>
		</div>
		<div class="row form-group">
			<div class="col-4">
				{$LNG.al_diplo_level_des}
			</div>
			<div class="col">
				{html_options name="level" class="form-control" values=range(1,6) output=$LNG.al_diplo_level selected=$diploMode}
			</div>
		</div>
		<div class="row form-group">
			<div class="col-4">
				{$LNG.al_diplo_text}
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
				<input id="submit" class="btn btn-block btn-success" type="button" onClick="check();" name="button" value="{$LNG.mg_send}">
			</div>
		</div>
	</form>
<script type="text/javascript">
function check(){
	if(document.message.text.value == '') {
		toastr["error"]('{$LNG.mg_empty_text}', '{$LNG.op_error}');
	} else {
		$.getJSON('game.php?page=alliance&mode=admin&action=diplomacyCreateProcessor&ajax=1&'+$('#message').serialize(), function(data) {
			if(!data.error) {
				toastr["success"](data.message+' {$LNG.al_page_reload}', '{$LNG.op_success}');
				window.setTimeout("location.reload()",5000);
			} else {
				toastr["error"](data.message, '{$LNG.op_error}');
			}
		});
		return true;
	}
}
</script>
{/block}