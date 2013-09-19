<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9"> <![endif]-->
<!--[if !IE]><!--> <html lang="en"> <!--<![endif]-->
<!-- BEGIN HEAD -->

<!-- Mirrored from www.keenthemes.com/preview/metronic_admin_rtl/extra_lock.html by HTTrack Website Copier/3.x [XR&CO'2013], Wed, 14 Aug 2013 15:37:25 GMT -->
<!-- Added by HTTrack --><meta http-equiv="content-type" content="text/html;charset=UTF-8" /><!-- /Added by HTTrack -->
<head>
	<meta charset="utf-8" />
	<title>Metronic | Extra - Lock Screen</title>
	<meta content="width=device-width, initial-scale=1.0" name="viewport" />
	<meta content="" name="description" />
	<meta content="" name="author" />
	<!-- BEGIN GLOBAL MANDATORY STYLES -->
	<link rel="stylesheet" href="${resource(dir: 'uaassets/plugins/bootstrap/css', file: 'bootstrap-rtl.min.css')}" type="text/css"/>
	<link rel="stylesheet" href="${resource(dir: 'uaassets/plugins/bootstrap/css', file: 'bootstrap-responsive-rtl.min.css')}" type="text/css"/>
	<link rel="stylesheet" href="${resource(dir: 'uaassets/plugins/font-awesome/css', file: 'font-awesome.min.css')}" type="text/css"/>
	<link rel="stylesheet" href="${resource(dir: 'uaassets/css', file: 'style-metro-rtl.css')}" type="text/css"/>
	<link rel="stylesheet" href="${resource(dir: 'uaassets/css', file: 'style-rtl.css')}" type="text/css"/>
	<link rel="stylesheet" href="${resource(dir: 'uaassets/css', file: 'style-responsive-rtl.css')}" type="text/css"/>
	<link rel="stylesheet" href="${resource(dir: 'uaassets/css/themes', file: 'default-rtl.css')}" type="text/css"/>
	<link rel="stylesheet" href="${resource(dir: 'uaassets/plugins/uniform/css', file: 'uniform.default.css')}" type="text/css"/>
	<!-- END GLOBAL MANDATORY STYLES -->
	<!-- BEGIN PAGE LEVEL STYLES -->
	<link rel="stylesheet" href="${resource(dir: 'uaassets/css/pages', file: 'lock-rtl.css')}" type="text/css"/>
	<!-- END PAGE LEVEL STYLES -->
	<link rel="shortcut icon" href="favicon.ico" />
</head>
<!-- END HEAD -->
<!-- BEGIN BODY -->
<body>
	<div class="page-lock">
		<div class="page-logo">
			<g:link class="brand" controller="auth" action="login"></g:link>
			<img src="${resource(dir: 'uaassets/img', file: 'logo-big.png')}" alt="logo" />
			</a>
		</div>
		<div class="page-body">
			<img src="${resource(dir: 'uaassets/img/profile', file: 'profile.jpg')}" alt="" />
			<div class="page-lock-info">
				<h1>${user.fullname}</h1>
				<span>${user.email}</span>
				<span><em>נעול</em></span>
				<g:form class="form-search" action="login" controller="auth">
					<div class="input-append">
						<input type="hidden" name="username" value="${user.username}" />
						<input type="text" class="m-wrap" placeholder="Password" name="password" value=""/>
						<button type="submit" class="btn blue icn-only" ><i class="m-icon-swapleft m-icon-white"></i></button>
					</div>
					<div class="relogin">
						<g:link class="brand" controller="auth" action="login">לא ${user.fullname} ?</g:link>						
					</div>
				</g:form>
			</div>
		</div>
		<div class="page-footer">
			2013 &copy; Metronic. Admin Dashboard Template.
		</div>
	</div>
	<!-- BEGIN JAVASCRIPTS(Load javascripts at bottom, this will reduce page load time) -->
	<!-- BEGIN CORE PLUGINS -->   <script src="${resource(dir: 'uaassets/plugins', file: 'jquery-1.10.1.min.js')}" type="text/javascript"></script>
	<script src="${resource(dir: 'uaassets/plugins', file: 'jquery-migrate-1.2.1.min.js')}" type="text/javascript"></script>
	<!-- IMPORTANT! Load jquery-ui-1.10.1.custom.min.js before bootstrap.min.js to fix bootstrap tooltip conflict with jquery ui tooltip -->
	<script src="${resource(dir: 'uaassets/plugins/jquery-ui', file: 'jquery-ui-1.10.1.custom.min.js')}" type="text/javascript"></script>      
	<script src="${resource(dir: 'uaassets/plugins/bootstrap/js', file: 'bootstrap-rtl.min.js')}" type="text/javascript"></script>
	<script src="${resource(dir: 'uaassets/plugins/bootstrap-hover-dropdown', file: 'twitter-bootstrap-hover-dropdown.min.js')}" type="text/javascript"></script>
	<!--[if lt IE 9]>
	<script src="${resource(dir: 'uaassets/plugins', file: 'excanvas.min.js')}" type="text/javascript"></script>
	<script src="${resource(dir: 'uaassets/plugins', file: 'respond.min.js')}" type="text/javascript"></script>  
	<![endif]-->   
	<script src="${resource(dir: 'uaassets/plugins/jquery-slimscroll', file: 'jquery.slimscroll.min.js')}" type="text/javascript"></script>
	<script src="${resource(dir: 'uaassets/plugins', file: 'jquery.blockui.min.js')}" type="text/javascript"></script>  
	<script src="${resource(dir: 'uaassets/plugins', file: 'jquery.cookie.min.js')}" type="text/javascript"></script>
	<script src="${resource(dir: 'uaassets/plugins/uniform', file: 'jquery.uniform.min.js')}" type="text/javascript"></script>
	<!-- END CORE PLUGINS -->
	<!-- BEGIN PAGE LEVEL PLUGINS -->
	<script src="${resource(dir: 'uaassets/plugins/backstretch', file: 'jquery.backstretch.min.js')}" type="text/javascript"></script>
	<!-- END PAGE LEVEL PLUGINS -->   
	<script src="${resource(dir: 'uaassets/scripts', file: 'app.js')}" type="text/javascript"></script>  
	<script src="${resource(dir: 'uaassets/scripts', file: 'lock.js')}" type="text/javascript"></script>      
	<script>
		jQuery(document).ready(function() {    
		   App.init();
		   Lock.init();
		});
	</script>
	<!-- END JAVASCRIPTS -->
</body>
<!-- END BODY -->

<!-- Mirrored from www.keenthemes.com/preview/metronic_admin_rtl/extra_lock.html by HTTrack Website Copier/3.x [XR&CO'2013], Wed, 14 Aug 2013 15:37:25 GMT -->
</html>