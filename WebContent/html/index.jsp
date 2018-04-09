<%@page import="org.apache.commons.lang3.builder.ToStringBuilder"%>
<%@page import="com.mapple.ecommerce.web.controller.AttributeNames, java.util.*"%>
<%@include file="/html/common/header.jsp"%>



	<div>
				<h1>Top Ventas</h1>
				<ul>
			<%
			List<Producto> topProductos = (List<Producto>) request.getAttribute(AttributeNames.TOP_PRODUCTOS);
				Producto producto = null;
				for (Producto p: topProductos){
					producto = (Producto) p;
			%><li><%=p.getNombre()%></li>
			</ul>
			<%}%>
			</div>
			
			<div>
				<h1>En Stock</h1>
				<ul>
			<%
			List<Producto> masStock = (List<Producto>) request.getAttribute(AttributeNames.STOCK_PRODUCTOS);
			for (Producto p: masStock){
				producto = (Producto) p;
			%><li>Unidades en Stock: <%=p.getUnidadesEnStock()%></li>
				</ul>
			
			<%}%>
			</div>
	 
<%@include file="/html/common/footer.jsp"%>