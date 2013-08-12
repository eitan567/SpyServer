<g:each in="${contactInstanceList}" status="i" var="contactInstance">
	<li id="contact-${fieldValue(bean: contactInstance, field: "id")}" style="height:163px;padding-bottom: 5px;width:118px;margin: 0 0 3px 3px;" class="notSelected" onclick="loadAllAjaxSections('${contactInstance.formatedPhoneNumer}');cSelected(this);">
		<div class="happy-clients-photo"><img src="${resource(dir: 'images', file: 'happy-clients-01.jpg')}" alt="" /></div>
		<div class="happy-clients-cite">${fieldValue(bean: contactInstance, field: "formatedPhoneNumer")}</div>
		<div class="happy-clients-cite">${fieldValue(bean: contactInstance, field: "type")}</div>
		<div class="happy-clients-author">${fieldValue(bean: contactInstance, field: "name")}</div>
	</li>	
</g:each>
<script>
function cSelected(obj){
	jQuery("#contactsAjaxTargetDiv li.selectedContact").removeClass("selectedContact").addClass("notSelected");
	jQuery(obj).removeClass("notSelected").addClass("selectedContact");
}

function loadAllAjaxSections(number){	
	 jQuery.ajax({type:'POST',data:{'number':number}, url:'/SpyServer/spyBoy/callLog',success:function(data,textStatus){jQuery('#callLogAjaxTargetDiv').html(data);},error:function(XMLHttpRequest,textStatus,errorThrown){}});
	 jQuery.ajax({type:'POST',data:{'number':number}, url:'/SpyServer/spyBoy/sms',success:function(data,textStatus){jQuery('#smsAjaxTargetDiv').html(data);},error:function(XMLHttpRequest,textStatus,errorThrown){}}); 
}
</script>