<%@include file="/html/common/header.jsp"%>

<h3>Autenticaci�n</h3>
<%
	String error = (String) request.getAttribute("error");
	if (error!=null) {
		%><%=error%><%
	}
%>
<form action="/MappleWeb/SignInServlet" method="post">
	<input type="text" name="usuario" placeholder="e-mail"/>
	<br/>
	<input type="password" name="clave" placeholder="Contrase�a"/>	
	<br/>  			
	<input type="submit" value="Submit">	
</form>

<%@include file="/html/common/footer.jsp"%>