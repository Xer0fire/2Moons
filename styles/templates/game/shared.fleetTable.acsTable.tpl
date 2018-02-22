<form action="?page=fleetTable&amp;action=acs" method="post">
<input name="fleetID" value="{$acsData.mainFleetID}" type="hidden">
<div class="row">
	<div class="col-12">
		<div class="card">
			<div class="card-header">
				ACS <span id="acsName">{$acsData.acsName}</span> (<a href="javascript:Rename();">{$LNG.fl_acs_change}</a>)
			</div>
			<div class="card-body-container">
				<div class="card-body">
					{if !empty($acsData.statusMessage)}
					<div class="row">
						<div class="col">
							{$acsData.statusMessage}
						</div>
					</div>
					{/if}
					<div class="row">
						<div class="col-12 col-md-6">
							<div class="row">
								<div class="col">
									{$LNG.fl_members_invited}
								</div>
							</div>
							<div class="row">
								<div class="col">
									<select class="form-control" size="5">
										{html_options options=$acsData.invitedUsers}
									</select>
								</div>
							</div>
						</div>
						<div class="col-12 col-md-6">
							<div class="row">
								<div class="col">
									{$LNG.fl_invite_members}
								</div>
							</div>
							<div class="row">
								<div class="col">
									<input class="form-control" name="username" type="text">
								</div>
							</div>
							<div class="row">
								<div class="col">
									<button class="btn btn-lg btn-block btn-success mt-2" type="submit">{$LNG.fl_continue}</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</form>

<script type="text/javascript">
function Rename(){
	var Name = prompt("{$LNG.fl_acs_change_name}", "{$acsData.acsName}");
	$.getJSON('?page=fleetTable&action=acs&fleetID={$acsData.mainFleetID}&acsName='+Name, function(data) {
		if(data != "") {
			alert(data);
			return;
		}
		$('#acsName').text(Name);
	});
}
</script>