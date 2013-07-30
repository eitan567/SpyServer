<!-- Regular Table
================================================== -->

<!-- Container -->
<div class="container">
	<div class="sixteen columns">
	
		<!-- Headline -->
		<h3 class="headline">יומן שיחות</h3><span class="line" style="margin-bottom:35px;"></span><div class="clearfix"></div>

			<table class="standard-table">
					<tr>					
						<g:sortableColumn property="phoneNumber" title="${message(code: 'callLog.phoneNumber.label', default: 'phoneNumber')}" />
					
						<g:sortableColumn property="type" title="${message(code: 'callLog.type.label', default: 'type')}" />
					
						<g:sortableColumn property="duration" title="${message(code: 'callLog.duration.label', default: 'duration')}" />
						
						<g:sortableColumn property="time" title="${message(code: 'callLog.time.label', default: 'time')}" />					
					</tr>					
				<g:each in="${callLogInstanceList}" status="i" var="callLogInstance">
					<tr>
				
						<td><g:link action="showCallLog" id="${callLogInstance.id}">${fieldValue(bean: callLogInstance, field: "phoneNumber")}</g:link></td>
				
						<td>${fieldValue(bean: callLogInstance, field: "type")}</td>
				
						<td>${fieldValue(bean: callLogInstance, field: "duration")}</td>
						
						<td>${fieldValue(bean: callLogInstance, field: "timeSeconds")}</td>
				
					</tr>
				</g:each>
			</table>
			<div class="instanceTotal">
				<h5><g:message code="callLog.total.label" default='סה"כ רשומות: '/>${callLogsInstanceTotal}</h5>
			</div>
			
			<div class="pagination">
				<g:paginate total="${callLogsInstanceTotal}" />
			</div>
		</div>
</div>
<!-- Container / End -->