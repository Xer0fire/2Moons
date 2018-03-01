	<div id="modal-container"></div>
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.min.js"></script>
	<script type="text/javascript" src="./styles/resources/js/cookieconsent.min.js"></script>
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/2.1.4/toastr.min.js"></script>
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0-beta.3/js/bootstrap.min.js"></script>
	<script src="scripts/login/main.js"></script>
	<script>{if isset($code)}var loginError = {$code|json};{/if}</script>
	{block name="script"}{/block}	
	<div id="dialog" style="display:none;"></div>
	<script>
	var LoginConfig = {
		'isMultiUniverse': {$isMultiUniverse|json},
		'unisWildcast': {$unisWildcast|json},
		'referralEnable' : {$referralEnable|json},
		'basePath' : {$basepath|json}
	};
	</script>
	{if $analyticsEnable}
		<script type="text/javascript" src="http://www.google-analytics.com/ga.js"></script>
		<script type="text/javascript">
		try{
		var pageTracker = _gat._getTracker("{$analyticsUID}");
		pageTracker._trackPageview();
		} catch(err) {}</script>
	{/if}
</body>
</html>