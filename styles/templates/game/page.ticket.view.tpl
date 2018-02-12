{block name="title" prepend}{$LNG.ti_read} - {$LNG.lm_support}{/block}
{block name="content"}
	<div class="card">
		{foreach $answerList as $answerID => $answerRow}
			{if $answerRow@first}
				<div class="card-header">
					<div class="row">
						<div class="col-9">
							{$LNG.ti_read} :: {$answerRow.subject}
						</div>
						<div class="col-3 align-self-center text-right">
							<span class="badge badge-info">{$categoryList[$answerRow.categoryID]}</span>
						</div>
					</div>
				</div>
				<div class="card-body">
			{/if}
				<div class="row">
					<div class="col">
						{$LNG.ti_msgtime} <b>{$answerRow.time}</b> {$LNG.ti_from} <b>{$answerRow.ownerName}</b>
					</div>
				</div>
				<div class="row">
					<div class="col">
						{$answerRow.message}
					</div>
				</div>
			{if !$answerRow@last}
				<hr/>
			{/if}
			{if $answerRow@last}
				</div>
			{/if}
		{/foreach}
	</div>

	{if $status < 2}
	<form action="game.php?page=ticket&mode=send" method="post" id="form">
		<input type="hidden" name="id" value="{$ticketID}">
		<div class="card">
			<div class="card-header">
				{$LNG.ti_answer}
			</div>
			<div class="card-body">
				<div class="row">
					<div class="col">
						<textarea class="form-control" id="message" name="message" rows="60" cols="8" style="height:100px;"></textarea>
					</div>
				</div>
				<div class="row mt-3">
					<div class="col">
						<input class="btn btn-block btn-success" type="submit" value="{$LNG.ti_submit}">
					</div>
				</div>
			</div>
		</div>
	</form>
	{/if}
{/block}