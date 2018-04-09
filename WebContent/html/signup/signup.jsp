<%@include file="/html/common/header.jsp"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Registro</title>
</head>
<body>

      <form action="/MappleWeb/UserServlet" method="POST">
      	<strong>REGISTRO</strong>
      	<input type="hidden" name="<%=ParameterNames.ACTION%>" value="<%=ParameterNames.SIGNUP%>"/>
          <label for="nombre">Nombre:</label>
          <input type="text" name="<%=ParameterNames.NOMBRE%>" id="nobrme"/>
          <label for="apellidos">Apellidos:</label>
          <input type="text" name="<%=ParameterNames.APELLIDOS%>" id="apellidos"/>
          <label for="email">Correo electrónico:</label>
          <input type="text" name="<%=ParameterNames.EMAIL %>" id="email"/> 
          <label for="direccion">Fecha de nacemento:</label>
          <input type="text" name="<%=ParameterNames.DIRECCION%>" id="direccion"/>                                   
          <label for="clave">Introduzca la contraseña:</label>
          <input type="password" name="<%=ParameterNames.CLAVE%>" id="clave"/>  

                                           
          <input type="submit" value="Unirse" >
      </form>

</body>
</html>
<%@include file="/html/common/footer.jsp"%>