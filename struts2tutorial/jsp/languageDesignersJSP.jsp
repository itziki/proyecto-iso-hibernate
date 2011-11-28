<%@ page contentType="text/html;charset=UTF-8" language="java" import="com.opensymphony.xwork2.*, iso3.pt.*, java.util.*" %>
<%@ taglib prefix="s" uri="/struts-tags" %>

<%! 
LanguageDesignerAction action = (LanguageDesignerAction)ActionContext.getContext().getActionInvocation().getAction(); 
%>

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
		            <td class="nowrap"><s:property value="%{ fullName }"/></td>
		            <td class="nowrap"><s:property value="%{ nationality }"/></td>
		            <td class="nowrap"><s:property value="language"/></td>
		        </tr>
		    </s:iterator>
		</table>
		
		<s:actionerror />
		<s:actionmessage />
		<form action="/struts2tutorial/iso3/languageDesigners!selectDesigner.action" method="POST">
			<table>
			<tr><td><label><s:text name="label.languagedesigner.select"/></label></td>
				<td>
					<select name="selectedLanguageDesigner.fullName">
					<% 
						List<LanguageDesigner> designers = action.getLanguageDesigners();
						for (LanguageDesigner designer:designers) { %>
							<option value="<%= designer.getFullName() %>"><%= designer.getFullName() %></option> <%
						}
					%>
					</select>
				</td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="Entregar"/></td>
				<td colspan="2"><input type="submit" name="redirect-action:languageDesigners" value="Cancelar"/></td>
			</tr>	
		</form>
	</body>
</html>