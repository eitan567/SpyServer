<!-- Container -->
<div class="container">

	<div class="fifteen columns">

		<!-- Google Maps -->
		<section class="google-map-container">

			<div id="googlemaps" class="google-map google-map-full"></div>
			
			<script type="text/javascript">
				jQuery('#googlemaps').gMap({
					maptype: 'ROADMAP',
					scrollwheel: true,
					zoom: 14,
					markers:
						[${locationStr}],${startLocationStr}	
				});				
			</script>
		
		</section>
		<!-- Google Maps / End -->

	</div>
</div>
<!-- Container / End -->