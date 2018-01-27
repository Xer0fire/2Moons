  </div>

  <footer class="app-footer">
    <span>{$game_name} {$uni_name}</span>
    <span class="ml-auto">A modified version of <a href="https://github.com/jkroepke/2Moons">2Moons</a></span>
	{if $hasAdminAccess}
		<div class="globalWarning">
			{$LNG.admin_access_1} <a id="drop-admin">{$LNG.admin_access_link}</a>{$LNG.admin_access_2}
		</div>
	{/if}
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

  <!-- Main scripts for this application 
  <script src="./styles/resources/js/jquery.min.js"></script>-->
  <script src="./styles/resources/js/bootstrap.min.js"></script>
  <script src="./styles/resources/js/cookieconsent.min.js"></script>

  <script src="./styles/resources/js/app.js"></script>

</body>
</html>