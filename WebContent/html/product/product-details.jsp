<%@include file="/html/common/header.jsp"%>
<%@ page import="com.mapple.ecommerce.model.*, com.mapple.ecommerce.service.*, com.mapple.ecommerce.service.impl.*, java.util.*" %>
	<div>
        <%    
        Long n = Long.valueOf(request.getParameter("id"));
        String i = request.getParameter("es");
        ProductoService productoService = new ProductoServiceImpl();
        Producto e = productoService.findById(n, i); %>
            <h3><%=e.getNombre()%></h3><br>
            <p><strong>ID:&nbsp;</strong><%=e.getCodProducto()%></p><br>
            <p><strong>CategoriaID:&nbsp;</strong><%=e.getCodCategoria()%></p><br>
            <p><strong>En Stock:&nbsp;</strong><%=e.getUnidadesEnStock()%></p><br>
            <p><strong>Precio:&nbsp;</strong><%=e.getPrecioUnitario()%></p><br>
             

     </div>       
<%@include file="/html/common/footer.jsp"%>