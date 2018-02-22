  </div>

  <div id="modal-container"></div>

  <footer class="app-footer">
    <span>{$game_name} {$uni_name}</span>
    <span class="ml-auto">Powered by <a href="https://github.com/jkroepke/2Moons">2Moons {$VERSION}</a></span>
	<span class="d-md-none mr-5">&nbsp;</span>
  </footer>

	{if $ga_active}
		<script type="text/javascript">
		var _gaq = _gaq || [];
		_gaq.push(['_setAccount', '{$ga_key}']);
		_gaq.push(['_trackPageview']);

		(function() {
		var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
		ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
		var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
		})();
		</script>
		{/if}
		{if $debug == 1}
		<script type="text/javascript">
		onerror = handleErr;
		</script>
	{/if}

	<!-- Main config for this application -->
	{if !$vmode}
		<script type="text/javascript">
		var viewShortlyNumber	= {$shortlyNumber|json};
		var vacation			= {$vmode};
		$(function() {
		{foreach $resourceTable as $resourceID => $resourceData}
			{if isset($resourceData.production)}
				resourceTicker({
					available: {$resourceData.current|json},
					limit: [0, {$resourceData.max|json}],
					production: {$resourceData.production|json},
					valueElem: "current_{$resourceData.name}"
				}, true);
				getRestStorage({
					current: {$resourceData.current|json},
					max: [0, {$resourceData.max|json}],
					prod: {$resourceData.production|json},
					valueElem: "fullin_{$resourceData.name}"
				}, true);
			{/if}
		{/foreach}
		});
		</script>
	{/if}

	{if $closed || $delete || $vacation}
		<script type="text/javascript">
			toastr.options = {
				"closeButton": true,
				"progressBar": true,
				"showEasing": "swing",
				"hideEasing": "linear",
				"showMethod": "fadeIn",
				"hideMethod": "fadeOut",
				"showDuration": "600",
				"hideDuration": "2000",
				"positionClass": "toast-bottom-right",
			{if $closed}
				"timeOut": "0",
				"extendedTimeOut": "0"
				}
				toastr["warning"]("{$LNG.ov_closed}", "Warning");
			{elseif $delete}
				"timeOut": "5000",
				"extendedTimeOut": "2000"
				}
				toastr["warning"]("{$delete}", "Warning");
			{elseif $vacation}
				"timeOut": "5000",
				"extendedTimeOut": "2000"
				}
				toastr["info"]("{$LNG.tn_vacation_mode}<br/>{$vacation}", "Info");
			{/if}
		</script>
	{/if}

	<!-- Main scripts for this application -->
	<script type="text/javascript" src="scripts/game/topnav.js"></script>
	{if $hasGate}<script src="scripts/game/gate.js"></script>{/if}
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.min.js"></script>
	<script type="text/javascript" src="./styles/resources/js/misc.min.js"></script>
	<script type="text/javascript" src="./styles/resources/js/cookieconsent.min.js"></script>
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0-beta.3/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="./styles/resources/js/app.js"></script>

	{if isset($hasAdminAccess) && $hasAdminAccess}
		<script type="text/javascript">
			toastr.options = {
				"closeButton": true,
				"positionClass": "toast-bottom-right",
				"timeOut": 0,
				"extendedTimeOut": 0
			}
			toastr["warning"]("{$LNG.admin_access_1} <a id='drop-admin'>{$LNG.admin_access_link}</a>{$LNG.admin_access_2}", "Warning");
		</script>
	{/if}

</body>
</html>