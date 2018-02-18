  </div>

  <div id="modal-container"></div>

  <footer class="app-footer">
    <span>{$game_name} {$uni_name}</span>
    <span class="ml-auto">Powered by <a href="https://github.com/jkroepke/2Moons">2Moons</a></span>
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

	<!-- Main scripts for this application -->
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