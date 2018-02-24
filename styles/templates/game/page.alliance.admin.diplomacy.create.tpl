{block name="title" prepend}{$LNG.lm_alliance}{/block}
{block name="content"}
<form name="message" id="message">
	<table style="width:95%">
	<tr>
		<th colspan="2">{$LNG.al_circular_send_ciruclar}</th>
	</tr>
	<tr>
		<td>{$LNG.al_diplo_ally}</td>
		<td>{html_options name="ally_id" values=$IdList output=$AllyList}</td>
	</tr>
	<tr>
		<td>{$LNG.al_diplo_level_des}</td>
		<td>{html_options name="level" values=range(1,6) output=$LNG.al_diplo_level selected=$diploMode}</td>
	</tr>
	<tr>
		<td>{$LNG.al_diplo_text}<br>(<span id="cntChars">0</span> / 5000 {$LNG.al_characters})</td>
		<td>
			<textarea name="text" cols="60" rows="10" onkeyup="$('#cntChars').text($(this).val().length);"></textarea>
		</td>
	</tr>
	<tr>
		<th colspan="2" style="text-align:center;">
		<input type="reset" value="{$LNG.al_circular_reset}">
		<input type="button" onclick="check();" value="{$LNG.al_circular_send_submit}">
		</th>
	</tr>
	</table>
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