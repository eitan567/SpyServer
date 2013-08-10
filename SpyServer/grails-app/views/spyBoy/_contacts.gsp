<g:each in="${contactInstanceList}" status="i" var="contactInstance">
	<li id="contact-${fieldValue(bean: contactInstance, field: "id")}" style="height:159px;width:141px;" class="">
		<div class="happy-clients-photo"><img src="${resource(dir: 'images', file: 'happy-clients-01.jpg')}" alt="" /></div>
		<div class="happy-clients-cite">${fieldValue(bean: contactInstance, field: "number")}</div>
		<div class="happy-clients-cite">${fieldValue(bean: contactInstance, field: "type")}</div>
		<div class="happy-clients-author"><g:remoteLink update="smsAjaxTargetDiv" controller="spyBoy" action="sms" params="${[number:contactInstance.number]}" id="${contactInstance.number}" before="cSelected(this)">${fieldValue(bean: contactInstance, field: "name")}</g:remoteLink></div>
	</li>	
</g:each>
<script>
function cSelected(obj){
	jQuery("#contactsAjaxTargetDiv li.selectedContact").removeClass("selectedContact");
	jQuery(obj).parents("li").addClass("selectedContact");
}
</script>