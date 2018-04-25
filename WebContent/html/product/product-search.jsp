<%@include file="/html/common/header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="java.util.List, com.mapple.ecommerce.model.*, com.mapple.ecommerce.web.util.*, com.mapple.ecommerce.web.controller.*" %>

		<%
		String error= (String)request.getAttribute(AttributeNames.ERROR);
		if (error!=null) {
			%><%=error%><%
		}
		%>
		
		<h3><fmt:message key="busqueda" bundle="${messages}"/></h3>
		
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
		%>
		<div class="container" id="producto" >
		<% 
		for (Producto e: productos){
	    	%>
			  <div id="individual" class="card">
			    <img class="card-img-top" src="/MappleWeb/cms/poducto_<%=e.getCodProducto()%>.jpg" alt="Card image" style="width:50%;margin:auto;padding-top:10px;">
			    <div class="card-body" style="background-color:#e0e5e3">
			      <h4 class="card-title"><%=e.getNombre()%></h4>
			      <a href="/MappleWeb/ProductServlet?action=findById&id_producto=<%=e.getCodProducto()%>" class="btn btn-primary"><fmt:message key="ver_producto" bundle="${messages}"/></a>
      			<form name="informacionProducto" method="POST" action="/MappleWeb/ShoppingCartServlet" name="shopping_cart">
			          	<input type="hidden" name="nombreProducto" value="${request.getAttribute(ParameterNames.NOMBRE)}" >										
						<input type="hidden" name="id_producto" value="<%=e.getCodProducto() %>">
						<input  type="hidden" name="precio" value="<%=e.getPrecioUnitario() %>">	
			            <div class="elegir">
			            <input type="hidden" >								
			            	<button class="btn btn-primary" name="shopping_cart" value="anadir" style="float:right;" ><i class="fa fa-shopping-cart  "></i></button>
			            </div>
			      </form>
			    </div>
			  </div>
			
			<%
		}
		%>
		 </div>
		 <%
	}
%>


<%@include file="/html/common/footer.jsp"%>
