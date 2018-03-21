package com.mapple.ecommerce.web.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mapple.ecommerce.model.Usuario;
import com.mapple.ecommerce.service.UsuarioService;
import com.mapple.ecommerce.service.impl.UsuarioServiceImpl;
import com.mapple.ecommerce.util.PasswordEncryptionUtil;
import com.mapple.ecommerce.web.util.SessionManager;

/**
 * Servlet para Autentification.
 */

@WebServlet("/SignInServlet")
public class SignInServlet extends HttpServlet {    

	private UsuarioService usuarioService = null;
	
    public SignInServlet() {
        super();
        usuarioService = new UsuarioServiceImpl();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		String email = request.getParameter(ParameterNames.USUARIO);
		String clave = request.getParameter(ParameterNames.CLAVE);
					
		String target = null;
		boolean redirect = false;
		try {
			Usuario usuario = usuarioService.findById(email);			
			if (usuario==null) {
				request.setAttribute(AttributeNames.ERROR, AttributeNames.USER_NOT_FOUND_ERROR);
				target = ViewsPaths.SIGN_IN;
			} else {	
				if (!PasswordEncryptionUtil.checkPassword(clave,usuario.getClave())) {
					request.setAttribute(AttributeNames.ERROR, "Contraseña incorrecta");			
					target = ViewsPaths.SIGN_IN;
				} else {
					SessionManager.set(request, SessionAttributeNames.USUARIO, usuario);
					target = ViewsPaths.INDEX;
					
					// Explicar mejor redirect aqui y por que
					
					redirect = true;
				}
			}
			if (redirect) {
				response.sendRedirect(target);
			} else {
				request.getRequestDispatcher(target).forward(request, response);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			// TODO Pendiente de explicar
		}
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
