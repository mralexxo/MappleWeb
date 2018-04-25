<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.List, com.mapple.ecommerce.model.*, com.mapple.ecommerce.web.util.*, com.mapple.ecommerce.web.controller.*" %>


<%@page import="com.mapple.ecommerce.model.*" %>
<%@page import="com.mapple.ecommerce.web.util.*" %>

<fmt:setLocale value='${sessionScope["user-locale"]}' scope="session"/>
<fmt:setBundle basename = "resources.Messages" var = "messages" scope="session"/>
<c:set var="usuario" value='${sessionScope["usuario"]}' scope="session"/>
<c:set var="carrito" value='${sessionScope["shopping_cart"]}' scope="session"/>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content = "width = device-width, initial-scale = 1, shrink-to-fit = no">
    <meta http-equiv="x-ua-compatible" content="ie-edge">
    <link rel="shortcut icon" type="image/x-icon" href="/MappleWeb/images/static/logo.png">
    <title><fmt:message key="Titulo" bundle="${messages}"/></title>
    <link rel="stylesheet" href="/MappleWeb/css/search.css"> 
    <link rel="stylesheet" href="/MappleWeb/css/producto.css"> 
    <link rel="stylesheet" href="/MappleWeb/css/footer.css"> 
        <link rel="stylesheet" href="/MappleWeb/css/header.css"> 
    
      	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.0/css/font-awesome.min.css">
      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
	  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
	  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
  </head>
  
	<body>
	
		<div class="container">

			<!-- Logo y titulo -->
		  <nav class="navbar navbar-light bg-light ">
		    <a class="navbar-brand" href="/MappleWeb/IndexServlet">
		      <img src="/MappleWeb/images/static/logo.png" width="30" height="30" class="d-inline-block align-top" alt="Logo">
		      <fmt:message key="Titulo" bundle="${messages}"/>	
		    </a>
		  </nav>	
			
		<nav class="navbar navbar-expand-lg navbar-dark bg-dark " >
		
		  <div class="collapse navbar-collapse" id="navbarSupportedContent">
		    <ul class="navbar-nav mr-auto">
		      <li class="nav-item active">
		        <a class="nav-link" href="/MappleWeb/ProductServlet?action=findCategoria&categoria=1"><fmt:message key="phones" bundle="${messages}"/>	 </a>
		      </li>
		      <li class="nav-item active">
		        <a class="nav-link" href="/MappleWeb/ProductServlet?action=findCategoria&categoria=2">Tablets </a>
		      </li>
		      <li class="nav-item active">
		        <a class="nav-link" href="/MappleWeb/ProductServlet?action=findCategoria&categoria=3"><fmt:message key="portatiles" bundle="${messages}"/> </a>
		      </li>
		      <li class="nav-item active">
		        <a class="nav-link" href="/MappleWeb/ProductServlet?action=findCategoria&categoria=4"><fmt:message key="accesorios" bundle="${messages}"/> </a>
		      </li>
		      <li class="nav-item dropdown">
			    <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false"><fmt:message key="idioma" bundle="${messages}"/></a>
			    <div class="dropdown-menu">
			      <a class="dropdown-item" href="/MappleWeb/UserServlet?action=change-locale&locale=es">Español</a>
			      <div class="dropdown-divider"></div>
			      <a class="dropdown-item" href="/MappleWeb/UserServlet?action=change-locale&locale=en">English</a>
			    </div>
			  </li>
			  <c:choose>  
				<c:when test="${not empty usuario}">
				<ul class="nav nav-pills dropdown">
				  <li class="nav-item dropdown">
				    <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">${usuario.getNombre()}</a>
				    <div class="dropdown-menu">
				      <a class="dropdown-item" href="#"><fmt:message key="perfil" bundle="${messages}"/></a>
				      <div class="dropdown-divider"></div>
				      <a class="dropdown-item" href="/MappleWeb/SignOutServlet"><fmt:message key="salir" bundle="${messages}"/></a>
				    </div>
				  </li>
				  </ul>
				 </c:when>
				 <c:otherwise>  
				 	<li class="nav-item dropdown">
				    <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false"><fmt:message key="autenticacion" bundle="${messages}"/></a>
				    <div class="dropdown-menu">
				      <a class="dropdown-item" href="/MappleWeb/html/signin/signin.jsp"><fmt:message key="inicioSesion" bundle="${messages}"/></a>
				      <div class="dropdown-divider"></div>
				      <a class="dropdown-item" href="/MappleWeb/html/signup/signup.jsp"><fmt:message key="registro" bundle="${messages}"/></a>
				    </div>
				  </li>
				 </c:otherwise>  
				</c:choose>
			</ul>


<%-- 			<!-- Carrito -->
				<div class="shopping-cart">			
				<%@include file="/html/cart/shopping-cart-resume.jsp"%>						
				</div>	 --%>
			<ul class="nav navbar-nav navbar-right">
		    <li><form class="form-inline my-2 my-lg-0" action="/MappleWeb/ProductServlet?action=findByCriteria" method="post">
		    	<input type="hidden" name="action" value="findByCriteria"/>
		      <input name="nombre" value="${request.getAttribute(ParameterNames.NOMBRE)}" class="form-control mr-sm-2" type="search" placeholder=<fmt:message key="search-input" bundle="${messages}"/> />
		      <input class="btn" type="submit" style="display:none"></input>
		      <!--	<input type="submit" value="<fmt:message key="buscar" bundle="${messages}"/>"/> -->
		   	</form></li> 
			<li>
				<a href="#" >
					<button class="cart cd-cart" id="carrito" style="border:none; background-color:transparent;">
						<i class="cart__icon fa fa-shopping-cart"></i>
						<span class="text-hidden"></span>
						<c:choose>
							<c:when test="${carrito==null || carrito.numeroLineas()==0}">
								<span class="cart__count">0</span>
							</c:when>
							<c:otherwise>
								<span class="cart__count">${carrito.numeroLineas()}</span>									
							</c:otherwise>
						</c:choose>
					</button>
				</a>
			</li>
			</ul>
		  </div>
		</nav>
		</div>
	<!--Modal carrito -->
		<div id="carrito" >
			<div class="shopping-cart cd-cart-container empty">
				<div class="shopping-cart-header">
					<i class="fa fa-shopping-cart cart-icon"></i>
						<c:choose>
							<c:when test="${carrito==null || carrito.numeroLineas()==0}">
								<span class="badge">0</span>										
							</c:when>
							<c:otherwise>
								<span class="badge">${carrito.numeroLineas()}</span>
							</c:otherwise>
						</c:choose>
					<div class="shopping-cart-total">	
						<c:choose>
							<c:when test="${carrito==null || carrito.numeroLineas()==0}">
								<span class="lighter-text">Total:</span> <span class="main-color-text">0€</span>										
							</c:when>
							<c:otherwise>
								<span class="lighter-text">Total:</span> <span class="main-color-text">${carrito.getTicketTotal()}€</span>	
							</c:otherwise>
						</c:choose>				
					</div>
				</div>
				<!--end shopping-cart-header -->

				<ul class="pre-scrollable shopping-cart-items" >
				<c:choose>
					<c:when test="${carrito!=null && carrito.numeroLineas()!=0}">
						<c:forEach items="${carrito.getLines()}" var="lineas">
								<li class="clearfix"><img src="/MappleWeb/cms/poducto_${lineas.getProduct().getCodProducto()}.jpg" alt="{lineas.getProduct().getNombre()}" width="120" height="60">
									<span class="item-price">${lineas.getProduct().getNombre()}</span>
									<span class="item-price">${lineas.getProduct().getPrecioUnitario()}$</span>
									<form name="informacionProducto" method="POST" action="/GZoneWeb/ShoppingCartServlet" name="shopping-cart">
										<span><button type="submit" class="fa fa-close " name="shopping-cart" value="eliminar" style="color:red;background-color:transparent"></button></span>
										<input type="hidden" name="idProducto" value="${lineas.getProduct().getCodProducto()}"  />
									</form>
								</li>
						</c:forEach>
						<li><a href="/GZoneWeb/html/shopping/shopping.jsp"><button type="button" id="cerrado" class="btn btn-lg btn-primary">Checkout</button></a></li>										
					</c:when>
					<c:otherwise>
						<li class="clearfix caritacentrada"><i class="fa fa-frown-o" aria-hidden="true" style="font-size:56px;padding-left: 115px;"></i><p><fmt:message key="cart.carrito" bundle="${messages}"/></p></li>
						<li><button type="button" id="cerrado" class="btn btn-lg btn-primary" disabled>Checkout</button></li>		
					</c:otherwise>
				</c:choose>	
						
				</ul>
			</div>
		<!--end shopping-cart -->
	</div>
		<!-- Inicio del frame / tile / sección de contenido -->
					
		<div class="container">
			
		