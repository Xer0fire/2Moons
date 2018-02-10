  </div>

  <div id="modal-container"></div>

  <footer class="app-footer">
    <span>{$game_name} {$uni_name}</span>
    <span class="ml-auto">Powered by <a href="https://github.com/jkroepke/2Moons">2Moons</a></span>
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

	{if $hasAdminAccess}
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
	
	<!-- Main scripts for this application -->
	<script type="text/javascript" src="./scripts/base/jquery.cookie.js?v={$REV}"></script>
	<script type="text/javascript" src="./styles/resources/js/popper.min.js"></script>
	<script type="text/javascript" src="./styles/resources/js/popovers.js"></script>
	<script type="text/javascript" src="./styles/resources/js/tooltips.js"></script>
	<script type="text/javascript" src="./styles/resources/js/ie10-viewport-bug-workaround.js"></script>
	<script type="text/javascript" src="./styles/resources/js/toastr.min.js"></script>
	<script type="text/javascript" src="./styles/resources/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="./styles/resources/js/cookieconsent.min.js"></script>
	<script type="text/javascript" src="./styles/resources/js/app.js"></script>

</body>
</html>