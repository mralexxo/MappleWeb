<%@page import="com.mapple.ecommerce.web.controller.ParameterNames, java.util.*"%>
<%@include file="/html/common/header.jsp"%>


<div class="login">
<h3><strong>REGISTRO</strong></h3>

  <form class="px-4 py-3" action="/MappleWeb/UserServlet" method="POST">  
  	
       <input type="hidden" name="<%=ParameterNames.ACTION%>" value="<%=ParameterNames.SIGNUP%>"/>
    <div class="form-group">
      <label for="nombre">Nombre</label>
      <input type="text" class="form-control" id="nombre" name="<%=ParameterNames.NOMBRE%>" >
    </div>
    <div class="form-group">
      <label for="Apellidos">Apellidos</label>
      <input type="text" class="form-control" id="surname" name="<%=ParameterNames.APELLIDOS%>"  >
    </div>
    <div class="form-group">
      <label for="telefono">Telefono</label>
      <input type="text" class="form-control" id="telefono" name="<%=ParameterNames.TELEFONO %>" >
    </div>
    <div class="form-group">
      <label for="correo">Correo electrónico</label>
      <input type="email" class="form-control" id="email" name="<%=ParameterNames.EMAIL %>">
    </div>
    <div class="form-group">
      <label for="clave">Contraseña</label>
      <input type="password" class="form-control" id="password" name="<%=ParameterNames.CLAVE%>" >
    </div>
    <div class="form-check">
      <input type="checkbox" class="form-check-input" id="dropdownCheck">
      <label class="form-check-label" for="dropdownCheck">
        Recordarme
      </label>
    </div>
    <button type="submit" class="btn btn-primary">Registrarse</button>
  </form>
  <div class="dropdown-divider"></div>
  <a class="dropdown-item" href="/MappleWeb/html/signin/signin.jsp">¿Ya tienes cuenta? Iniciar Sesión</a>
</div>

<%@include file="/html/common/footer.jsp"%>