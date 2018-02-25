{block name="title" prepend}{$LNG.lm_alliance}{/block}
{block name="content"}
	<div class="card">
		<div class="card-header">
			{$LNG.al_diplo_head}
			<div class="card-actions">
				<a href="#" class="btn-minimize" data-toggle="collapse" data-target="#alliance-man-diplo" aria-expanded="true"><i class="fa fa-chevron-up"></i></a>
			</div>
		</div>
		<div class="card-body-container collapse show" id="alliance-man-diplo">
			<div class="card-body">
				{foreach from=$diploList.0 key=diploMode item=diploAlliances name=List}
					<div class="row{if !$smarty.foreach.List.first} mt-3{/if}">
						<div class="col-12">
							{$LNG.al_diplo_level.$diploMode}
						</div>
					</div>
					{foreach $diploAlliances as $diploID}
						<div class="row">
							{if $diploMode == 5}
								{if $diploID.own == true}
									<div class="col-10">
										{$diploID.name}
									</div>
									<div class="col-2">
										<a href="game.php?page=alliance&amp;mode=admin&amp;action=diplomacyDelete&amp;id={$diploID.id}" onclick="return confirm('{$LNG.al_diplo_confirm_delete}');">
											<i class="fa fa-times text-red"></i>
										</a>
									</div>
								{else}
									<div class="col-12">
										{$diploID.name}
									</div>
								{/if}
							{else}
								<div class="col-10">
									{$diploID.name}
								</div>
								<div class="col-2">
									<a href="game.php?page=alliance&amp;mode=admin&amp;action=diplomacyDelete&amp;id={$diploID.id}" onclick="return confirm('{$LNG.al_diplo_confirm_delete}');">
										<i class="fa fa-times text-red"></i>
									</a>
								</div>
							{/if}
						</div>
					{foreachelse}
						<div class="row">
							<div class="col-12">
								{$LNG.al_diplo_no_entry}
							</div>
						</div>
					{/foreach}
					<div class="row">
						<div class="col-12">
							<a href="#" onclick="diplomacyCreate({$diploMode})" data-toggle="modal" data-target="#admindiplomacyModal">{$LNG.al_diplo_create}</a>
						</div>
					</div>
				{/foreach}
			</div>
		</div>
		<div class="card-footer">
			<a href="game.php?page=alliance&amp;mode=admin">{$LNG.al_back}</a>
		</div>
	</div>

	<div class="card">
		<div class="card-header">
			{$LNG.al_diplo_accept}
		</div>
		<div class="card-body-container">
			<div class="card-body">
				{if array_filter($diploList.1)}
					{foreach from=$diploList.1 key=diploMode item=diploAlliances name=List}
						{if !empty($diploAlliances)}
							<div class="row{if !$smarty.foreach.List.first} mt-3{/if}">
								<div class="col-12">
									{$LNG.al_diplo_level.$diploMode}
								</div>
							</div>
							{foreach $diploAlliances as $diploID => $diploName}
								<div class="row">
									<div class="col-10">
										{$diploName}
									</div>
									<div class="col-2">
										<a href="game.php?page=alliance&amp;mode=admin&amp;action=diplomacyAccept&amp;id={$diploID}" onclick="return confirm('{$LNG.al_diplo_accept_yes_confirm}');">
											<i class="fa fa-check text-green"></i>
										</a>
										<a href="game.php?page=alliance&amp;mode=admin&amp;action=diplomacyDelete&amp;id={$diploID}" onclick="return confirm('{$LNG.al_diplo_accept_no_confirm}');">
											<i class="fa fa-times text-red"></i>
										</a>
									</div>
								</div>
							{/foreach}
						{/if}
					{/foreach}
				{else}
					<div class="row">
						<div clas="col-12">
							{$LNG.al_diplo_no_accept}
						</div>
					</div>
				{/if}
			</div>
		</div>
	</div>

	<div class="card">
		<div class="card-header">
			{$LNG.al_diplo_accept_send}
		</div>
		<div class="card-body-container">
			<div class="card-body">
				{counter start=0 print=false assign=count}
				{if array_filter($diploList.2)}
					{foreach from=$diploList.2 key=diploMode item=diploAlliances name=List}
						{if !empty($diploAlliances)}
							<div class="row{if count != 0} mt-3{/if}">
								<div class="col-12">
									{$LNG.al_diplo_level.$diploMode}
								</div>
							</div>
							{foreach $diploAlliances as $diploID => $diploName}
								<div class="row">
									<div class="col-10">
										{$diploName}
									</div>
									<div class="col-2">
										<a href="game.php?page=alliance&amp;mode=admin&amp;action=diplomacyDelete&amp;id={$diploID}" onclick="return confirm('{$LNG.al_diplo_accept_no_confirm}');">
											<i class="fa fa-times text-red"></i>
										</a>
									</div>
								</div>
							{/foreach}
							{counter print=false}
						{/if}
					{/foreach}
				{else}
					<div class="row">
						<div clas="col-12">
							{$LNG.al_diplo_no_accept}
						</div>
					</div>
				{/if}
			</div>
		</div>
	</div>

	<div class="modal fade" id="admindiplomacyModal" tabindex="-1" role="dialog" aria-labelledby="admindiplomacy" style="display: none;" aria-hidden="true">
		<div class="modal-dialog modal-primary" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title">{$LNG.al_diplo_create_pact}</h4>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div id="admindiplomacyBody" class="modal-body"></div>
			</div>
		</div>
	</div>
{/block}
{block name="script" append}
	<script type"text/javascript">
		function diplomacyCreate(Mode) {
			$.ajax({
				url: "game.php?page=alliance&mode=admin&action=diplomacyCreate&diploMode="+Mode, 
				success: function(data){
					$('#admindiplomacyBody').empty();
					$('#admindiplomacyBody').append(data);
				}
			});
		}
	</script>
{/block}