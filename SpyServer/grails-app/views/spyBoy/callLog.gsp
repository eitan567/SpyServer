<!-- Regular Table
================================================== -->

<!-- Container -->
<div class="container">
	<div class="fifteen columns">
	
		<!-- Headline -->
		<h3 class="headline">יומן שיחות (${callLogsInstanceTotal} רשומות) </h3><span class="line" style="margin-bottom:35px;"></span><div class="clearfix"></div>

			<table class="standard-table">
					<tr>					
						<g:sortableColumn property="phoneNumber" title="${message(code: 'callLog.phoneNumber.label', default: 'phoneNumber')}" />
					
						<g:sortableColumn property="type" title="${message(code: 'callLog.type.label', default: 'type')}" />
					
						<g:sortableColumn property="duration" title="${message(code: 'callLog.duration.label', default: 'duration')}" />
						
						<g:sortableColumn property="time" title="${message(code: 'callLog.time.label', default: 'time')}" />					
					</tr>					
				<g:each in="${callLogInstanceList}" status="i" var="callLogInstance">
					<tr>				
						<td style="vertical-align: middle;width:200px;">
							<img src="${resource(dir: 'images/callog', file: fieldValue(bean: callLogInstance, field: 'type')+'.png')}" alt="" style="width:45px;height:45px;float:right"/>
							<g:link action="showCallLog" id="${callLogInstance.id}" style="color: #505050;font-weight: bold;direction: ltr;font-size:16px;vertical-align: middle;float:right;padding:15px 10px 0 0">${fieldValue(bean: callLogInstance, field: "formatedPhoneNumer")}</g:link>
						</td>
				
						<td style="vertical-align: middle;color: #505050;font-size: 16px;">${message(code: 'callLog.type.' + fieldValue(bean: callLogInstance, field: 'type') , default: 'type')}</td>
				
						<td style="vertical-align: middle;color: #505050;font-size: 16px;">${fieldValue(bean: callLogInstance, field: "formatedPeriod")}</td>
						
						<td style="vertical-align: middle;color: #505050;font-size: 16px;">${fieldValue(bean: callLogInstance, field: "formatedDate")}</td>
				
					</tr>
				</g:each>
			</table>
			
			<div class="pagination">
				<g:paginate total="${callLogsInstanceTotal}" />
			</div>			
		</div>
</div>
<!-- Container / End -->