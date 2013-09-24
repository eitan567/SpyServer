<!DOCTYPE html>
<!-- 
Template Name: Metronic - Responsive Admin Dashboard Template build with Twitter Bootstrap 2.3.2
Version: 1.4
Author: KeenThemes
Website: http://www.keenthemes.com/preview/?theme=metronic
Purchase: http://themeforest.net/item/metronic-responsive-admin-dashboard-template/4021469
-->
<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9"> <![endif]-->
<!--[if !IE]><!--> <html lang="he"> <!--<![endif]-->
<!-- BEGIN HEAD -->

<!-- Mirrored from www.keenthemes.com/preview/metronic_admin_rtl/index.html by HTTrack Website Copier/3.x [XR&CO'2013], Wed, 14 Aug 2013 15:37:24 GMT -->
<!-- Added by HTTrack --><meta http-equiv="content-type" content="text/html;charset=UTF-8" lang="he"/><!-- /Added by HTTrack -->
<head>
	<meta charset="utf-8" />
	<title>Metronic | Admin Dashboard Template</title>
	<meta content="width=device-width, initial-scale=1.0" name="viewport" />
	<meta content="" name="description" />
	<meta content="" name="author" />
	<!-- BEGIN GLOBAL MANDATORY STYLES -->
	<link rel="stylesheet" href="${resource(dir: 'uaassets/plugins/bootstrap/css', file: 'bootstrap-rtl.min.css')}" type="text/css"/>
	<link rel="stylesheet" href="${resource(dir: 'uaassets/plugins/bootstrap/css', file: 'bootstrap-responsive-rtl.min.css')}" type="text/css"/>
	<link rel="stylesheet" href="${resource(dir: 'uaassets/plugins/bxslider', file: 'jquery.bxslider-rtl.css')}" type="text/css">
	<link rel="stylesheet" href="${resource(dir: 'uaassets/plugins/font-awesome/css', file: 'font-awesome.min.css')}" type="text/css"/>
	<link rel="stylesheet" href="${resource(dir: 'uaassets/css', file: 'style-metro-rtl.css')}" type="text/css"/>
	<link rel="stylesheet" href="${resource(dir: 'uaassets/css', file: 'style-rtl.css')}" type="text/css"/>
	<link rel="stylesheet" href="${resource(dir: 'uaassets/css', file: 'style-responsive-rtl.css')}" type="text/css"/>
	<link rel="stylesheet" href="${resource(dir: 'uaassets/css/themes', file: 'default-rtl.css')}" type="text/css" id="style_color"/>
	<link rel="stylesheet" href="${resource(dir: 'uaassets/plugins/uniform/css', file: 'uniform.default.css')}" type="text/css"/>
	<!-- END GLOBAL MANDATORY STYLES -->
	<!-- BEGIN PAGE LEVEL PLUGIN STYLES --> 
	<link rel="stylesheet" href="${resource(dir: 'uaassets/plugins/gritter/css', file: 'jquery.gritter.css')}" type="text/css"/>
	<link rel="stylesheet" href="${resource(dir: 'uaassets/plugins/bootstrap-daterangepicker', file: 'daterangepicker-rtl.css')}" type="text/css"/>
	<link rel="stylesheet" href="${resource(dir: 'uaassets/plugins/fullcalendar/fullcalendar', file: 'fullcalendar.css')}" type="text/css"/>
	<link rel="stylesheet" href="${resource(dir: 'uaassets/plugins/jqvmap/jqvmap', file: 'jqvmap.css')}" type="text/css" media="screen"/>
	<link rel="stylesheet" href="${resource(dir: 'uaassets/plugins/jquery-easy-pie-chart', file: 'jquery.easy-pie-chart.css')}" type="text/css" media="screen"/>
	<link rel="stylesheet" href="${resource(dir: 'uaassets/plugins/select2', file: 'select2_metro_rtl.css')}" type="text/css"/>
	<link rel="stylesheet" href="${resource(dir: 'uaassets/plugins/jquery-mcsb-scroller/css', file: 'jquery.mCustomScrollbar.css')}" type="text/css"/>
	<link rel="stylesheet" href="${resource(dir: 'uaassets/plugins/data-tables', file: 'DT_bootstrap_rtl.css')}" type="text/css"/>
	<!-- END PAGE LEVEL PLUGIN STYLES -->
	<!-- BEGIN PAGE LEVEL STYLES --> 
	<link rel="stylesheet" href="${resource(dir: 'uaassets/css/pages', file: 'tasks-rtl.css')}" type="text/css" media="screen"/>
	<link rel="stylesheet" href="${resource(dir: 'uaassets/css/pages', file: 'login-rtl.css')}" type="text/css"/>
	<!-- END PAGE LEVEL STYLES -->
	<link rel="shortcut icon" href="favicon.ico" />
	<script src="${resource(dir: 'uaassets/plugins', file: 'jquery-1.10.1.min.js')}" type="text/javascript"></script>
	<script src="${resource(dir: 'uaassets/scripts', file: 'jquery.corner.js')}" type="text/javascript"></script> 
	<script src="${resource(dir: 'js', file: 'jquery.emoji-0.1.js')}" type="text/javascript"></script>
	
	<script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false&language=iw"></script>
	<script src="${resource(dir: 'js', file: 'jquery.gmaps.min.js')}" type="text/javascript"></script>
	<script src="${resource(dir: 'js', file: 'StyledMarker.js')}" type="text/javascript"></script>
	<script src="${resource(dir: 'uaassets/plugins/jquery-mcsb-scroller/js', file: 'jquery.mCustomScrollbar.concat.min.js')}" type="text/javascript"></script>
	<g:layoutHead/>
	<r:layoutResources />

</head>
<!-- END HEAD -->
<!-- BEGIN BODY -->
<body class="page-header-fixed page-sidebar-closed" lang="he">
	<!-- BEGIN HEADER -->   
	<div class="header navbar navbar-inverse navbar-fixed-top">
		<!-- BEGIN TOP NAVIGATION BAR -->
		<div class="navbar-inner">
			<div class="container-fluid">
				<!-- BEGIN LOGO -->
				<a class="brand" href="index-2.html">
				<img src="${resource(dir: 'uaassets/img', file: 'logo.png')}" alt="logo" />
				</a>
				<!-- END LOGO -->
				<!-- BEGIN HORIZANTAL MENU -->
				<div class="navbar hor-menu hidden-phone hidden-tablet">
					<div class="navbar-inner">
						<ul class="nav">
							<g:each in="${targetPhoneInstanceList}" status="i" var="targetPhoneInstance">							
								<li class="${targetPhoneInstance.simSubscriberId==activeSimSubscriberId ? 'active':''}">
									<g:link action="index_new" params="[simSubscriberId:targetPhoneInstance.simSubscriberId]">
									${targetPhoneInstance.alias}
									<span class="${targetPhoneInstance.simSubscriberId==activeSimSubscriberId ? 'selected':''}"></span>
									</g:link>
								</li>		
							</g:each>					
							<li>
								<span class="hor-menu-search-form-toggler">&nbsp;</span>
								<div class="search-form hidden-phone hidden-tablet">
									<form class="form-search">
										<div class="input-append">
											<input type="text" placeholder="Search..." class="m-wrap">
											<button type="button" class="btn"></button>
										</div>
									</form>
								</div>
							</li>
						</ul>
					</div>
				</div>
				<!-- END HORIZANTAL MENU -->
				<!-- BEGIN RESPONSIVE MENU TOGGLER -->
				<a href="javascript:;" class="btn-navbar collapsed" data-toggle="collapse" data-target=".nav-collapse">
				<img src="${resource(dir: 'uaassets/img', file: 'menu-toggler.png')}" alt="" />
				</a>          
				<!-- END RESPONSIVE MENU TOGGLER -->            
				<!-- BEGIN TOP NAVIGATION MENU -->              
				<ul class="nav pull-left">
					<!-- BEGIN NOTIFICATION DROPDOWN -->   
					<li class="dropdown" id="header_notification_bar">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-close-others="true">
						<i class="icon-warning-sign"></i>
						<span class="badge">6</span>
						</a>
						<ul class="dropdown-menu extended notification">
							<li>
								<p>You have 14 new notifications</p>
							</li>
							<li>
								<ul class="dropdown-menu-list scroller" style="height:250px">
									<li>
										<a href="#">
										<span class="label label-success"><i class="icon-plus"></i></span>
										New user registered. 
										<span class="time">Just now</span>
										</a>
									</li>
									<li>
										<a href="#">
										<span class="label label-important"><i class="icon-bolt"></i></span>
										Server #12 overloaded. 
										<span class="time">15 mins</span>
										</a>
									</li>
									<li>
										<a href="#">
										<span class="label label-warning"><i class="icon-bell"></i></span>
										Server #2 not responding.
										<span class="time">22 mins</span>
										</a>
									</li>
									<li>
										<a href="#">
										<span class="label label-info"><i class="icon-bullhorn"></i></span>
										Application error.
										<span class="time">40 mins</span>
										</a>
									</li>
									<li>
										<a href="#">
										<span class="label label-important"><i class="icon-bolt"></i></span>
										Database overloaded 68%. 
										<span class="time">2 hrs</span>
										</a>
									</li>
									<li>
										<a href="#">
										<span class="label label-important"><i class="icon-bolt"></i></span>
										2 user IP blocked.
										<span class="time">5 hrs</span>
										</a>
									</li>
									<li>
										<a href="#">
										<span class="label label-warning"><i class="icon-bell"></i></span>
										Storage Server #4 not responding.
										<span class="time">45 mins</span>
										</a>
									</li>
									<li>
										<a href="#">
										<span class="label label-info"><i class="icon-bullhorn"></i></span>
										System Error.
										<span class="time">55 mins</span>
										</a>
									</li>
									<li>
										<a href="#">
										<span class="label label-important"><i class="icon-bolt"></i></span>
										Database overloaded 68%. 
										<span class="time">2 hrs</span>
										</a>
									</li>
								</ul>
							</li>
							<li class="external">
								<a href="#">See all notifications <i class="m-icon-swapright"></i></a>
							</li>
						</ul>
					</li>
					<!-- END NOTIFICATION DROPDOWN -->
					<!-- BEGIN INBOX DROPDOWN -->
					<li class="dropdown" id="header_inbox_bar">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-close-others="true">
						<i class="icon-envelope"></i>
						<span class="badge">5</span>
						</a>
						<ul class="dropdown-menu extended inbox">
							<li>
								<p>You have 12 new messages</p>
							</li>
							<li>
								<ul class="dropdown-menu-list scroller" style="height:250px">
									<li>
										<a href="inbox14c8.html?a=view">
										<span class="photo"><img src="${resource(dir: 'uaassets/img', file: 'avatar2.jpg')}" alt="" /></span>
										<span class="subject">
										<span class="from">Lisa Wong</span>
										<span class="time">Just Now</span>
										</span>
										<span class="message">
										Vivamus sed auctor nibh congue nibh. auctor nibh
										auctor nibh...
										</span>  
										</a>
									</li>
									<li>
										<a href="inbox14c8.html?a=view">
										<span class="photo"><img src="${resource(dir: 'uaassets/img', file: 'avatar3.jpg')}" alt="" /></span>
										<span class="subject">
										<span class="from">Richard Doe</span>
										<span class="time">16 mins</span>
										</span>
										<span class="message">
										Vivamus sed congue nibh auctor nibh congue nibh. auctor nibh
										auctor nibh...
										</span>  
										</a>
									</li>
									<li>
										<a href="inbox14c8.html?a=view">
										<span class="photo"><img src="${resource(dir: 'uaassets/img', file: 'avatar1.jpg')}" alt="" /></span>
										<span class="subject">
										<span class="from">Bob Nilson</span>
										<span class="time">2 hrs</span>
										</span>
										<span class="message">
										Vivamus sed nibh auctor nibh congue nibh. auctor nibh
										auctor nibh...
										</span>  
										</a>
									</li>
									<li>
										<a href="inbox14c8.html?a=view">
										<span class="photo"><img src="${resource(dir: 'uaassets/img', file: 'avatar2.jpg')}" alt="" /></span>
										<span class="subject">
										<span class="from">Lisa Wong</span>
										<span class="time">40 mins</span>
										</span>
										<span class="message">
										Vivamus sed auctor 40% nibh congue nibh...
										</span>  
										</a>
									</li>
									<li>
										<a href="inbox14c8.html?a=view">
										<span class="photo"><img src="${resource(dir: 'uaassets/img', file: 'avatar3.jpg')}" alt="" /></span>
										<span class="subject">
										<span class="from">Richard Doe</span>
										<span class="time">46 mins</span>
										</span>
										<span class="message">
										Vivamus sed congue nibh auctor nibh congue nibh. auctor nibh
										auctor nibh...
										</span>  
										</a>
									</li>
								</ul>
							</li>
							<li class="external">
								<a href="inbox.html">See all messages <i class="m-icon-swapright"></i></a>
							</li>
						</ul>
					</li>
					<!-- END INBOX DROPDOWN -->
					<!-- BEGIN TODO DROPDOWN -->
					<li class="dropdown" id="header_task_bar">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-close-others="true">
						<i class="icon-tasks"></i>
						<span class="badge">5</span>
						</a>
						<ul class="dropdown-menu extended tasks">
							<li>
								<p>You have 12 pending tasks</p>
							</li>
							<li>
								<ul class="dropdown-menu-list scroller"  style="height:250px">
									<li>
										<a href="#">
										<span class="task">
										<span class="desc">New release v1.2</span>
										<span class="percent">30%</span>
										</span>
										<span class="progress progress-success ">
										<span style="width: 30%;" class="bar"></span>
										</span>
										</a>
									</li>
									<li>
										<a href="#">
										<span class="task">
										<span class="desc">Application deployment</span>
										<span class="percent">65%</span>
										</span>
										<span class="progress progress-danger progress-striped active">
										<span style="width: 65%;" class="bar"></span>
										</span>
										</a>
									</li>
									<li>
										<a href="#">
										<span class="task">
										<span class="desc">Mobile app release</span>
										<span class="percent">98%</span>
										</span>
										<span class="progress progress-success">
										<span style="width: 98%;" class="bar"></span>
										</span>
										</a>
									</li>
									<li>
										<a href="#">
										<span class="task">
										<span class="desc">Database migration</span>
										<span class="percent">10%</span>
										</span>
										<span class="progress progress-warning progress-striped">
										<span style="width: 10%;" class="bar"></span>
										</span>
										</a>
									</li>
									<li>
										<a href="#">
										<span class="task">
										<span class="desc">Web server upgrade</span>
										<span class="percent">58%</span>
										</span>
										<span class="progress progress-info">
										<span style="width: 58%;" class="bar"></span>
										</span>
										</a>
									</li>
									<li>
										<a href="#">
										<span class="task">
										<span class="desc">Mobile development</span>
										<span class="percent">85%</span>
										</span>
										<span class="progress progress-success">
										<span style="width: 85%;" class="bar"></span>
										</span>
										</a>
									</li>
									<li>
										<a href="#">
										<span class="task">
										<span class="desc">New UI release</span>
										<span class="percent">18%</span>
										</span>
										<span class="progress progress-important">
										<span style="width: 18%;" class="bar"></span>
										</span>
										</a>
									</li>
								</ul>
							</li>
							<li class="external">
								<a href="#">See all tasks <i class="m-icon-swapright"></i></a>
							</li>
						</ul>
					</li>
					<!-- END TODO DROPDOWN -->               
					<!-- BEGIN USER LOGIN DROPDOWN -->
					<li class="dropdown user">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-close-others="true">
						<img src="data:image/png;base64,${user.image}" alt="" width="29px" height="29px"/>
						<span class="username">${user.firstName + " " + user.lastName}</span>
						<i class="icon-angle-down"></i>
						</a>
						<ul class="dropdown-menu">
							<li><g:link action="profile" controller="spyBoy"><i class="icon-user"></i> הפרופיל שלי </g:link></li>
							<li><a href="page_calendar.html"><i class="icon-calendar"></i> יומן אישי </a></li>
							<li><a href="inbox.html"><i class="icon-envelope"></i> דואר אישי <span class="badge badge-important">3</span></a></li>
							<li><a href="#"><i class="icon-tasks"></i> המשימות שלי <span class="badge badge-success">8</span></a></li>
							<li class="divider"></li>
							<li><a href="javascript:;" id="trigger_fullscreen"><i class="icon-move"></i> תצוגה במסך מלא </a></li>
							<li><g:link controller="auth" action="lockscreen"><i class="icon-lock"></i> מסך נעילה </g:link></li>
							<li><g:link action="signOut" controller="auth"><i class="icon-key"></i> התנתק </g:link></li>
						</ul>
					</li>
					<!-- END USER LOGIN DROPDOWN -->
					<!-- END USER LOGIN DROPDOWN -->
				</ul>
				<!-- END TOP NAVIGATION MENU --> 
			</div>
		</div>
		<!-- END TOP NAVIGATION BAR -->
	</div>
	<!-- END HEADER -->
	<!-- BEGIN CONTAINER -->
	<div class="page-container">
		<!-- BEGIN SIDEBAR -->
		<div class="page-sidebar nav-collapse collapse">
			<!-- BEGIN SIDEBAR MENU -->        
			<ul class="page-sidebar-menu">
				<li>
					<!-- BEGIN SIDEBAR TOGGLER BUTTON -->
					<div class="sidebar-toggler hidden-phone"></div>
					<!-- BEGIN SIDEBAR TOGGLER BUTTON -->
				</li>
				<li>
					<!-- BEGIN RESPONSIVE QUICK SEARCH FORM -->
					<form class="sidebar-search">
						<div class="input-box">
							<a href="javascript:;" class="remove"></a>
							<input type="text" placeholder="חיפוש..." />
							<input type="button" class="submit" value=" " />
						</div>
					</form>
					<!-- END RESPONSIVE QUICK SEARCH FORM -->
				</li>
				<li class="start active ">
					<a href="index-2.html">
					<i class="icon-home"></i> 
					<span class="title">שולחן עבודה</span>
					<span class="selected"></span>
					</a>
				</li>
				<li >
					<a href="javascript:;">
					<i class="icon-cogs"></i> 
					<span class="title">Layouts</span>
					<span class="arrow "></span>
					</a>
					<ul class="sub-menu">
						<li >
							<a href="layout_language_bar.html">
							<span class="badge badge-roundless badge-important">new</span>Language Switch Bar</a>
						</li>
						<li >
							<a href="layout_horizontal_sidebar_menu.html">
							Horizontal & Sidebar Menu</a>
						</li>
						<li >
							<a href="layout_horizontal_menu1.html">
							Horizontal Menu 1</a>
						</li>
						<li >
							<a href="layout_horizontal_menu2.html">
							Horizontal Menu 2</a>
						</li>
						<li >
							<a href="layout_promo.html">
							Promo Page</a>
						</li>
						<li >
							<a href="layout_email.html">
							Email Templates</a>
						</li>
						<li >
							<a href="layout_ajax.html">
							Content Loading via Ajax</a>
						</li>
						<li >
							<a href="layout_sidebar_closed.html">
							Sidebar Closed Page</a>
						</li>
						<li >
							<a href="layout_blank_page.html">
							Blank Page</a>
						</li>
						<li >
							<a href="layout_boxed_page.html">
							Boxed Page</a>
						</li>
						<li >
							<a href="layout_boxed_not_responsive.html">
							Non-Responsive Boxed Layout</a>
						</li>
					</ul>
				</li>
				<!-- BEGIN FRONT DEMO -->
				<li class="tooltips" data-placement="left" data-original-title="Frontend&nbsp;Theme&nbsp;For&nbsp;Metronic&nbsp;Admin">
					<a href="http://keenthemes.com/preview/index.php?theme=metronic_frontend_rtl" target="_blank">
					<i class="icon-gift"></i> 
					<span class="title">Frontend Theme</span>
					</a>
				</li>
				<!-- END FRONT DEMO -->
				<li >
					<a href="javascript:;">
					<i class="icon-bookmark-empty"></i> 
					<span class="title">UI Features</span>
					<span class="arrow "></span>
					</a>
					<ul class="sub-menu">
						<li >
							<a href="ui_general.html">
							General</a>
						</li>
						<li >
							<a href="ui_buttons.html">
							Buttons</a>
						</li>
						<li >
							<a href="ui_modals.html">
							Enhanced Modals</a>
						</li>
						<li >
							<a href="ui_tabs_accordions.html">
							Tabs & Accordions</a>
						</li>
						<li >
							<a href="ui_jqueryui.html">
							jQuery UI Components</a>
						</li>
						<li >
							<a href="ui_sliders.html">
							Sliders</a>
						</li>
						<li >
							<a href="ui_tiles.html">
							Tiles</a>
						</li>
						<li >
							<a href="ui_typography.html">
							Typography</a>
						</li>
						<li >
							<a href="ui_tree.html">
							Tree View</a>
						</li>
						<li >
							<a href="ui_nestable.html">
							Nestable List</a>
						</li>
					</ul>
				</li>
				<li >
					<a href="javascript:;">
					<i class="icon-table"></i> 
					<span class="title">Form Stuff</span>
					<span class="arrow "></span>
					</a>
					<ul class="sub-menu">
						<li >
							<a href="form_layout.html">
							Form Layouts</a>
						</li>
						<li >
							<a href="form_samples.html">
							Advance Form Samples</a>
						</li>
						<li >
							<a href="form_component.html">
							Form Components</a>
						</li>
						<li >
							<a href="form_editable.html">
							<span class="badge badge-roundless badge-warning">new</span>Form X-editable</a>
						</li>
						<li >
							<a href="form_wizard.html">
							Form Wizard</a>
						</li>
						<li >
							<a href="form_validation.html">
							Form Validation</a>
						</li>
						<li >
							<a href="form_image_crop.html">
							<span class="badge badge-roundless badge-important">new</span>Image Cropping</a>
						</li>
						<li >
							<a href="form_fileupload.html">
							Multiple File Upload</a>
						</li>
						<li >
							<a href="form_dropzone.html">
							Dropzone File Upload</a>
						</li>
					</ul>
				</li>
				<li >
					<a href="javascript:;">
					<i class="icon-briefcase"></i> 
					<span class="title">Pages</span>
					<span class="arrow "></span>
					</a>
					<ul class="sub-menu">
						<li >
							<a href="page_timeline.html">
							<i class="icon-time"></i>
							<span class="badge badge-info">4</span>Timeline</a>
						</li>
						<li >
							<a href="page_coming_soon.html">
							<i class="icon-cogs"></i>
							Coming Soon</a>
						</li>
						<li >
							<a href="page_blog.html">
							<i class="icon-comments"></i>
							Blog</a>
						</li>
						<li >
							<a href="page_blog_item.html">
							<i class="icon-font"></i>
							Blog Post</a>
						</li>
						<li >
							<a href="page_news.html">
							<i class="icon-coffee"></i>
							<span class="badge badge-success">9</span>News</a>
						</li>
						<li >
							<a href="page_news_item.html">
							<i class="icon-bell"></i>
							News View</a>
						</li>
						<li >
							<a href="page_about.html">
							<i class="icon-group"></i>
							About Us</a>
						</li>
						<li >
							<a href="page_contact.html">
							<i class="icon-envelope-alt"></i>
							Contact Us</a>
						</li>
						<li >
							<a href="page_calendar.html">
							<i class="icon-calendar"></i>
							<span class="badge badge-important">14</span>Calendar</a>
						</li>
					</ul>
				</li>
				<li >
					<a href="javascript:;">
					<i class="icon-gift"></i> 
					<span class="title">Extra</span>
					<span class="arrow "></span>
					</a>
					<ul class="sub-menu">
						<li >
							<a href="extra_profile.html">
							User Profile</a>
						</li>
						<li >
							<a href="#" onclick="lockScreen();">
							Lock Screen</a>
						</li>
						<li >
							<a href="extra_faq.html">
							FAQ</a>
						</li>
						<li >
							<a href="inbox.html">
							<span class="badge badge-important">4</span>Inbox</a>
						</li>
						<li >
							<a href="extra_search.html">
							Search Results</a>
						</li>
						<li >
							<a href="extra_invoice.html">
							Invoice</a>
						</li>
						<li >
							<a href="extra_pricing_table.html">
							Pricing Tables</a>
						</li>
						<li >
							<a href="extra_image_manager.html">
							Image Manager</a>
						</li>
						<li >
							<a href="extra_404_option1.html">
							404 Page Option 1</a>
						</li>
						<li >
							<a href="extra_404_option2.html">
							404 Page Option 2</a>
						</li>
						<li >
							<a href="extra_404_option3.html">
							404 Page Option 3</a>
						</li>
						<li >
							<a href="extra_500_option1.html">
							500 Page Option 1</a>
						</li>
						<li >
							<a href="extra_500_option2.html">
							500 Page Option 2</a>
						</li>
					</ul>
				</li>
				<li>
					<a class="active" href="javascript:;">
					<i class="icon-sitemap"></i> 
					<span class="title">3 Level Menu</span>
					<span class="arrow "></span>
					</a>
					<ul class="sub-menu">
						<li>
							<a href="javascript:;">
							Item 1
							<span class="arrow"></span>
							</a>
							<ul class="sub-menu">
								<li><a href="#">Sample Link 1</a></li>
								<li><a href="#">Sample Link 2</a></li>
								<li><a href="#">Sample Link 3</a></li>
							</ul>
						</li>
						<li>
							<a href="javascript:;">
							Item 1
							<span class="arrow"></span>
							</a>
							<ul class="sub-menu">
								<li><a href="#">Sample Link 1</a></li>
								<li><a href="#">Sample Link 1</a></li>
								<li><a href="#">Sample Link 1</a></li>
							</ul>
						</li>
						<li>
							<a href="#">
							Item 3
							</a>
						</li>
					</ul>
				</li>
				<li>
					<a href="javascript:;">
					<i class="icon-folder-open"></i> 
					<span class="title">4 Level Menu</span>
					<span class="arrow "></span>
					</a>
					<ul class="sub-menu">
						<li>
							<a href="javascript:;">
							<i class="icon-cogs"></i> 
							Item 1
							<span class="arrow"></span>
							</a>
							<ul class="sub-menu">
								<li>
									<a href="javascript:;">
									<i class="icon-user"></i>
									Sample Link 1
									<span class="arrow"></span>
									</a>
									<ul class="sub-menu">
										<li><a href="#"><i class="icon-remove"></i> Sample Link 1</a></li>
										<li><a href="#"><i class="icon-pencil"></i> Sample Link 1</a></li>
										<li><a href="#"><i class="icon-edit"></i> Sample Link 1</a></li>
									</ul>
								</li>
								<li><a href="#"><i class="icon-user"></i>  Sample Link 1</a></li>
								<li><a href="#"><i class="icon-external-link"></i>  Sample Link 2</a></li>
								<li><a href="#"><i class="icon-bell"></i>  Sample Link 3</a></li>
							</ul>
						</li>
						<li>
							<a href="javascript:;">
							<i class="icon-globe"></i> 
							Item 2
							<span class="arrow"></span>
							</a>
							<ul class="sub-menu">
								<li><a href="#"><i class="icon-user"></i>  Sample Link 1</a></li>
								<li><a href="#"><i class="icon-external-link"></i>  Sample Link 1</a></li>
								<li><a href="#"><i class="icon-bell"></i>  Sample Link 1</a></li>
							</ul>
						</li>
						<li>
							<a href="#">
							<i class="icon-folder-open"></i>
							Item 3
							</a>
						</li>
					</ul>
				</li>
				<li >
					<a href="javascript:;">
					<i class="icon-user"></i> 
					<span class="title">Login Options</span>
					<span class="arrow "></span>
					</a>
					<ul class="sub-menu">
						<li >
							<a href="login.html">
							Login Form 1</a>
						</li>
						<li >
							<a href="login_soft.html">
							Login Form 2</a>
						</li>
					</ul>
				</li>
				<li >
					<a href="javascript:;">
					<i class="icon-th"></i> 
					<span class="title">Data Tables</span>
					<span class="arrow "></span>
					</a>
					<ul class="sub-menu">
						<li >
							<a href="table_basic.html">
							Basic Tables</a>
						</li>
						<li >
							<a href="table_responsive.html">
							Responsive Tables</a>
						</li>
						<li >
							<a href="table_managed.html">
							Managed Tables</a>
						</li>
						<li >
							<a href="table_editable.html">
							Editable Tables</a>
						</li>
						<li >
							<a href="table_advanced.html">
							Advanced Tables</a>
						</li>
					</ul>
				</li>
				<li >
					<a href="javascript:;">
					<i class="icon-file-text"></i> 
					<span class="title">Portlets</span>
					<span class="arrow "></span>
					</a>
					<ul class="sub-menu">
						<li >
							<a href="portlet_general.html">
							General Portlets</a>
						</li>
						<li >
							<a href="portlet_draggable.html">
							Draggable Portlets</a>
						</li>
					</ul>
				</li>
				<li >
					<a href="javascript:;">
					<i class="icon-map-marker"></i> 
					<span class="title">Maps</span>
					<span class="arrow "></span>
					</a>
					<ul class="sub-menu">
						<li >
							<a href="maps_google.html">
							Google Maps</a>
						</li>
						<li >
							<a href="maps_vector.html">
							Vector Maps</a>
						</li>
					</ul>
				</li>
				<li>
					<a href="charts.html">
					<i class="icon-bar-chart"></i> 
					<span class="title">Visual Charts</span>
					</a>
				</li>
				<li>
					<a href="javascript:;">
					<i class="icon-cogs"></i> 
					<span class="title">Ajax Submenu 1</span>
					<span class="selected"></span>
					<span class="arrow"></span>
					</a>
					<ul class="sub-menu">
						<li>
							<a class="ajaxify start" href="${g.resource(file:'layout_ajax_content_1.gsp')}">
							Ajax Link Sample 1                    
							</a>
						</li>
						<li>
							<a class="ajaxify" href="${g.resource(file:'layout_ajax_content_2.gsp')}">
							Ajax Link Sample 2                    
							</a>
						</li>
						<li>
							<a class="ajaxify" href="${g.resource(file:'layout_ajax_content_3.gsp')}">
							Ajax Link Sample 3                    
							</a>
						</li>						
					</ul>
				</li>  
				<li>
					<a href="javascript:;">
					<i class="icon-cogs"></i> 
					<span class="title">Ajax Submenu 2</span>
					<span class="selected"></span>
					<span class="arrow"></span>
					</a>
					<ul class="sub-menu">
						<li>
							<a class="ajaxify" href="layout_ajax_content_2.gsp">
							Ajax Link Sample 1                  
							</a>
						</li>
						<li>
							<a class="ajaxify" href="layout_ajax_content_3.gsp">
							Ajax Link Sample 2                    
							</a>
						</li>
						<li>
							<a class="ajaxify" href="layout_ajax_content_2.gsp">
							Ajax Link Sample 3                    
							</a>
						</li>
						<li>
							<a class="ajaxify" href="layout_ajax_content_3.gsp">
							Ajax Link Sample 4                    
							</a>
						</li>
					</ul>
				</li>
				<li class="last ">
					<a href="javascript:;">
					<i class="icon-cogs"></i> 
					<span class="title">Ajax Submenu 3</span>
					<span class="selected"></span>
					<span class="arrow"></span>
					</a>
					<ul class="sub-menu">
						<li>
							<a class="ajaxify" href="layout_ajax_content_2.gsp">
							Ajax Link Sample 1                    
							</a>
						</li>
						<li>
							<a class="ajaxify" href="layout_ajax_content_3.gsp">
							Ajax Link Sample 2                    
							</a>
						</li>
						<li>
							<a class="ajaxify" href="layout_ajax_content_2.gsp">
							Ajax Link Sample 3                    
							</a>
						</li>
						<li class="last">
							<a class="ajaxify" href="layout_ajax_content_3.gsp">
							Ajax Link Sample 4                    
							</a>
						</li>
					</ul>
				</li>
			</ul>
			<!-- END SIDEBAR MENU -->
		</div>
		<!-- END SIDEBAR -->
		<!-- BEGIN PAGE -->
		<div class="page-content">			
			<!-- Body / Start -->
			<g:layoutBody/> 
			<!-- Body / End -->			
		</div>
		<!-- END PAGE -->
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
	<!-- END FOOTER -->
	<!-- BEGIN JAVASCRIPTS(Load javascripts at bottom, this will reduce page load time) -->

	<g:javascript library="application"/>			
	<r:layoutResources/>
	
	<!-- BEGIN CORE PLUGINS -->   
	
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
	<script src="${resource(dir: 'uaassets/plugins/flot', file: 'jquery.flot.js')}" type="text/javascript"></script>
	<script src="${resource(dir: 'uaassets/plugins/flot', file: 'jquery.flot.resize.js')}" type="text/javascript"></script>
	<script src="${resource(dir: 'uaassets/plugins', file: 'jquery.pulsate.min.js')}" type="text/javascript"></script>
	<script src="${resource(dir: 'uaassets/plugins/gritter/js', file: 'jquery.gritter.js')}" type="text/javascript"></script>
	<script src="${resource(dir: 'uaassets/plugins/fullcalendar/fullcalendar', file: 'fullcalendar.min.js')}" type="text/javascript"></script>
	<script src="${resource(dir: 'uaassets/plugins/jquery-easy-pie-chart', file: 'jquery.easy-pie-chart.js')}" type="text/javascript"></script>
	<script src="${resource(dir: 'uaassets/plugins', file: 'jquery.sparkline.min.js')}" type="text/javascript"></script>
	<script src="${resource(dir: 'uaassets/plugins/select2', file: 'select2.min.js')}" type="text/javascript"></script>
	<script src="${resource(dir: 'uaassets/plugins/data-tables', file: 'jquery.dataTables.js')}" type="text/javascript"></script>
	<script src="${resource(dir: 'uaassets/plugins/data-tables', file: 'DT_bootstrap.js')}" type="text/javascript"></script>
	<script src="${resource(dir: 'uaassets/scripts', file: 'index.js')}" type="text/javascript"></script> 
	<script src="${resource(dir: 'uaassets/scripts', file: 'tasks.js')}" type="text/javascript"></script>	 
	<script src="${resource(dir: 'uaassets/scripts', file: 'ui-general.js')}" type="text/javascript"></script>	
	<script src="${resource(dir: 'uaassets/scripts', file: 'app.js')}" type="text/javascript"></script>		
	<script src="${resource(dir: 'uaassets/scripts', file: 'table-managed.js')}" type="text/javascript"></script>
	<script src="${resource(dir: 'js', file: 'jquery.arctext.js')}" type="text/javascript"></script>
	<script src="${resource(dir: 'uaassets/scripts', file: 'form-samples.js')}" type="text/javascript"></script>
	<script src="${resource(dir: 'uaassets/plugins/gmaps', file: 'gmaps.js')}" type="text/javascript"></script>		
	<script src="${resource(dir: 'uaassets/scripts', file: 'maps-google.js')}" type="text/javascript"></script>
	<%-- <script src="${resource(dir: 'uaassets/plugins/bxslider', file: 'jquery.bxslider.js')}" type="text/javascript"></script> --%>
	
	
	<script src="${resource(dir: 'uaassets/plugins/ckeditor', file: 'ckeditor.js')}" type="text/javascript"></script>  
	<script src="${resource(dir: 'uaassets/plugins/bootstrap-fileupload', file: 'bootstrap-fileupload.js')}" type="text/javascript"></script>
	<script src="${resource(dir: 'uaassets/plugins/chosen-bootstrap/chosen', file: 'chosen.jquery-rtl.min.js')}" type="text/javascript"></script>
	<script src="${resource(dir: 'uaassets/plugins/bootstrap-wysihtml5', file: 'wysihtml5-0.3.0.js')}" type="text/javascript"></script> 
	<script src="${resource(dir: 'uaassets/plugins/bootstrap-wysihtml5', file: 'bootstrap-wysihtml5.js')}" type="text/javascript"></script>
	<script src="${resource(dir: 'uaassets/plugins/jquery-tags-input', file: 'jquery.tagsinput.min.js')}" type="text/javascript"></script>
	<script src="${resource(dir: 'uaassets/plugins/bootstrap-toggle-buttons/static/js', file: 'jquery.toggle.buttons.js')}" type="text/javascript"></script>
	<script src="${resource(dir: 'uaassets/plugins/bootstrap-datepicker/js', file: 'bootstrap-datepicker.js')}" type="text/javascript"></script>
	<script src="${resource(dir: 'uaassets/plugins/bootstrap-datetimepicker/js', file: 'bootstrap-datetimepicker.js')}" type="text/javascript"></script>
	<script src="${resource(dir: 'uaassets/plugins/clockface/js', file: 'clockface.js')}" type="text/javascript"></script>
	<script src="${resource(dir: 'uaassets/plugins/bootstrap-daterangepicker', file: 'date.js')}" type="text/javascript"></script>
	<script src="${resource(dir: 'uaassets/plugins/bootstrap-daterangepicker', file: 'daterangepicker-rtl.js')}" type="text/javascript"></script> 
	<script src="${resource(dir: 'uaassets/plugins/bootstrap-colorpicker/js', file: 'bootstrap-colorpicker.js')}" type="text/javascript"></script>  
	<script src="${resource(dir: 'uaassets/plugins/bootstrap-timepicker/js', file: 'bootstrap-timepicker.js')}" type="text/javascript"></script>
	<script src="${resource(dir: 'uaassets/plugins/jquery-inputmask', file: 'jquery.inputmask.bundle.min.js')}" type="text/javascript"></script>   
	<script src="${resource(dir: 'uaassets/plugins', file: 'jquery.input-ip-address-control-1.0.min.js')}" type="text/javascript"></script>   
	<script src="${resource(dir: 'uaassets/plugins/jquery-multi-select/js', file: 'jquery.multi-select-rtl.js')}" type="text/javascript"></script>   
	<script src="${resource(dir: 'uaassets/plugins/bootstrap-modal/js', file: 'bootstrap-modal.js')}" type="text/javascript"></script>
	<script src="${resource(dir: 'uaassets/plugins/bootstrap-modal/js', file: 'bootstrap-modalmanager.js')}" type="text/javascript"></script>
	<script src="${resource(dir: 'uaassets/plugins/jquery.pwstrength.bootstrap/src', file: 'pwstrength.js')}" type="text/javascript"></script>
	<script src="${resource(dir: 'uaassets/plugins/bootstrap-switch/static/js', file: 'bootstrap-switch.js')}" type="text/javascript"></script>
	<script src="${resource(dir: 'uaassets/plugins/jquery-tags-input', file: 'jquery.tagsinput.min.js')}" type="text/javascript"></script>	
	<script src="${resource(dir: 'uaassets/scripts', file: 'form-components.js')}" type="text/javascript"></script>
	
	<script>
		var ajaxCounter=0;
		jQuery(document).ready(function() {    
		   App.init();  // initlayout and core plugins
		  // MapsGoogle.init();
		   //TableManaged.init();
		   Index.init(); 
		   //Index.initJQVMAP(); // init index page's custom scripts
		   Index.initCalendar(); // init index page's custom scripts
		   Index.initCharts(); // init index page's custom scripts
		   Index.initChat();
		   Index.initMiniCharts();
		   Index.initDashboardDaterange();
		   Index.initIntro();
		   Tasks.initDashboardWidget();
		   FormSamples.init();
		   //App.initBxSlider();
		   //jQuery('.page-sidebar .ajaxify.start').click(); // load the content for the dashboard page.
		});		
		
		jQuery(".badge").corner("12px");		

		function runEmoji(){
			  jQuery('.emoji').emoji();
		}
	</script>	
	</body>	
</html>