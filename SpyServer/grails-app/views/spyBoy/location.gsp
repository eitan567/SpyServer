
<!-- Headline -->
<div class="sixteen columns" style="margin-top: 15px;">
	<h3 class="headline">מקום(GPS)</h3>
	<span class="line" style="margin-bottom: 20px;"></span>
</div>

<div class="fifteen columns">

	<!-- Google Maps -->
	<section class="google-map-container">

		<div id="googlemaps" class="google-map google-map-full"
			style="height: 100px; width: 100%;"></div>
		<script type="text/javascript"> 
				var stops = [];
				var barriers = [];
				var routes = [];
				var map, iw, task;	
				var total =${locationInstanceTotal};
				gmaps.ags.Config.proxyUrl = '/proxy/proxy.ashx';
				var geocoder = new google.maps.Geocoder(); 				
						  
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
					//barriers=new Array(${locationInstanceTotal});
					//stops=new Array(${locationInstanceTotal});	
					var i=0;	

					setTimedInterval(jsonList,4*1100)
					
					//var timer = setInterval(function(){						
					//	if(i<total)
					//		codeLatLng(jsonList,i++);
					//	else 
					//		window.clearInterval(timer);						
					//	},2000);
					
					for(var i=0;i<${locationInstanceTotal};i++){						
						barriers[i]=new google.maps.LatLng(jsonList[i].latitude, jsonList[i].longitude);							
					//	new StyledMarker({styleIcon:new StyledIcon(StyledIconTypes.BUBBLE,{color:"73B819",text:(jsonList[i].time + " " + address)}),position:new google.maps.LatLng(jsonList[i].latitude, jsonList[i].longitude),map:map});
					}
					stops[0]=new google.maps.LatLng(jsonList[0].latitude, jsonList[0].longitude);
					stops[1]=new google.maps.LatLng(jsonList[${locationInstanceTotal-1}].latitude, jsonList[${locationInstanceTotal-1}].longitude);
					//debugger;
					//route();
					//var styleMaker1 = new StyledMarker({styleIcon:new StyledIcon(StyledIconTypes.MARKER,{color:"00ff00",text:"A"}),position:myLatLng,map:map});
					//var styleMaker3 = new StyledMarker({styleIcon:new StyledIcon(StyledIconTypes.MARKER,{color:"0000ff"}),position:new google.maps.LatLng(37.263477473067, -121.880502070713),map:map});
				  }
				  initialize();

				  function setTimedInterval(jsonList, timeout){
					    var i=0;
					    var id=setInterval(function(){codeLatLng(jsonList,i++)}, 1000);
					    setTimeout(function(){
					        clearInterval(id);
					    }, timeout);
				  }			  
				 
				  function route() {
					  gmaps.ags.Util.removeFromMap(routes);
		              routes = [];
		              task.solve({
		                stops: stops,
		                barriers: barriers,
		                findBestSequence: true,
		                overlayOptions: {
		                  strokeColor: '#0000BB',
		                  strokeWeight: 5,
		                  strokeOpacity: 8
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

		            function codeLatLng(jsonList,i) {			           	          
		              geocoder.geocode({'latLng': new google.maps.LatLng(jsonList[i].latitude, jsonList[i].longitude)}, function(results, status) {
		                if (status == google.maps.GeocoderStatus.OK) {					                           
		                  if (results[0]) {			                 
							 new StyledMarker({styleIcon:new StyledIcon(StyledIconTypes.BUBBLE,{color:"73B819",text1:"    ( נקודה מספר "+(i+1)+" )",text2:jsonList[i].time,text3:results[0].formatted_address}),position:new google.maps.LatLng(jsonList[i].latitude, jsonList[i].longitude),map:map});								
		                  }
		                } else {
		                  //alert("Geocoder failed due to: " + status);
		                }
		              });
		            }
		</script>
	</section>
	<!-- Google Maps / End -->

</div>