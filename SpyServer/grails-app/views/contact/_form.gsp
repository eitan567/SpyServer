<%@ page import="com.org.krams.domain.Contact" %>



<div class="fieldcontain ${hasErrors(bean: contactInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="contact.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${contactInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: contactInstance, field: 'number', 'error')} ">
	<label for="number">
		<g:message code="contact.number.label" default="Number" />
		
	</label>
	<g:textField name="number" value="${contactInstance?.number}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: contactInstance, field: 'type', 'error')} ">
	<label for="type">
		<g:message code="contact.type.label" default="Type" />
		
	</label>
	<g:textField name="type" value="${contactInstance?.type}"/>
</div>

