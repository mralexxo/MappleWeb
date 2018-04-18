package com.mapple.ecommerce.web.controller;

import java.io.IOException;
import java.util.List;
import java.util.Locale;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import com.mapple.ecommerce.model.Usuario;
import com.mapple.ecommerce.service.MailService;
import com.mapple.ecommerce.service.UsuarioService;
import com.mapple.ecommerce.service.impl.MailServiceImpl;
import com.mapple.ecommerce.service.impl.UsuarioServiceImpl;
import com.mapple.ecommerce.util.PasswordEncryptionUtil;
import com.mapple.ecommerce.util.ToStringUtil;
import com.mapple.ecommerce.web.util.CookieManager;
import com.mapple.ecommerce.web.util.LocaleManager;
import com.mapple.ecommerce.web.util.SessionManager;
import com.mapple.ecommerce.web.util.WebConstants;

/**
 * Servlet implementation class UserServlet
 */

@WebServlet("/UserServlet")
public class UserServlet extends HttpServlet {
	private static Logger logger = LogManager.getLogger(UserServlet.class.getName());
	private UsuarioService usuarioService = null;
    private MailService mailService = null;
	
	public UserServlet() {
		super();
		usuarioService = new UsuarioServiceImpl();
		mailService= new MailServiceImpl();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter(ParameterNames.ACTION);		
		String target = null;
		boolean redirect = false;

		try {
			if (ParameterNames.SIGNUP.equalsIgnoreCase(action)) {
				Usuario u = new Usuario();
				u.setNombre(request.getParameter(ParameterNames.NOMBRE)); 
				u.setApellidos(request.getParameter(ParameterNames.APELLIDOS));
				u.setCorreoUsuario(request.getParameter(ParameterNames.EMAIL));
				u.setTelefono(Integer.parseInt(request.getParameter(ParameterNames.TELEFONO)));
				u.setClave(PasswordEncryptionUtil.encryptPassword(request.getParameter(ParameterNames.CLAVE)));
				
				if (logger.isDebugEnabled()) {
					logger.debug("Usuario: " + ToStringUtil.toString(u));
				}
				Usuario correo = new Usuario();
				correo=usuarioService.create(u);
				
				if (correo!=null) {
					System.out.println(u.getCorreoUsuario());
					mailService.sendMail("Bienvenid@, te has registrado con �xito a Mapple.","Mensaje importante de Mapple Incorporation" , request.getParameter(ParameterNames.EMAIL));
				}
				response.sendRedirect(request.getContextPath()+ViewsPaths.SIGN_IN);
			}
		}catch (Throwable e) {			
			logger.error(e.getMessage(),e);
			request.setAttribute(AttributeNames.ERROR, e.getMessage());
			request.getRequestDispatcher(ViewsPaths.SIGN_UP).forward(request, response);
		}
		if (Actions.CHANGE_LOCALE.equalsIgnoreCase(action)) {
			String localeName = request.getParameter(ParameterNames.LOCALE);
			// Recordar que hay que validar... lo que nos envian, incluso en algo como esto.
			// Buscamos entre los Locale soportados por la web:
			List<Locale> results = LocaleManager.getMatchedLocales(localeName);
			Locale newLocale = null;
			
			if (results.size()>0) {
				newLocale = results.get(0);
			} else {
				logger.warn("Request locale not supported: "+localeName);
				newLocale = LocaleManager.getDefault();
			}

			SessionManager.set(request, WebConstants.USER_LOCALE, newLocale);			
			CookieManager.addCookie(response, WebConstants.USER_LOCALE, newLocale.toString(), "/", 365*24*60*60);

			if (logger.isDebugEnabled()) {
				logger.debug("Locale changed to "+newLocale);
			}

			target = request.getHeader("referer"); // Ejercicio: como hacer que siga en la misma URL		
			redirect = true;
			response.sendRedirect(target);

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
						request.setAttribute(AttributeNames.ERROR, "Contrase�a incorrecta");			
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

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		doGet(request, response);
	}
	
	public static void main (String args[]) {
		
		System.out.println(PasswordEncryptionUtil.encryptPassword(""));
		
	}

}
