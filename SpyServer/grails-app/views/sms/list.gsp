
<%@ page import="com.xaviar.Sms" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'sms.label', default: 'Sms')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>		
		<a href="#list-sms" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-sms" class="content scaffold-list" role="main" style="direction: ltr;
																			    float: left;
																			    height: 640px;
																			    margin: auto;
																			    overflow-y: auto;
																			    width: 57%;
																			    padding-left: 20px;">
			<h1><g:message code="sms.list.label"/></h1>																    
			<div class="innerSMSList">			
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>			
			<g:each in="${smsInstanceList}" status="i" var="smsInstance">
				<blockquote class="${(i % 2) != 0 ? 'example-right' : 'example-obtuse'}"><p class="emoji">${fieldValue(bean: smsInstance, field: "msg")}<div class="smsDateTime"><g:formatDate date="${smsInstance.time}"  type="datetime" style="LONG" timeStyle="SHORT" locale="HE"/></div></p></blockquote><p>${fieldValue(bean: smsInstance, field: "address")}</p>
			</g:each>	
			</div>		
		</div>
		<div id="list-contact" class="content scaffold-list" role="main" style="direction: ltr;
																			    float: right;
																			    height: 640px;
																			    margin: auto;
																			    overflow-y: auto;
																			    width: 40%;">
			<h1><g:message code="contacs.list.label"/></h1>																    
			<div class="innerContactList">
				<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
				</g:if>			
				<g:each in="${contactInstanceList}" status="i" var="contactInstance">
					<div style="float:right;width:40%;padding-right:20px;"><g:link action="show" id="${contactInstance.id}">${fieldValue(bean: contactInstance, field: "name")}</g:link></div>
					<div style="float:left;width:50%;direction:ltr;">${fieldValue(bean: contactInstance, field: "number")}</div>
				</g:each>
			</div>			
		</div>		
	</body>	
	<script type="text/javascript">
    $('.emoji').emoji(24); // Set the size for rendering here
</script>
</html>
