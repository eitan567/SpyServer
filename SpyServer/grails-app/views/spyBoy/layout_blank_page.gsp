<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="user_area_layout"/>		 
	</head>
	<body>
			<!-- BEGIN SAMPLE PORTLET CONFIGURATION MODAL FORM-->
			<div id="portlet-config" class="modal hide">
				<div class="modal-header">
					<button data-dismiss="modal" class="close" type="button"></button>
					<h3>Widget Settings</h3>
				</div>
				<div class="modal-body">
					Widget settings form goes here
				</div>
			</div>
			<!-- END SAMPLE PORTLET CONFIGURATION MODAL FORM-->
			<!-- BEGIN PAGE CONTAINER-->
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
									<li class="color-grey color-grey" data-style="grey-rtl"></li>
									<li class="color-blue" data-style="blue-rtl"></li>
									<li class="color-brown" data-style="brown-rtl"></li>
									<li class="color-purple" data-style="purple-rtl"></li>
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
										<option value="fixed" selected>Fixed</option>
										<option value="default">Default</option>
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
						<!-- END STYLE CUSTOMIZER -->    
						<!-- BEGIN PAGE TITLE & BREADCRUMB-->
						<h3 class="page-title">
							שולחן עבודה
							<small>סטטיסטיקה ועוד...</small>
						</h3>
						<ul class="breadcrumb">
							<li>
								<i class="icon-home"></i>
								<a href="index-2.html">דף הבית</a> 
								<i class="icon-angle-left"></i>
							</li>
							<li><a href="#">שולחן עבודה</a></li>
							<li class="pull-left no-text-shadow">
								<div id="dashboard-report-range" class="dashboard-date-range tooltips no-tooltip-on-touch-device responsive" data-tablet="" data-desktop="tooltips" data-placement="top" data-original-title="Change dashboard date range">
									<i class="icon-calendar"></i>
									<span></span>
									<i class="icon-angle-down"></i>
								</div>
							</li>
						</ul>
						<!-- END PAGE TITLE & BREADCRUMB-->
					</div>
				</div>
				<!-- END PAGE HEADER-->
				<!-- BEGIN PAGE CONTENT-->
				<div class="row-fluid">
					<div class="span12">
						<div class="content_6 contents6">
							<div class="user-info_container">
								<g:each in="${contactInstanceList}" status="i" var="contactInstance">
										 <g:if test='${contactInstance.image!=null && contactInstance.image!=""}'>
											<img src="data:image/png;base64,${contactInstance.image}" width="60px" height="60px"/>
										 </g:if>
										 <g:else>
											<img src="${resource(dir: 'uaassets/img', file: 'avatar.png')}" alt="" width="60px" height="60px"/>
										 </g:else>
								</g:each>												
							</div>											
						</div>
					</div>
				</div>
				<!-- END PAGE CONTENT-->
			</div>
			<!-- END PAGE CONTAINER--> 
 </body>
 <!-- END BODY -->
 
</html>