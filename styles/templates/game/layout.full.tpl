{include file="main.header.tpl" bodyclass="full"}
{if $hasAdminAccess}
<div class="globalWarning">
{$LNG.admin_access_1} <a id="drop-admin">{$LNG.admin_access_link}</a>{$LNG.admin_access_2}
</div>
{/if}
{include file="main.topnav.tpl"}

  <div class="app-body">
  
{include file="main.navigation.tpl"}

<!-- Main content -->
<main class="main">
<div class="container-fluid mainbg">
<div class="animated fadeIn">

{block name="content"}{/block}

</div>
<!-- /.animated -->
</div>
<!-- /.container-fluid -->
</main>

{include file="main.planetnavigation.tpl"}

{foreach $cronjobs as $cronjob}<img src="cronjob.php?cronjobID={$cronjob}" alt="">{/foreach}
{include file="main.footer.tpl" nocache}