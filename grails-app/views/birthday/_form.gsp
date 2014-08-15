<%@ page import="demo.Birthday" %>



<div class="fieldcontain ${hasErrors(bean: birthdayInstance, field: 'date', 'error')} required">
	<label for="date">
		<g:message code="birthday.date.label" default="Date" />
		<span class="required-indicator">*</span>
	</label>
	${birthdayInstance?.date}
</div>

<div class="fieldcontain ${hasErrors(bean: birthdayInstance, field: 'day', 'error')} required">
	<label for="day">
		<g:message code="birthday.day.label" default="Day" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="day" type="number" value="${birthdayInstance.day}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: birthdayInstance, field: 'month', 'error')} required">
	<label for="month">
		<g:message code="birthday.month.label" default="Month" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="month" type="number" value="${birthdayInstance.month}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: birthdayInstance, field: 'year', 'error')} required">
	<label for="year">
		<g:message code="birthday.year.label" default="Year" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="year" type="number" value="${birthdayInstance.year}" required=""/>
</div>

