<%@include file="/html/common/header.jsp"%>
<%@page import="java.util.List, com.mapple.ecommerce.model.*, com.mapple.ecommerce.web.model.*, com.mapple.ecommerce.web.util.*, com.mapple.ecommerce.web.controller.*" %>

		<%
		String error= (String)request.getAttribute(AttributeNames.ERROR);
		if (error!=null) {
			%><%=error%><%
		}
		%>
<form action="/MappleWeb/ProductServlet" method="post">

	<input type="text" name="nombre" placeholder="nombre"/>	 	
	<input type="number" min= "0" max="100000" name="desde" placeholder="desde"/>	
	<input type="number" min= "0" max="100000" name="hasta" placeholder="hasta"/>	 			
	 					
	<input type="submit" value="Submit">	
</form>

<%
	List<Producto> productos = (List<Producto>) (List<Producto>) request.getAttribute(AttributeNames.PRODUCTOS);
	if (productos!=null) {
		for (Producto e: productos){
	    	%>
	    	<li><a href="/MappleWeb/html/product/product-details.jsp?id=<%=e.getCodProducto()%>"><%=e.getNombre()%> </a></li>
			<%
		}
	}
%>


<%@include file="/html/common/footer.jsp"%>
