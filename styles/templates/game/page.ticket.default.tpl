{block name="title" prepend}{$LNG.lm_support}{/block}
{block name="content"}
	<div class="card">
		<div class="card-header">
			<div class="row">
				<div class="col">
					{$LNG.ti_header}
				</div>
				<div class="col align-self-center text-right">
					<a class="btn btn-sm btn-success" href="game.php?page=ticket&amp;mode=create">{$LNG.ti_new}</a>
				</div>
			</div>
		</div>
		<div class="card-body p-0">
			<div class="row">
				<div class="col">
				<div class="table-responsive">
					<table class="table table-striped table-sm">
						<tr>
							<th>{$LNG.ti_id}</td>
							<th>{$LNG.ti_subject}</td>
							<th>{$LNG.ti_status}</td>
							<th>{$LNG.ti_answers}</td>
							<th>{$LNG.ti_date}</td>
						</tr>
						{foreach $ticketList as $TicketID => $TicketInfo}	
						<tr>
							<td><a href="game.php?page=ticket&amp;mode=view&amp;id={$TicketID}">#{$TicketID}</a></td>
							<td><a href="game.php?page=ticket&amp;mode=view&amp;id={$TicketID}">{$TicketInfo.subject}</a></td>
							<td>{if $TicketInfo.status == 0}<span class="text-green">{$LNG.ti_status_open}</span>{elseif $TicketInfo.status == 1}<span class="text-orange">{$LNG.ti_status_answer}</span>{else}<span class="text-red">{$LNG.ti_status_closed}</span>{/if}</td>
							<td>{$TicketInfo.answer - 1}</td>
							<td>{$TicketInfo.time}</td>
						</tr>
						{/foreach}
					</table>
				</div>
				</div>
			</div>
		</div>
	</div>
{/block}