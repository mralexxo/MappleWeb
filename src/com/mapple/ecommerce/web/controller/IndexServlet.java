package com.mapple.ecommerce.web.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import com.mapple.ecommerce.model.Producto;
import com.mapple.ecommerce.service.ProductoCriteria;
import com.mapple.ecommerce.service.ProductoService;
import com.mapple.ecommerce.service.impl.ProductoServiceImpl;
import com.mapple.ecommerce.web.util.SessionManager;
import com.mapple.ecommerce.web.util.WebConstants;

@WebServlet("/IndexServlet")
public class IndexServlet extends HttpServlet {
	
	private static Logger logger = LogManager.getLogger(IndexServlet.class.getName());
	private ProductoService productoService = null;
       
    public IndexServlet() {
        super();
        productoService = new ProductoServiceImpl();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		int n = 1;
		String target = null;
		String idioma = SessionManager.get(request,WebConstants.USER_LOCALE).toString().substring(0,2).toUpperCase();
		try{
		ProductoCriteria producto = new ProductoCriteria();	
		producto.setNombre(" ");
		List<Producto> masStock=productoService.findByCriteria(producto, n,15,idioma);

			
		request.setAttribute(AttributeNames.PRODUCTOS, masStock);
		
		request.getRequestDispatcher(ViewsPaths.INDEX).forward(request, response);
		}
		
		catch (Exception e){
			logger.error(e.getMessage(),e);
			request.setAttribute(AttributeNames.ERROR, e.getMessage());
			request.getRequestDispatcher(ViewsPaths.INDEX).forward(request, response);
		}
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		doGet(request, response);
	}

}