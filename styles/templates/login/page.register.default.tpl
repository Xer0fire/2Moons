{block name="title" prepend}{$LNG.siteTitleRegister}{/block}
{block name="content"}
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-12 col-md-5">
				<div class="card mt-3 p-4">
					<div class="card-body">
						<img class="img-fluid mb-3" src="styles/resources/img/logo-lg.png"/>
						<p class="text-muted">{$LNG.registerNew}</p>
						<form id="registerForm" method="post" action="index.php?page=register" data-action="index.php?page=register" novalidate>
							<input type="hidden" value="send" name="mode">
							<input type="hidden" value="{$externalAuth.account}" name="externalAuth[account]">
							<input type="hidden" value="{$externalAuth.method}" name="externalAuth[method]">
							<input type="hidden" value="{$referralData.id}" name="referralID">
							<div class="input-group mb-3{if count($universeSelect) == 1} d-none{/if}">
								<div class="input-group-prepend">
									<span class="input-group-text"><i class="fa fa-globe"></i></span>
								</div>
								<select name="uni" id="universe" class="changeAction form-control custom-select">{html_options options=$universeSelect selected=$UNI}</select>
							</div>
							{if !empty($externalAuth.account)}
								{if $facebookEnable}
									<div class="rowForm">
										<label>{$LNG.registerFacebookAccount}</label>
										<span class="text fbname">{$accountName}</span>
									</div>
								{/if}
							{elseif empty($referralData.id)}
								{if $facebookEnable}
									<div class="rowForm">
										<label>{$LNG.registerFacebookAccount}</label>
										<a href="#" data-href="index.php?page=externalAuth&method=facebook" class="fb_login"><img src="styles/resource/images/facebook/fb-connect-large.png" alt=""></a>
									</div>
								{/if}
							{/if}
							<div class="input-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text"><i class="fa fa-user"></i></span>
								</div>
								<input name="username" id="username" aria-describedby="usernameHelp" type="text" class="form-control" placeholder="{$LNG.registerUsername}" required>
								<break></break>
								<small id="usernameHelp" class="form-text text-muted">{$LNG.registerUsernameDesc}</small>
							</div>
							<div class="input-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text"><i class="fa fa-lock"></i></span>
								</div>
								<input name="password" id="password" aria-describedby="passwordHelp" type="password" class="form-control" placeholder="{$LNG.registerPassword}" required>
								<break></break>
								<small id="passwordHelp" class="d-flex form-text text-muted">{$LNG.registerPasswordDesc}</small>
							</div>
							<div class="input-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text"><i class="fa fa-envelope"></i></span>
								</div>
								<input name="email" id="email" type="email" class="form-control" placeholder="{$LNG.registerEmail}" required>
							</div>
							<div class="input-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text"><i class="fa fa-envelope"></i></span>
								</div>
								<input name="emailReplay" id="emailReplay" type="email" class="form-control" placeholder="{$LNG.registerEmailReplay}" required>
							</div>
							{if count($languages) > 1}
								<div class="input-group mb-3 d-none">
									<div class="input-group-prepend">
										<span class="input-group-text"><i class="fa fa-language"></i></span>
									</div>
									<select name="lang" id="language" class="form-control">{html_options options=$languages selected=$lang}</select>
								</div>
							{/if}
							{if !empty($referralData.name)}
								<div class="input-group mb-3">
									<div class="input-group-prepend">
										<span class="input-group-text"><i class="fa fa-tags"></i></span>
									</div>
									<span class="text">{$referralData.name}</span>
								</div>
							{/if}
							{if $recaptchaEnable}
								<div class="rowForm" id="captchaRow">
									<div>
										<label>{$LNG.registerCaptcha}</label>
										<!--<span class="form-text text-muted">{$LNG.registerCaptchaDesc}</span>-->
										<div class="g-recaptcha" data-sitekey="{$recaptchaPublicKey}"></div>
									</div>
								</div>
							{/if}
							<div class="input-group mb-3">
								<input type="checkbox" name="rules" id="rules" class="mr-1" value="1" required>
								<span>{$registerRulesDesc} <a href='#' onclick='rules()' data-toggle='modal' data-target='#rulesModal'>{$LNG['menu_rules']}</a></span>
							</div>
							<div class="row">
								<div class="col-6">
									<button id="btnRegister" type="submit" class="btn btn-block btn-primary px-4">{$LNG.buttonRegister}</button>
								</div>
								<div class="col-6">
									<a href="javascript:window.history.back()" class="btn btn-block btn-primary px-4">{$LNG.registerBack}</a>
								</div>
							</div>
						</form>
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
<link rel="stylesheet" type="text/css" href="styles/resource/css/login/register.css?v={$REV}">
{if $recaptchaEnable}
<script type="text/javascript" src="https://www.google.com/recaptcha/api.js?hl={$lang}"></script>
{/if}
<script type="text/javascript" src="scripts/login/register.js"></script>
{/block}