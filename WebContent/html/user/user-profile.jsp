<%@page import="com.mapple.ecommerce.model.*, com.mapple.ecommerce.web.model.*, com.mapple.ecommerce.web.util.*, com.mapple.ecommerce.web.controller.*" %>

<%

	Usuario usuario = (Usuario) SessionManager.get(request, SessionAttributeNames.USUARIO);
	if (usuario!=null) {
		%>
		<p><%=usuario.getNombre() + " "+usuario.getApellidos()%>
		<p><a href="/MappleWeb/SignOutServlet">Salir</a></p>
		<%
	} else {
		%>
		<a href="/MappleWeb/html/signin/signin.jsp">Identifícate</a>
		<%
	}
%>

