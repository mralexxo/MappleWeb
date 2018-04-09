<%@include file="/html/common/header.jsp"%>
<%@page import="java.util.List, com.mapple.ecommerce.model.*, com.mapple.ecommerce.web.util.*, com.mapple.ecommerce.web.controller.*" %>

		<%
		String error= (String)request.getAttribute(AttributeNames.ERROR);
		if (error!=null) {
			%><%=error%><%
		}
		%>
<form action="/MappleWeb/ProductServlet" method="post">
	<input type="hidden" name="action" value="findByCriteria"/>
	<input type="text" name="nombre" placeholder="nombre" value="<%=request.getAttribute(ParameterNames.NOMBRE)%>"/>	 	
	<input type="number" min= "0" max="100000" name="desde" placeholder="desde" value="<%=request.getAttribute(ParameterNames.DESDE)%>" />	
	<input type="number" min= "0" max="100000" name="hasta" placeholder="hasta" value="<%=request.getAttribute(ParameterNames.HASTA)%>" /> 	 			
	 					
	<input type="submit" value="Submit">	
</form>

<%
	List<Producto> productos = (List<Producto>) (List<Producto>) request.getAttribute(AttributeNames.PRODUCTOS);
	if (productos!=null) {
		for (Producto e: productos){
	    	%>
	    	<li><a href="/MappleWeb/ProductServlet?action=findById&amp;id=<%=e.getCodProducto()%>"><%=e.getNombre()%> </a></li>
			<%
		}
	}
%>


<%@include file="/html/common/footer.jsp"%>
