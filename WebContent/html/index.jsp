<%@page import="org.apache.commons.lang3.builder.ToStringBuilder"%>
<%@page import="com.mapple.ecommerce.web.controller.AttributeNames, java.util.*"%>
<%@include file="/html/common/header.jsp"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>



	<div>
				<h1>Top Ventas</h1>
				<ul>
			<%
			List<Producto> topProductos = (List<Producto>) request.getAttribute(AttributeNames.TOP_PRODUCTOS);
			
			
			if (topProductos!=null) {
				for (Producto p: topProductos){
			      %><li><%=p.getNombre()%></li>			
			 <% } 
			 } %>
			 
			 
			 <c:set var="topProductos" value ="${requestScope.top_productos}" scope= "page"/>
			 
			 
			 <ul>
			 <c:if test="${not empty topProductos}">
			 <c:forEach items="${topProductos}" var="p">
			 	<li><c:out value="${p.nombre}"/></li>
			 </c:forEach>
			 </c:if>
			 </ul>
			 
			 
			 </ul>
			</div>
			
			<div>
				<h1>En Stock</h1>
				<ul>
			<%
			List<Producto> masStock = (List<Producto>) request.getAttribute(AttributeNames.STOCK_PRODUCTOS);
			if (masStock!=null) {
			for (Producto p: masStock){				
			%><li>Unidades en Stock: <%=p.getUnidadesEnStock()%></li>
			<% } 
			} %>
			</ul>
			</div>
	 
<%@include file="/html/common/footer.jsp"%>