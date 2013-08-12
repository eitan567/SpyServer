<g:if test="${callLogsInstanceTotal>0}">
<table class="standard-table">			
	<g:each in="${callLogInstanceList}" status="i" var="callLogInstance">
	<tr>				
		<td style="vertical-align: middle;width:130px">
			<g:if test="${fieldValue(bean: callLogInstance, field: 'type')!=''}">
				<img src="${resource(dir: 'images/callog', file: fieldValue(bean: callLogInstance, field: 'type')+'.png')}" alt="" style="width:30px;height:30px;float:right"/>
			</g:if>
			<g:link action="showCallLog" id="${callLogInstance.id}" style="color: #505050;font-weight: bold;direction: ltr;font-size:14px;vertical-align: middle;float:right;padding:5px 10px 0 0">${fieldValue(bean: callLogInstance, field: "formatedPhoneNumer")}</g:link>
		</td>
		<td style="width:95px;vertical-align: middle;color: #505050;">${message(code: 'callLog.type.' + fieldValue(bean: callLogInstance, field: 'type') , default: '')}</td>
		<td style="width:130px;vertical-align: middle;color: #505050;">${fieldValue(bean: callLogInstance, field: "formatedPeriod")}</td>
		<td style="width:180px;vertical-align: middle;color: #505050;">${fieldValue(bean: callLogInstance, field: "formatedDate")}</td>
	</tr>
	</g:each>
</table>
</g:if>
<g:else>
	<div class="notification success closeable" style="margin-top: 20px;text-align: center;">אין שיחות להצגה</div>
</g:else>
<script>	
	jQuery(showHeader());
	function showHeader(){
		if(${callLogsInstanceTotal>0}){
			jQuery("#callLogHeader").show();
			jQuery("#content_2").css("height","540px");			
		}else{
			jQuery("#callLogHeader").hide();
			jQuery("#content_2").css("height","81px");	
		}

		if(${callLogsInstanceTotal>14}){
			jQuery("#callLogHeader").css("padding-right","30px");
		}else{
			jQuery("#callLogHeader").css("padding-right","0px");
		}
	}
</script>