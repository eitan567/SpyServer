<g:if test="${callLogsInstanceTotal>0}">
	<table class="table table-striped table-bordered table-hover"
		id="sample_3">
		<thead>
			<tr>
				<th>
					${message(code: 'callLog.phoneNumber.label', default: 'phoneNumber')}
				</th>
				<th class="hidden-480">
					${message(code: 'callLog.type.label', default: 'type')}
				</th>
				<th class="hidden-480">
					${message(code: 'callLog.duration.label', default: 'duration')}
				</th>
				<th class="hidden-480" style="min-width:180px !important;">
					${message(code: 'callLog.time.label', default: 'time')}
				</th>
			</tr>
		</thead>
		<tbody>		
			<g:each in="${callLogInstanceList}" status="i" var="callLogInstance">
				<tr class="odd gradeX">
					<td class="hidden-480"><g:if
							test="${fieldValue(bean: callLogInstance, field: 'type')!=''}">
							<img
								src="${resource(dir: 'images/callog', file: fieldValue(bean: callLogInstance, field: 'type')+'.png')}"
								alt="" style="width: 25px; height: 25px; float: right" />
						</g:if>
						 <g:link action="showCallLog" id="${callLogInstance.id}" style="padding:1px 5px 0 0;vertical-align:middle;">
							${fieldValue(bean: callLogInstance, field: "formatedPhoneNumer")}
						</g:link></td>
					<td class="hidden-480">
						${message(code: 'callLog.type.' + fieldValue(bean: callLogInstance, field: 'type') , default: '')}
					</td>
					<td class="hidden-480">
						${fieldValue(bean: callLogInstance, field: "formatedPeriod")}
					</td>
					<td class="hidden-480">
						${fieldValue(bean: callLogInstance, field: "formatedDate")}
					</td>
				</tr>
			</g:each>
		</tbody>
	</table>
</g:if>
<g:else>
	<div id="callLogNotice" class="notification success closeable"
		style="text-align: center;">אין שיחות להצגה</div>
	<div id="callLogSpinner" class="spinner" style="display: block;"></div>
</g:else>