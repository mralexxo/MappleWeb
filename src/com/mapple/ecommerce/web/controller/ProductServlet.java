package com.mapple.ecommerce.web.controller;

import java.io.IOException;
import java.util.List;
import java.util.Locale;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import com.mapple.ecommerce.exceptions.DataException;
import com.mapple.ecommerce.model.Producto;
import com.mapple.ecommerce.service.ProductoCriteria;
import com.mapple.ecommerce.service.ProductoService;
import com.mapple.ecommerce.service.impl.ProductoServiceImpl;
import com.mapple.ecommerce.web.util.SessionManager;
import com.mapple.ecommerce.web.util.WebConstants;


@WebServlet("/ProductServlet")
public class ProductServlet extends HttpServlet {
	
	private static Logger logger = LogManager.getLogger(ProductServlet.class.getName());

	private ProductoService productoService = null;

	public ProductServlet () {
		super();
		productoService = new ProductoServiceImpl();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String target = null;
		String action =null;
		String idioma = SessionManager.get(request,WebConstants.USER_LOCALE).toString().substring(0,2).toUpperCase();

		action = request.getParameter(ParameterNames.ACTION);
		
		if (ParameterNames.FIND_BY_ID.equalsIgnoreCase(action)) {
			Long idProducto = Long.parseLong(request.getParameter(ParameterNames.ID_PRODUCTO)) ;	
			Producto productoDetail = new Producto();
			
			try {
			
			productoDetail = productoService.findById(idProducto, idioma);	
			if (productoDetail==null ) {
				request.setAttribute(AttributeNames.ERROR, AttributeNames.NOT_FOUND);
				target = ViewsPaths.INDEX_SERVLET;
			} else {	
				target = ViewsPaths.PRODUCT_DETAIL;
				request.setAttribute(ParameterNames.PRODUCTO, productoDetail);
			}
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		} else if (ParameterNames.FIND_BY_CRITERIA.equalsIgnoreCase(action)) {

			String nombre = request.getParameter(ParameterNames.NOMBRE);
			String desde = request.getParameter(ParameterNames.DESDE);	
			String hasta = request.getParameter(ParameterNames.HASTA);	
			

			// Para que aparezcan rellenos al volver a pintar la JSP
			request.setAttribute(ParameterNames.NOMBRE, nombre);
			request.setAttribute(ParameterNames.DESDE, desde);
			request.setAttribute(ParameterNames.HASTA, hasta);

			ProductoCriteria criteria = null;

			criteria  = new ProductoCriteria() ;
			criteria.setNombre(nombre);
			criteria.setPrecioDesde(StringUtils.isEmpty(desde)?0.0d:Double.valueOf(desde)); 
			criteria.setPrecioHasta(StringUtils.isEmpty(hasta)?Double.MAX_VALUE:Double.valueOf(hasta));

			try {
				List<Producto> productos = productoService.findByCriteria(criteria, 1, 15, idioma);	
				if (productos.isEmpty()) {
					request.setAttribute(AttributeNames.ERROR, AttributeNames.NOT_FOUND);
					target = ViewsPaths.SEARCH;
				} else {					
					request.setAttribute(AttributeNames.PRODUCTOS, productos);
					target = ViewsPaths.SEARCH;
				}

			} catch (Exception e) {
				logger.error(e);
				request.setAttribute(AttributeNames.ERROR, e.getMessage());
				target = ViewsPaths.SEARCH;			
			} 
		}else if (ParameterNames.FIND_BY_CATEGORIA.equalsIgnoreCase(action)) {
			Long categoria =Long.parseLong(request.getParameter(ParameterNames.CATEGORIA));
			//Creamos un objecto producto 
			ProductoCriteria busquedaCategoria = null;
			busquedaCategoria  = new ProductoCriteria() ;
			
			busquedaCategoria.setCodCategoria(categoria);
			
			try {
				List<Producto> productosCategoria = productoService.findByCriteria(busquedaCategoria,1,15,idioma);
				request.setAttribute(AttributeNames.PRODUCTOS, productosCategoria);
				target = ViewsPaths.SEARCH;

			} catch (DataException e) {
				target= ViewsPaths.INDEX_SERVLET;
				request.setAttribute("Error", "Ningun producto encontrado");
				request.getRequestDispatcher(target).forward(request,response);
			}
		}
		request.getRequestDispatcher(target).forward(request, response);

	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		doGet(request, response);
	}
}