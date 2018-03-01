{block name="title" prepend}{$LNG.siteTitleIndex}{/block}
{block name="content"}
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-12 col-md-10">
				<div class="card-group mt-3 mt-md-0">
					<div class="card card-main p-4 w-md-50">
						<div class="card-body">
							<img class="img-fluid mb-3" src="styles/resources/img/logo-lg.png"/>
							<p class="text-muted">{$LNG.loginHeader}</p>
							<form id="login" name="login" action="index.php?page=login" method="post">
								<div class="input-group mb-2 {if count($universeSelect) == 1} d-none{/if}">
									<div class="input-group-prepend">
										<span class="input-group-text"><i class="fa fa-globe"></i></span>
									</div>
									<select name="uni" id="universe" class="changeAction form-control">{html_options options=$universeSelect selected=$UNI}</select>
								</div>
								<div class="input-group mb-2">
									<div class="input-group-prepend">
										<span class="input-group-text"><i class="fa fa-user"></i></span>
									</div>
									<input name="username" id="username" type="text" class="form-control" placeholder="{$LNG.loginUsername}" autocomplete="username" {nocache}{if isset($smarty.get.username)}value="{$smarty.get.username}"{/if}{/nocache}>
								</div>
								<div class="input-group mb-2">
									<div class="input-group-prepend">
										<span class="input-group-text"><i class="fa fa-lock"></i></span>
									</div>
									<input name="password" id="password" type="password" class="form-control" placeholder="{$LNG.loginPassword}" autocomplete="off">
									<div class="input-group-append">
										<button type="button" onclick="togglePassword()" class="btn btn-warning"><i id="unmask" class="fa fa-eye"></i></button>
									</div>
								</div>
								<div class="input-group mb-3 text-right">
									<div class="form-check form-check-inline">
										<input class="form-check-input" type="checkbox" id="rememberme" name="rememberme[]" value="remeberme">
										<label class="form-check-label" for="rememberme">Remember me on this computer</label>
									</div>
								</div>
								<div class="row">
									{if $mailEnable}
										<div class="col-6">
											<button id="btnlogin" type="submit" class="btn btn-primary px-4">{$LNG.loginButton}</button>
										</div>
										<div class="col-6 text-right">
											<a class="btn btn-primary" href="index.php?page=lostPassword">{$LNG.buttonLostPassword}</a>
										</div>
									{else}
										<div class="col-12">
											<button id="btnlogin" type="submit" class="btn btn-primary px-4">{$LNG.loginButton}</button>
										</div>
									{/if}
								</div>
							</form>
							
							{$LNG['loginInfo']} <a href='#' onclick='rules()' data-toggle='modal' data-target='#rulesModal'>{$LNG['menu_rules']}</a>
							{if $facebookEnable}<a href="#" data-href="index.php?page=externalAuth&method=facebook" class="fb_login"><img src="styles/resource/images/facebook/fb-connect-large.png" alt=""></a><!-- http://b.static.ak.fbcdn.net/rsrc.php/zB6N8/hash/4li2k73z.gif -->{/if}
						</div>
					</div>
					<div class="card card-special border-0 text-white py-5 w-md-50">
						<div class="card-body text-center">
							<div>
								<h2>Sign up</h2>
								<p class="desc">{$descText}</p>
								<p class="desc">{foreach $gameInformations as $info}<p>{$info}</p>{/foreach}</p>
								<a href="index.php?page=register" class="btn btn-primary active mt-3">{$LNG.buttonRegisterNow}</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="modal fade" id="rulesModal" tabindex="-1" role="dialog" aria-labelledby="rulesModal" style="display: none;" aria-hidden="true">
		<div class="modal-dialog modal-primary modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title">{$LNG.registerRules}</h4>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div id="rulesModalBody" class="modal-body"></div>
			</div>
		</div>
	</div>
{/block}
{block name="script" append}
<script>{if $code}toastr["error"]({$code|json}, "{$LNG.toastr_error}");{/if}</script>
{/block}