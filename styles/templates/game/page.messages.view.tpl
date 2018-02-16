{block name="content"}
	<form action="game.php?page=messages" method="post">
		<input type="hidden" name="mode" value="action">
		<input type="hidden" name="ajax" value="1">
		<input type="hidden" name="messcat" value="{$MessID}">
		<input type="hidden" name="side" value="{$page}">
		<div class="row">
			<div class="col">
				{$LNG.mg_page}: {if $page != 1}<a href="#" onclick="Message.getMessages({$MessID}, {$page - 1});return false;">&laquo;</a>&nbsp;{/if}{for $site=1 to $maxPage}<a href="#" onclick="Message.getMessages({$MessID}, {$site});return false;">{if $site == $page}<b>[{$site}]</b>{else}[{$site}]{/if}</a>{if $site != $maxPage}&nbsp;{/if}{/for}{if $page != $maxPage}&nbsp;<a href="#" onclick="Message.getMessages({$MessID}, {$page + 1});return false;">&raquo;</a>{/if}
			</div>
		</div>
		{if $MessID != 999}
			<div class="row">
				<div class="col">
						<select name="actionTop">
							<option value="readmarked">{$LNG.mg_read_marked}</option>
							<option value="readtypeall">{$LNG.mg_read_type_all}</option>
							<option value="readall">{$LNG.mg_read_all}</option>
							<option value="deletemarked">{$LNG.mg_delete_marked}</option>
							<option value="deleteunmarked">{$LNG.mg_delete_unmarked}</option>
							<option value="deletetypeall">{$LNG.mg_delete_type_all}</option>
							<option value="deleteall">{$LNG.mg_delete_all}</option>
						</select>
						<input value="{$LNG.mg_confirm}" type="submit" name="submitTop">
				</div>
			</div>
		{/if}

		{foreach from=$MessageList key=ID item=Message name=List}
			<div id="envelope"{if $smarty.foreach.List.first} class="mt-3"{/if}>
				<div id="messagehead_{$Message.id}" class="row">
					{if $MessID != 999}
						<div class="col-2 align-self-center">
							<input class="form-check" name="messageID[{$Message.id}]" value="1" type="checkbox">
						</div>
					{/if}
					<div class="ml-md-auto text-right col-9 text-md-left col-md-auto align-self-center">
						<i class="fa fa-paperclip"></i> {$Message.time}
					</div>
				</div>
				<div class="row">
					<div class="col-12 col-md-auto">
						<span class="title">{if $MessID != 999}{$LNG.mg_from}{else}{$LNG.mg_to}{/if} :</span>
						{$Message.from}
					</div>
					<div class="col-12 ml-md-auto col-md-auto">
						<span class="title">{$LNG.mg_subject} :</span>
						{$Message.subject}
						{if $Message.type == 1 && $MessID != 999}
							<a href="#" onclick="PM({$Message.sender},Message.CreateAnswer('{$Message.subject}'));" title="{$LNG.mg_answer_to} {strip_tags($Message.from)}" data-toggle="modal" data-target="#messageModal"><i class="fa fa-envelope"></i></a>
						{/if}
					</div>
				</div>
				<div class="row mt-2">
					<div id="messagebody_{$Message.id}" class="col">
						{$Message.text}
					</div>
				</div>
			</div>
			{if !$smarty.foreach.List.last}
				<hr/>
			{/if}
		{/foreach}
	</form>
{/block}