<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
	<head>
	
		<!-- Basic Page Needs
		================================================== -->
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<title><g:layoutTitle default="Astrum"/></title>
		
		<!-- Mobile Specific Metas
		================================================== -->
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
		
		<!-- CSS
		================================================== -->
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'style.css')}" type="text/css">
		<link rel="stylesheet" href="${resource(dir: 'css/colors', file: 'green.css')}" type="text/css" id="colors">
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'slide.css')}" type="text/css" media="screen" />
		
		<!--[if lt IE 9]>
			<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
		<![endif]-->
		
		<!--[if lte IE 6]>
			<script src="${resource(dir: 'js', file: 'supersleight-min.js')}"></script>
		<![endif]-->
		
		<!-- Java Script
		================================================== -->
		<script src="${resource(dir: 'js', file: 'jquery.min.js')}"></script>
		<script src="${resource(dir: 'js', file: 'jquery.themepunch.plugins.min.js')}"></script>
		<script src="${resource(dir: 'js', file: 'jquery.themepunch.revolution.min.js')}"></script>
		<script src="${resource(dir: 'js', file: 'jquery.themepunch.showbizpro.min.js')}"></script>
		<script src="${resource(dir: 'js', file: 'jquery.easing.min.js')}"></script>
		<script src="${resource(dir: 'js', file: 'jquery.tooltips.min.js')}"></script>
		<script src="${resource(dir: 'js', file: 'jquery.magnific-popup.min.js')}"></script>
		<script src="${resource(dir: 'js', file: 'jquery.superfish.js')}"></script>
		<script src="${resource(dir: 'js', file: 'jquery.twitter.js')}"></script>
		<script src="${resource(dir: 'js', file: 'jquery.flexslider.js')}"></script>
		<script src="${resource(dir: 'js', file: 'jquery.jpanelmenu.js')}"></script>
		<script src="${resource(dir: 'js', file: 'jquery.contact.js')}"></script>
		<script src="${resource(dir: 'js', file: 'jquery.isotope.min.js')}"></script>
		<script src="${resource(dir: 'js', file: 'custom.js')}"></script>
		<script src="${resource(dir: 'js', file: 'jquery.emoji-0.1.js')}"></script>
		<script src="${resource(dir: 'js', file: 'slide.js')}"></script>
		<g:layoutHead/>
		<r:layoutResources />
	</head>
	<body>
	 	
	 	<!-- Panel -->
		<div id="toppanel">
			<div id="panel" class="notification success closeable">
				<div class="content clearfix">
					<div class="left">
						<h1>Welcome to Web-Kreation</h1>
						<h2>Sliding login panel Demo with jQuery</h2>		
						<p class="grey">You can put anything you want in this sliding panel: videos, audio, images, forms... The only limit is your imagination!</p>
						<h2>Download</h2>
						<p class="grey">To download this script go back to <a href="http://web-kreation.com/index.php/tutorials/nice-clean-sliding-login-panel-built-with-jquery" title="Download">article &raquo;</a></p>
					</div>
					<div class="left">
						<!-- Login Form -->
						<form class="clearfix" action="#" method="post">
							<h1>Member Login</h1>
							<label class="grey" for="log">Username:</label>
							<input class="field" type="text" name="log" id="log" value="" size="23" />
							<label class="grey" for="pwd">Password:</label>
							<input class="field" type="password" name="pwd" id="pwd" size="23" />
			            	<label><input name="rememberme" id="rememberme" type="checkbox" checked="checked" value="forever" /> &nbsp;Remember me</label>
		        			<div class="clear"></div>
							<input type="submit" name="submit" value="Login" class="button color" />
							<a class="lost-pwd" href="#">Lost your password?</a>
						</form>
					</div>
					<div class="left right">			
						<!-- Register Form -->
						<form action="#" method="post">
							<h1>Not a member yet? Sign Up!</h1>				
							<label class="grey" for="signup">Username:</label>
							<input class="field" type="text" name="signup" id="signup" value="" size="23" />
							<label class="grey" for="email">Email:</label>
							<input class="field" type="text" name="email" id="email" size="23" />
							<label>A password will be e-mailed to you.</label>
							<input type="submit" name="submit" value="Register" class="button color" />
						</form>
					</div>
				</div>
				</div> <!-- /login -->	
				
				<!-- The tab on top -->	
				<div class="tab">
					<ul class="login">
						<li id="toggle">
							<a id="openMe"  style="border-top: medium none;background-color: white;border-radius:0px !important;box-shadow:none;" href="#" class="notification success closeable">Log In | Register</a>
							<a id="closeMe" style="display: none; border-top: medium none;background-color: white;border-radius:0px !important;box-shadow:none;" href="#" class="notification success closeable">Close Panel</a>			
						</li>
					</ul> 
				</div> <!-- / top -->
				
		</div> <!--panel -->
	 	
	 	 	
		<!-- Header	================================================== -->
		<header id="header">
		
		<!-- Container -->
		<div class="container">
		
		<!-- Navigation
		================================================== -->
		<div class="thirteen columns">
		
			<nav id="navigation" class="menu">
				<ul id="responsive">
		
					
					<!-- <li style="background-color:rgb(182, 231, 162)"><g:link controller="deview" action="index" ><g:message code="navigation.Deview" default="Dev View - Testing Page"/></g:link></li>-->
		
					<li><g:link action="index" id="current"><g:message code="nav.home" default="Home"/></g:link></li>
		
					<li><a href="#"><g:message code="nav.applications" default="applications"/></a>
						<ul>
							<li><g:link controller="test" action="elements"><g:message code="nav.applications.spyboy" default="spyboy"/></g:link></li>
							<li><a href="typography.html"><g:message code="nav.applications.trivia" default="trivia"/></a></li>
							<li><a href="pricing-tables.html"><g:message code="nav.applications.backandpack" default="backandpack"/></a></li>
							<li><a href="icons.html"><g:message code="nav.applications.sevicecom" default="sevicecom"/></a></li>
						</ul>
					</li>
		
					<li><a href="#"><g:message code="nav.help" default="Help"/></a>
						<ul>
							<li><a href="about.html"><g:message code="nav.help.faq" default="About"/></a></li>
							<li><a href="services.html"><g:message code="navigation.Services" default="Services"/></a></li>
							<li><a href="faq.html"><g:message code="navigation.FAQ" default="FAQ"/></a></li>
							<li><a href="sidebar-right.html"><g:message code="navigation.RightSidebar" default="Right Sidebar"/></a></li>
							<li><a href="sidebar-left.html"><g:message code="navigation.LeftSidebar" default="Left Sidebar"/></a></li>
							<li><a href="404-page.html"><g:message code="navigation.404Page" default="404 Page"/></a></li>
						</ul>
					</li>
		
					<li><a href="#"><g:message code="nav.about" default="About"/></a>
						<ul>
							<li><a href="portfolio-3-columns.html"><g:message code="navigation.3Columns" default="3 Columns"/></a></li>
							<li><a href="portfolio-4-columns.html"><g:message code="navigation.4Columns" default="4 Columns"/></a></li>
							<li><a href="single-project-half.html"><g:message code="navigation.SingleProjectHalf" default="Single Project Half"/></a></li>
							<li><a href="single-project-wide.html"><g:message code="navigation.SingleProjectWide" default="Single Project Wide"/></a></li>
						</ul>
					</li>
		
					<li><a href="#"><g:message code="navigation.Blog" default="Blog"/></a>
						<ul>
							<li><a href="blog-large-image.html"><g:message code="navigation.LargeImage" default="Large Image"/></a></li>
							<li><a href="blog-medium-image.html"><g:message code="navigation.MediumImage" default="Medium Image"/></a></li>
							<li><a href="blog-post.html"><g:message code="navigation.SinglePost" default="Single Post"/></a></li>
						</ul>
					</li>
		
					<li><a href="contact.html"><g:message code="nav.contact-us" default="Contact Us"/></a></li>
					
					<!-- Search Form -->		
					<li class="search-container">
						<div id="search-form">
							<form method="get" action="#">
								<input type="text" class="search-text-box" />
							</form>
						</div>
					</li>
					
				</ul>
			</nav>
		</div>
		
		
		<!-- Logo / Mobile Menu -->
			<div class="three columns">
			
				<div id="mobile-navigation">
					<form method="GET" id="menu-search" action="#">
						<input type="text" placeholder="Start Typing..." />
					</form>
					<a href="#menu" class="menu-trigger"><i class="icon-reorder"></i></a>
					<span class="search-trigger"><i class="icon-search"></i></span>
				</div>
		
				<div id="logo">
					<h1><g:link action="index"><img src="${resource(dir: 'images', file: 'logo.png')}" alt="Astrum"/></g:link></h1>
				</div>
			</div>
		
		</div>
		<!-- Container / End -->
		
		</header>
		<!-- Header / End -->
		
		<!-- Body / Start -->
		<g:layoutBody/> 
		<!-- Body / End -->
		
		<!-- Footer
		================================================== -->
		<div id="footer">
		
			<!-- Container -->
			<div class="container">
		
				<div class="four columns">
					<h3>About</h3>
					<p style="margin:0;">Donec consectetur diam ac nibh auctor ultricies. Integer mauris lacus, consequat in luctus id, semper sed felis. Cum sociis natoque penatibus et magnis.</p>
				</div>
		
				<div class="four columns">
					<h3>Twitter</h3>
		
					<ul id="twitter"></ul>
					<script type="text/javascript">
						jQuery(document).ready(function($){
							$.getJSON('twitterc461.html?url='+encodeURIComponent('statuses/user_timeline.json?screen_name=Vasterad&count=1'), function(tweets){
						$("#twitter").html(tz_format_twitter(tweets));
						}); });
					</script>
					<div class="clearfix"></div>
		
					<a href="https://twitter.com/Vasterad" class="twitter-follow-button" data-show-count="false" data-dnt="true">Follow @Vasterad</a>
					<script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?'http':'https';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+'://platform.twitter.com/widgets.js';fjs.parentNode.insertBefore(js,fjs);}}(document, 'script', 'twitter-wjs');</script>
		
				</div>
		
				<div class="four columns">
					<h3>Get In Touch</h3>
					<ul class="get-in-touch">
						<li ><i class="icon-map-marker"></i> <p><strong>Address:</strong> 120 Seward Street, <br />Oklahoma City, USA</p></li>
						<li><i class="icon-user"></i> <p><strong>Phone:</strong> +48 880 440 140</p></li>
						<li><i class="icon-envelope-alt"></i> <p><strong>Email:</strong> <a href="#">mail@example.com</a></p></li>
					</ul>
				</div>
		
				<div class="four columns">
					<h3>Newsletter</h3>
					<p>Join our mailing list to stay up to date and get notices about our new releases!</p>
		
					<form action="#" method="get">
						<button class="newsletter-btn" type="submit">Join</button>
						<input class="newsletter" type="text" onblur="if(this.value=='')this.value='mail@example.com';" onfocus="if(this.value=='mail@example.com')this.value='';" value="mail@example.com" />
					</form>
				</div>
		
			</div>
			<!-- Container / End -->
		
		</div>
		<!-- Footer / End -->
		
		<!-- Footer Bottom / Start -->
		<div id="footer-bottom">
		
			<!-- Container -->
			<div class="container">
		
				<div class="eight columns">© Copyright 2013 by <a href="#">Astrum</a>. All Rights Reserved.</div>
				<div class="eight columns">
					<ul class="social-icons-footer">
						<li><a href="#" class="tooltip top" title="Twitter"><i class="icon-twitter"></i></a></li>
						<li><a href="#" class="tooltip top" title="Facebook"><i class="icon-facebook"></i></a></li>
						<li><a href="#" class="tooltip top" title="Dribbble"><i class="icon-dribbble"></i></a></li>
						<li><a href="#" class="tooltip top" title="LinkedIn"><i class="icon-linkedin-rect"></i></a></li>
						<li><a href="#" class="tooltip top" title="RSS"><i class="icon-rss"></i></a></li>
					</ul>
				</div>
		
			</div>
			<!-- Container / End -->
		
		</div>
		<!-- Footer Bottom / Start -->
		
		
		<!-- Style Switcher
		================================================== -->
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'switcher.css')}" type="text/css">
		<script src="${resource(dir: 'js', file: 'switcher.js')}"></script>
		
		<section id="style-switcher">
			<h2>Style Switcher <a href="#"></a></h2>
			<div>
				<h3>Predefined Colors</h3>
				<ul class="colors" id="colors">
					<li><a href="#" class="green" title="Green"></a></li>
					<li><a href="#" class="blue" title="Blue"></a></li>
					<li><a href="#" class="orange" title="Orange"></a></li>
					<li><a href="#" class="navy" title="Navy"></a></li>
					<li><a href="#" class="yellow" title="Yellow"></a></li>
					<li><a href="#" class="beige" title="Beige"></a></li>
					<li><a href="#" class="peach" title="Peach"></a></li>
					<li><a href="#" class="purple" title="Purple"></a></li>
					<li><a href="#" class="red" title="Red"></a></li>
					<li><a href="#" class="pink" title="Pink"></a></li>
					<li><a href="#" class="celadon" title="Celadon"></a></li>
					<li><a href="#" class="brown" title="Brown"></a></li>
					<li><a href="#" class="cherry" title="Cherry"></a></li>
					<li><a href="#" class="gray" title="Gray"></a></li>
					<li><a href="#" class="cyan" title="Cyan"></a></li>
					<li><a href="#" class="olive" title="Olive"></a></li>
				</ul>
				
				<h3>Layout Style</h3>
				<div class="layout-style">
					<select id="layout-style" autocomplete="off"> 
						<option value="1">Wide</option>
						<option value="2">Boxed</option>
					</select>
				</div>
				
				<h3>Footer Style</h3>
				<div class="footer-style">
					<select id="footer-style" autocomplete="off">
						<option value="1">Light</option>
						<option value="2">Dark</option>
					</select>
				</div>
		
				<h3>Background Image</h3>
				 <ul class="colors bg" id="bg">
					<li><a href="#" class="bg1"></a></li>
					<li><a href="#" class="bg2"></a></li>
					<li><a href="#" class="bg3"></a></li>
					<li><a href="#" class="bg4"></a></li>
					<li><a href="#" class="bg5"></a></li>
					<li><a href="#" class="bg6"></a></li>
					<li><a href="#" class="bg7"></a></li>
					<li><a href="#" class="bg8"></a></li>
					<li><a href="#" class="bg9"></a></li>
					<li><a href="#" class="bg10"></a></li>
					<li><a href="#" class="bg11"></a></li>
					<li><a href="#" class="bg12"></a></li>
					<li><a href="#" class="bg13"></a></li>
					<li><a href="#" class="bg14"></a></li>
					<li><a href="#" class="bg15"></a></li>
					<li><a href="#" class="bg16"></a></li>
				</ul>
			</div>
		</section>
		<!-- Style Switcher / End -->	
		<g:javascript library="application"/>			
		<r:layoutResources/>
	</body>
	<script type="text/javascript">
	jQuery('.emoji').emoji();
	</script>
</html>