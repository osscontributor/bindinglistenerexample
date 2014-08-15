
<%@ page import="demo.Birthday" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'birthday.label', default: 'Birthday')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-birthday" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-birthday" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="date" title="${message(code: 'birthday.date.label', default: 'Date')}" />
					
						<g:sortableColumn property="day" title="${message(code: 'birthday.day.label', default: 'Day')}" />
					
						<g:sortableColumn property="month" title="${message(code: 'birthday.month.label', default: 'Month')}" />
					
						<g:sortableColumn property="year" title="${message(code: 'birthday.year.label', default: 'Year')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${birthdayInstanceList}" status="i" var="birthdayInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${birthdayInstance.id}">${fieldValue(bean: birthdayInstance, field: "date")}</g:link></td>
					
						<td>${fieldValue(bean: birthdayInstance, field: "day")}</td>
					
						<td>${fieldValue(bean: birthdayInstance, field: "month")}</td>
					
						<td>${fieldValue(bean: birthdayInstance, field: "year")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${birthdayInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
