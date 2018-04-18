<%@include file="/html/common/header.jsp"%>
<%@page import="com.mapple.ecommerce.web.controller.ParameterNames, java.util.*"%>



<%
	String error = (String) request.getAttribute("error");
	if (error!=null) {
		%><%=error%><%
	}
%>

  <div class="login">
  <h3><strong>INICIO DE SESI�N</strong></h3>
  <form class="px-4 py-3" action="/MappleWeb/SignInServlet" method="post">
    <div class="form-group">
      <label for="correo">Correo electr�nico</label>
      <input type="email" class="form-control" id="usuario" name="usuario" >
    </div>
    <div class="form-group">
      <label for="clave">Contrase�a</label>
      <input type="password" class="form-control" id="clave" name="clave" >
    </div>
    <div class="form-check">
      <input type="checkbox" class="form-check-input" id="dropdownCheck">
      <label class="form-check-label" for="dropdownCheck">
        Recordarme
      </label>
    </div>
    <button type="submit" class="btn btn-primary">Iniciar Sesi�n</button>
  </form>
  <div class="dropdown-divider"></div>
  	<a class="dropdown-item" href="/MappleWeb/html/signup/signup.jsp">�A�n no tienes cuenta? Registrate</a>
</div>


<%@include file="/html/common/footer.jsp"%>