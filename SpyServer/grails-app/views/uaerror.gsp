<!DOCTYPE html>
<html lang="he">
	<head>
		<meta name="layout" content="user_area_layout" lang="he" />
		<!-- BEGIN PAGE LEVEL STYLES -->
		<link rel="stylesheet" href="${resource(dir: 'uaassets/css/pages', file: 'error-rtl.css')}" type="text/css"/>
		<!-- END PAGE LEVEL STYLES -->
	</head>
	<body lang="he">
		<!-- BEGIN PAGE -->
		<div class="page-content">
			<!-- BEGIN SAMPLE PORTLET CONFIGURATION MODAL FORM-->
			<div id="portlet-config" class="modal hide">
				<div class="modal-header">
					<button data-dismiss="modal" class="close" type="button"></button>
					<h3>Widget Settings</h3>
				</div>
				<div class="modal-body">
					<p>Here will be a configuration form</p>
				</div>
			</div>
			<!-- END SAMPLE PORTLET CONFIGURATION MODAL FORM-->
			<div class="container-fluid">
				<!-- BEGIN PAGE HEADER-->
				<div class="row-fluid">
					<div class="span12">
						<!-- BEGIN STYLE CUSTOMIZER -->
						<div class="color-panel hidden-phone">
							<div class="color-mode-icons icon-color"></div>
							<div class="color-mode-icons icon-color-close"></div>
							<div class="color-mode">
								<p>THEME COLOR</p>
								<ul class="inline">
									<li class="color-black current color-default" data-style="default-rtl"></li>
									<li class="color-blue" data-style="blue-rtl"></li>
									<li class="color-brown" data-style="brown-rtl"></li>
									<li class="color-purple" data-style="purple-rtl"></li>
									<li class="color-grey" data-style="grey-rtl"></li>
									<li class="color-white color-light" data-style="light-rtl"></li>
								</ul>
								<label>
									<span>Layout</span>
									<select class="layout-option m-wrap small">
										<option value="fluid" selected>Fluid</option>
										<option value="boxed">Boxed</option>
									</select>
								</label>
								<label>
									<span>Header</span>
									<select class="header-option m-wrap small">
										<option value="fixed" selected>Fixed</option>
										<option value="default">Default</option>
									</select>
								</label>
								<label>
									<span>Sidebar</span>
									<select class="sidebar-option m-wrap small">
										<option value="fixed">Fixed</option>
										<option value="default" selected>Default</option>
									</select>
								</label>
								<label>
									<span>Footer</span>
									<select class="footer-option m-wrap small">
										<option value="fixed">Fixed</option>
										<option value="default" selected>Default</option>
									</select>
								</label>
							</div>
						</div>
						<!-- END BEGIN STYLE CUSTOMIZER -->    
						<!-- BEGIN PAGE TITLE & BREADCRUMB-->
						<h3 class="page-title">
							שגיאה 404
						</h3>
						<ul class="breadcrumb">
							<li>
								<i class="icon-home"></i>
								<a href="index-2.html">דף הבית</a> 
								<i class="icon-angle-left"></i>
							</li>							
							<li><a href="#">שגיאה 404</a></li>
						</ul>
						<!-- END PAGE TITLE & BREADCRUMB-->
					</div>
				</div>
				<!-- END PAGE HEADER-->
				<!-- BEGIN PAGE CONTENT-->          
				<div class="row-fluid">
					<div class="span12 page-404">
						<div class="number">
							404
						</div>
						<div class="details">
							<h3>אופס ! אבדת באתר.</h3>
							<p>
								אין ביכולתינו למצוא את הדף שאתה מחפש.<br />
								<a href="index-2.html">חזור לדף הבית</a> או נסה את החיפוש מטה.
							</p>
							<form action="#">
								<div class="input-append">                      
									<input class="m-wrap" size="16" type="text" placeholder="keyword..." />
									<button class="btn blue">חיפוש</button>
								</div>
							</form>
						</div>
					</div>
				</div>
				<!-- END PAGE CONTENT-->
			</div>
			<!-- END PAGE CONTAINER-->       
		</div>
		<!-- BEGIN PAGE -->     
	</div>
	<!-- END CONTAINER -->
	<!-- BEGIN FOOTER -->
	<div class="footer">
		<div class="footer-inner">
			2013 &copy; Metronic by keenthemes.
		</div>
		<div class="footer-tools">
			<span class="go-top">
			<i class="icon-angle-up"></i>
			</span>
		</div>
	</div>
</body>
<!-- END BODY -->
</html>