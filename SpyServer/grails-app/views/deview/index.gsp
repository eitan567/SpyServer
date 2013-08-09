
<%@ page import="com.xaviar.domain.Sms"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'sms.label', default: 'Sms')}" />
<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>
	<a href="#list-all" class="skip" tabindex="-1"><g:message
			code="default.link.skip.label" default="Skip to content&hellip;" /></a>
	<div class="nav" role="navigation"
		style="direction: ltr !important; text-align: left !important;">
		<ul>
			<li><a class="home" href="${createLink(uri: '/')}"><g:message
						code="default.home.label" /></a></li>
			<li><g:link class="clearAll" action="clear">Clear All Data</g:link></li>
		</ul>
	</div>
	<div id="list-all" class="content scaffold-all" role="main"
		style="direction: ltr !important; text-align: left !important; height: 640px; margin: auto; overflow-y: auto;">		
		<div class="innerAllList">
			<g:if test="${flash.message}">
				<div class="message" role="status">
					${flash.message}
				</div>
			</g:if>
			<g:each in="${datalists}" status="i" var="datalist">
				<h1 style="background: url('../images/skin/sorted_desc.gif') no-repeat scroll 0 10px transparent;font-weight: bold;padding-left: 20px;text-align: left;cursor: pointer;" onclick="jQuery('#${tables.get(i)}').toggle()">					
					<div>${tables.get(i)} (${datalist.size}) <g:link class="clear" action="clearme" id="${i}" style="font-size:16px;color:red;">clear data</g:link></div>
				</h1>
				<table id="${tables.get(i)}" style="display:none;" class="emoji">
					<thead>
						<tr>
							<g:each in="${columns[i]}" status="g" var="key">
								<g:sortableColumn property="name" title="${key}" style="background-color:#e0e0e0;background-image:none;"/>
							</g:each>
						</tr>
					</thead>
					<tbody>
						<g:each in="${datalist}" status="t" var="data">
							<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
								<g:each in="${data.keySet()}" status="g" var="key">
									<td>
										${data[key]}
									</td>
								</g:each>
							</tr>
						</g:each>
					</tbody>
				</table>
			</g:each>
		</div>
	</div>
</body>