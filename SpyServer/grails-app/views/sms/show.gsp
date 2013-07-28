
<%@ page import="com.org.krams.domain.Sms" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'sms.label', default: 'Sms')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-sms" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-sms" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list sms">
			
				<g:if test="${smsInstance?.address}">
				<li class="fieldcontain">
					<span id="address-label" class="property-label"><g:message code="sms.address.label" default="Address" /></span>
					
						<span class="property-value" aria-labelledby="address-label"><g:fieldValue bean="${smsInstance}" field="address"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${smsInstance?.folderName}">
				<li class="fieldcontain">
					<span id="folderName-label" class="property-label"><g:message code="sms.folderName.label" default="Folder Name" /></span>
					
						<span class="property-value" aria-labelledby="folderName-label"><g:fieldValue bean="${smsInstance}" field="folderName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${smsInstance?.smsId}">
				<li class="fieldcontain">
					<span id="smsId-label" class="property-label"><g:message code="sms.smsId.label" default="Sms Id" /></span>
					
						<span class="property-value" aria-labelledby="smsId-label"><g:fieldValue bean="${smsInstance}" field="smsId"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${smsInstance?.msg}">
				<li class="fieldcontain">
					<span id="msg-label" class="property-label"><g:message code="sms.msg.label" default="Msg" /></span>
					
						<span class="property-value" aria-labelledby="msg-label"><g:fieldValue bean="${smsInstance}" field="msg"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${smsInstance?.readState}">
				<li class="fieldcontain">
					<span id="readState-label" class="property-label"><g:message code="sms.readState.label" default="Read State" /></span>
					
						<span class="property-value" aria-labelledby="readState-label"><g:formatBoolean boolean="${smsInstance?.readState}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${smsInstance?.time}">
				<li class="fieldcontain">
					<span id="time-label" class="property-label"><g:message code="sms.time.label" default="Time" /></span>
					
						<span class="property-value" aria-labelledby="time-label"><g:formatDate date="${smsInstance?.time}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${smsInstance?.id}" />
					<g:link class="edit" action="edit" id="${smsInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
