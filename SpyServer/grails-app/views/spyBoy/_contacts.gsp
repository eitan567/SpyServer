<g:each in="${contactInstanceList}" status="i" var="contactInstance">
	<li style="height:159px;width:141px;">
		<div class="happy-clients-photo"><img src="${resource(dir: 'images', file: 'happy-clients-01.jpg')}" alt="" /></div>
		<div class="happy-clients-cite">${fieldValue(bean: contactInstance, field: "number")}</div>
		<div class="happy-clients-cite">${fieldValue(bean: contactInstance, field: "type")}</div>
		<div class="happy-clients-author"><g:remoteLink update="smsAjaxTargetDiv" controller="spyBoy" action="sms" params="${[number:contactInstance.number]}" id="${contactInstance.number}">${fieldValue(bean: contactInstance, field: "name")}</g:remoteLink></div>
	</li>	
</g:each>