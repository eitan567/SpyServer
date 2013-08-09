<!-- Container -->
<div class="container">

	<!-- Headline -->
	<div class="sixteen columns" style="margin-top: -5px;">
		<h3 class="headline">מקום(GPS)</h3>
		<span class="line" style="margin-bottom: 20px;"></span>
	</div>

	<div class="fifteen columns">

		<!-- Google Maps -->
		<section class="google-map-container">

			<div id="googlemaps" class="google-map google-map-full" style="height:200px;width:100%;"></div>
			<script type="text/javascript"> 
				var stops = [];
				var barriers = [];
				var routes = [];
				var map, iw, task;	
				gmaps.ags.Config.proxyUrl = '/proxy/proxy.ashx';		  
				function initialize() {
					var jsonList = ${locationInstanceList};	
				    var myLatLng = new google.maps.LatLng(jsonList[0].latitude, jsonList[0].longitude);
				    var myOptions = {
				      zoom: 11,
				      center: myLatLng,
				      mapTypeId: google.maps.MapTypeId.ROADMAP
				    };
				    task = new gmaps.ags.RouteTask('http://tasks.arcgisonline.com/ArcGIS/rest/services/NetworkAnalysis/ESRI_Route_NA/NAServer/Route');
				    map = new google.maps.Map(document.getElementById("googlemaps"), myOptions);
					barriers=new Array(${locationInstanceTotal});
					stops=new Array(${locationInstanceTotal});				
				    
					for(var i=0;i<${locationInstanceTotal};i++){						
						new StyledMarker({styleIcon:new StyledIcon(StyledIconTypes.BUBBLE,{color:"73B819",text:jsonList[i].time}),position:new google.maps.LatLng(jsonList[i].latitude, jsonList[i].longitude),map:map});
						barriers[i]=new google.maps.LatLng(jsonList[i].latitude, jsonList[i].longitude);												
					}
					stops[0]=new google.maps.LatLng(0, 0);
					stops[1]=new google.maps.LatLng(100, 100);
					
					//route();
					//var styleMaker1 = new StyledMarker({styleIcon:new StyledIcon(StyledIconTypes.MARKER,{color:"00ff00",text:"A"}),position:myLatLng,map:map});
					//var styleMaker3 = new StyledMarker({styleIcon:new StyledIcon(StyledIconTypes.MARKER,{color:"0000ff"}),position:new google.maps.LatLng(37.263477473067, -121.880502070713),map:map});
				  }
				  initialize();
				  			  
				 
				  function route() {
					  gmaps.ags.Util.removeFromMap(routes);
		              routes = [];
		              task.solve({
		                stops: stops,
		                barriers: barriers,
		                findBestSequence: true,
		                overlayOptions: {
		                  strokeColor: '#0000BB',
		                  strokeWeight: 8,
		                  strokeOpacity: 0.5
		                }
		              }, processResults, handleErr);
		              
		            }
		            
		            function processResults(results) {
		              if (results.routes) {
		                var r = results.routes.features;
		                for (var i = 0, I = r.length; i < I; i++) {
		                  gmaps.ags.Util.addToMap(map, r[i].geometry);
		                  routes = routes.concat(r[i].geometry);
		                }
		              }
		              
		            }		
		            function handleErr(err) {
		            	 // showBusy(false);
		            	  if (err) {
		            	    alert(err.message + '\n' + err.details.join('\n'));
		            	  }
		            	}
		</script>
		</section>
		<!-- Google Maps / End -->

	</div>
</div>
<!-- Container / End -->