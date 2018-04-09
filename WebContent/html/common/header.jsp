<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<!-- Controlamos nosotros la inicializacion, en SessionManager -->
<%@page session="false"%>  

<%@page import="com.mapple.ecommerce.model.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<!-- imports de css, js -->
		<link rel="stylesheet" type="text/css" href="/MappleWeb/css/mapple.css">
	</head>
	<body>
		<div class="header">

			<a href="/MappleWeb/html/index.jsp">
				<img src="/MappleWeb/images/static/logo.png" height="60" width="60"></img>
				Mapple Inc.
							
			</a>	
			
		<div style="float:right;">
				
			<form action="/MappleWeb/ProductServlet" method="post">
				<input type="text" name="nombre" placeholder="Producto..."/>
				<input type="submit" value="Buscar"/>
			</form>			
			
		</div>	
			
			
			
			
			<!-- Tile de usuario -->
				<div class="user-data" >			
				<%@include file="/html/user/user-profile.jsp"%>						
				</div>		
		</div>
		
		<div class="bar">			
			<!-- Barra de navegación, Categorías, o similar -->
			<p>Telefonos | Tablets | Ordenadores | Accesorios </p>
		</div>
		
		<!-- Inicio del frame / tile / sección de contenido -->
		<div class="content">
		