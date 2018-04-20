<%@include file="/html/common/header.jsp"%>
<%@ page import="com.mapple.ecommerce.model.*, com.mapple.ecommerce.service.*, com.mapple.ecommerce.service.impl.*, java.util.*" %>
	
	<%
	Producto producto = (Producto) request.getAttribute("producto");
		%>
	<div id="fondo">
	<div class="articulo">
	    <div class="titulo">
	      <h1><%=producto.getNombre() %></h1>
	      <hr>
	    </div>
	    <div class="izquierda">
	      
	      <div class="descripcion">
	        <img src="/MappleWeb/cms/poducto_<%=producto.getCodProducto()%>.jpg"></img>
	        <p > 
	           <%=producto.getDescripcion() %>
	        </p>    
	 
	          </div>
	          
	        </div>
	
	        <div class="derecha">
	          <div class="comprar">
		          <form name="informacionProducto" method="POST" action="/MappleWeb/ShoppingCartServlet" name="shopping_cart">
			          	<input type="hidden" name="nombreProducto" value="${producto.getNombre()}" >										
						<input type="hidden" name="id_producto" value="${producto.getCodProducto()}">
						<input  type="hidden" name="precio" value="${producto.getPrecioUnitario()}">	
			            <div class="elegir">
			            <input type="hidden" value>
							<p><%=producto.getPrecioUnitario() %>0$</p>
								
			            	<button class="btn btn-primary" name="shopping_cart" value="anadir"><i class="fa fa-shopping-cart  "></i><fmt:message key="add" bundle="${messages}"/></button>
			            </div>
			      </form>
	          </div>
         </div>
         </div>
	

</div>       
<%@include file="/html/common/footer.jsp"%>