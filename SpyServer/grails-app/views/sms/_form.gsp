<%@ page import="com.org.krams.domain.Sms" %>



<div class="fieldcontain ${hasErrors(bean: smsInstance, field: 'address', 'error')} ">
	<label for="address">
		<g:message code="sms.address.label" default="Address" />
		
	</label>
	<g:textField name="address" value="${smsInstance?.address}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: smsInstance, field: 'folderName', 'error')} ">
	<label for="folderName">
		<g:message code="sms.folderName.label" default="Folder Name" />
		
	</label>
	<g:textField name="folderName" value="${smsInstance?.folderName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: smsInstance, field: 'smsId', 'error')} ">
	<label for="smsId">
		<g:message code="sms.smsId.label" default="Sms Id" />
		
	</label>
	<g:textField name="smsId" value="${smsInstance?.smsId}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: smsInstance, field: 'msg', 'error')} ">
	<label for="msg">
		<g:message code="sms.msg.label" default="Msg" />
		
	</label>
	<g:textField name="msg" value="${smsInstance?.msg}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: smsInstance, field: 'readState', 'error')} ">
	<label for="readState">
		<g:message code="sms.readState.label" default="Read State" />
		
	</label>
	<g:checkBox name="readState" value="${smsInstance?.readState}" />
</div>

<div class="fieldcontain ${hasErrors(bean: smsInstance, field: 'time', 'error')} required">
	<label for="time">
		<g:message code="sms.time.label" default="Time" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="time" precision="day"  value="${smsInstance?.time}"  />
</div>

