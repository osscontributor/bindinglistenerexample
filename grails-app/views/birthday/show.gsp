
<%@ page import="demo.Birthday" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'birthday.label', default: 'Birthday')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-birthday" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-birthday" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list birthday">
			
				<g:if test="${birthdayInstance?.date}">
				<li class="fieldcontain">
					<span id="date-label" class="property-label"><g:message code="birthday.date.label" default="Date" /></span>
					
						<span class="property-value" aria-labelledby="date-label"><g:formatDate date="${birthdayInstance?.date}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${birthdayInstance?.day}">
				<li class="fieldcontain">
					<span id="day-label" class="property-label"><g:message code="birthday.day.label" default="Day" /></span>
					
						<span class="property-value" aria-labelledby="day-label"><g:fieldValue bean="${birthdayInstance}" field="day"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${birthdayInstance?.month}">
				<li class="fieldcontain">
					<span id="month-label" class="property-label"><g:message code="birthday.month.label" default="Month" /></span>
					
						<span class="property-value" aria-labelledby="month-label"><g:fieldValue bean="${birthdayInstance}" field="month"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${birthdayInstance?.year}">
				<li class="fieldcontain">
					<span id="year-label" class="property-label"><g:message code="birthday.year.label" default="Year" /></span>
					
						<span class="property-value" aria-labelledby="year-label"><g:fieldValue bean="${birthdayInstance}" field="year"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:birthdayInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${birthdayInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
