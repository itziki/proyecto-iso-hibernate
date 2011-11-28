<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
	<head>
	    <link href="<s:url value='/css/main.css'/>" rel="stylesheet" type="text/css"/>
	    <title><s:text name="label.languagedesigner.subject"/></title>
	</head>
	<body>
		<div class="titleDiv"><s:text name="application.languagedesigners.title"/></div>
		<h1><s:text name="label.languagedesigner.subject"/> <s:text name="label.languagedesigner.createdBy"/> <s:property value="author"/> </h1>
		<br/>
		<table>
			<tr>
				<td>
					<s:url id="urlLogout" action="showLogin" escapeAmp="false"/>
					<a href="<s:property value="#urlLogout"/>"><s:text name="label.languagedesigner.logout"/></a>
				</td>
			</tr>
		</table>
		<br/>
		<table class="borderAll">
		    <tr>
		        <th><s:text name="label.languagedesigner.fullName"/></th>
		        <th><s:text name="label.languagedesigner.nationality"/></th>
		        <th><s:text name="label.languagedesigner.language"/></th>
		        <th>&nbsp;&nbsp;</th>
		    </tr>
		    <s:iterator value="languageDesigners" status="status">
		        <tr class="<s:if test="#status.even">even</s:if><s:else>odd</s:else>">
		            <td class="nowrap"><s:property value="fullName"/></td>
		            <td class="nowrap"><s:property value="nationality"/></td>
		            <td class="nowrap"><s:property value="language"/></td>
					<s:if test="%{selectedLanguageDesigner.fullName == fullName}">
						<td class="nowrap">***</td>
					</s:if>
		        </tr>
		    </s:iterator>
		</table>
		
		<s:actionerror />
		<s:actionmessage />
		<s:form action="languageDesigners!selectDesigner" method="post">
		    <s:select name="selectedLanguageDesigner.fullName" list="languageDesigners" listKey="fullName" listValue="fullName" label="%{getText('label.languagedesigner.select')}"/>
		    <s:submit value="%{getText('button.label.submit')}"/>
		    <s:submit value="%{getText('button.label.cancel')}" name="redirect-action:languageDesigners"/>
		</s:form>
	</body>
</html>