{block name="title" prepend}{$LNG.lm_logout}{/block}
{block name="content"}
	<div class="row">
		<div class="col">
			<div class="card">
				<div class="card-header">
					{$LNG.lo_title} - {$LNG.lo_redirect}
				</div>
				<div class="card-body-container collapse show" id="resources">
					<div class="card-body">
						<div class="row">
							<div class="col-md-12">
								{$LNG.lo_notify} <span id="seconds">1</span> {$LNG.lo_seconds}
							</div>
						</div>
						<div class="row">
							<div class="col-md-12">
								<a href="./index.php">{$LNG.lo_continue}</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
{/block}
{block name="script" append}
<script type="text/javascript">
    var second = 1;
	function Countdown(){
		if(second == 0)
			return;
			
		second--;
		$('#seconds').text(second);
	}
	window.setTimeout("window.location.href='./index.php'", 1000);
	window.setInterval("Countdown()", 1000);
</script>
{/block}