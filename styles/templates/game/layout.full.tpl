{include file="main.header.tpl" bodyclass="full"}

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

{include file="main.footer.tpl"}

{foreach $cronjobs as $cronjob}<img src="cronjob.php?cronjobID={$cronjob}" alt="">{/foreach}