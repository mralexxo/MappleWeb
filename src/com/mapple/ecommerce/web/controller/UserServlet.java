package com.mapple.ecommerce.web.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import com.mapple.ecommerce.model.Usuario;
import com.mapple.ecommerce.service.UsuarioService;
import com.mapple.ecommerce.service.impl.UsuarioServiceImpl;
import com.mapple.ecommerce.util.PasswordEncryptionUtil;
import com.mapple.ecommerce.util.ToStringUtil;
import com.mapple.ecommerce.web.util.CookieManager;
import com.mapple.ecommerce.web.util.SessionManager;

/**
 * Servlet implementation class UserServlet
 */

@WebServlet("/UserServlet")
public class UserServlet extends HttpServlet {
	private static Logger logger = LogManager.getLogger(UserServlet.class.getName());
	private UsuarioService usuarioService = null;
       
	public UserServlet() {
		super();
		usuarioService = new UsuarioServiceImpl();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter(ParameterNames.ACTION);		
		try {
			if (ParameterNames.SIGNUP.equalsIgnoreCase(action)) {
				Usuario u = new Usuario();
				u.setNombre(request.getParameter(ParameterNames.NOMBRE)); 
				u.setApellidos(request.getParameter(ParameterNames.APELLIDOS));
				u.setCorreoUsuario(request.getParameter(ParameterNames.EMAIL));
				//u.setDireccion(request.getParameter(ParameterNames.DIRECCION));
				u.setClave(PasswordEncryptionUtil.encryptPassword(request.getParameter(ParameterNames.CLAVE)));

				if (logger.isDebugEnabled()) {
					logger.debug("Usuario: " + ToStringUtil.toString(u));
				}

				usuarioService.create(u);
				response.sendRedirect(request.getContextPath()+ViewsPaths.SIGN_IN);
			}
		}catch (Throwable e) {			
			logger.error(e.getMessage(),e);
			request.setAttribute(AttributeNames.ERROR, e.getMessage());
			request.getRequestDispatcher(ViewsPaths.SIGN_UP).forward(request, response);
		}
		
		/*
		if (ParameterNames.SIGNIN.equalsIgnoreCase(action)) {
			String userName = request.getParameter(ParameterNames.NOME);
			String password = request.getParameter(ParameterNames.PASSWORD);
						
			String target = null;
			boolean redirect = false;
			try {
				Usuario usuario = usuarioService.findUserById(userName);			
				if (usuario==null) {
					request.setAttribute(AttributeNames.ERROR, AttributeNames.USER_NOT_FOUND_ERROR);
					target = ViewsPaths.SIGN_IN;
				} else {				
					if (!PasswordEncryptionUtil.checkPassword(password,usuario.getContrasinal())) {
						request.setAttribute(AttributeNames.ERROR, "Contraseña incorrecta");			
						target = ViewsPaths.SIGN_IN;
					} else {
						SessionManager.set(request, SessionAttributeNames.USER, usuario);
						CookieManager.addCookie(response, "login", usuario.getEmail(), "/", 30*24*60*60);
						target = ViewsPaths.INDEX;
						redirect = true;
					}
				}
				if (redirect) {
					response.sendRedirect(request.getContextPath()+ViewsPaths.INDEX);
				} else {
					request.getRequestDispatcher(target).forward(request, response);
				}
				
			} catch (Exception e) {
				logger.error(e.getMessage(),e);
				request.setAttribute(AttributeNames.ERROR, e.getMessage());
				request.getRequestDispatcher(ViewsPaths.SIGN_IN).forward(request, response);
			}
			
		}
		*/
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		doGet(request, response);
	}
	
	public static void main (String args[]) {
		
		System.out.println(PasswordEncryptionUtil.encryptPassword(""));
		
	}

}
