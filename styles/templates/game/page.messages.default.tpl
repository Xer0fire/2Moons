{block name="title" prepend}{$LNG.lm_messages}{/block}
{block name="content"}
<div class="card">
	<div class="card-header">
		{$LNG.mg_message_title} <span id="loading" style="display:none;"> ({$LNG.loading})</span>
	</div>
	<div class="card-body">
		<div class="row">
			<div class="col-12 col-md-4">
				<nav>
					<ul class="nav mail-nav">
						{foreach $CategoryList as $CategoryID => $CategoryRow}
							<li class="nav-item">
								<a style="color:{$CategoryRow.color};" class="nav-link" href="#" onclick="Message.getMessages({$CategoryID});return false;"><i class="fa fa-inbox"></i> {$LNG.mg_type.{$CategoryID}} <span id="unread_{$CategoryID}">{$CategoryRow.unread}</span>/<span id="total_{$CategoryID}">{$CategoryRow.total}</span></a>
							</li>
						{/foreach}
					</ul>
				</nav>
			</div>
			<div class="col-12 col-md-8">
				<div class="toolbar">
					<button type="button" class="btn btn-light">
						<span class="fa fa-trash-o"></span>
					</button>
					<div class="btn-group float-right">
						<button type="button" class="btn btn-light">
							<span class="fa fa-chevron-left"></span>
						</button>
						<button type="button" class="btn btn-light">
							<span class="fa fa-chevron-right"></span>
						</button>
					</div>
				</div>

				<div id="messagestable" class="messages">
				</div>
			</div>
		</div>
	</div>
</div>
{/block}
{block name="script" append}
{if !empty($category)}
	<script>
		$(function() {
			Message.getMessages({$category}, {$side});
		})
	</script>
{else}
	<script>
		$(function() {
			Message.getMessages(100, 1);
		})
	</script>
{/if}
{/block}