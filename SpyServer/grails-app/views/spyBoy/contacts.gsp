<!-- Happy Clients
================================================== -->

<!-- Container -->
<div class="container">

	<!-- Headline -->
	<div class="fifteen columns" style="margin-top: -5px;">
		<h3 class="headline">אנשי קשר</h3>
		<span class="line" style="margin-bottom: 20px;"></span>
	</div>

	<!-- Navigation / Left -->
	<div id="showbiz_left_3" class="sb-navigation-left-2 alt"><i class="icon-angle-left"></i></div>

	<!-- ShowBiz Carousel -->
	<div id="happy-clients" class="showbiz-container fifteen carousel columns" >

	<!-- Portfolio Entries -->
	<div class="showbiz our-clients" data-left="#showbiz_left_3" data-right="#showbiz_right_3">
		<div class="overflowholder">

			<ul>
				<g:each in="${contactInstanceList}" status="i" var="contactInstance">
				<li>
					<div class="happy-clients-photo"><img src="${resource(dir: 'images', file: 'happy-clients-01.jpg')}" alt="" /></div>
					<div class="happy-clients-cite">${fieldValue(bean: contactInstance, field: "number")}</div>
					<div class="happy-clients-cite">${fieldValue(bean: contactInstance, field: "type")}</div>
					<div class="happy-clients-author"><g:remoteLink update="callLogTab" controller="spyBoy" action="callLog" params="${[number:contactInstance.number]}" id="${contactInstance.number}">${fieldValue(bean: contactInstance, field: "name")}</g:remoteLink></div>
				</li>	
				</g:each>
			</ul>
			<div class="clearfix"></div>

		</div>
		<div class="clearfix"></div>

	</div>
	</div>

	<!-- Navigation / Right -->
	<div id="showbiz_right_3" class="sb-navigation-right-2 alt"><i class="icon-angle-right"></i></div>

</div>
<!-- Container / End -->
