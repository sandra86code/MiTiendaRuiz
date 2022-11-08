package com.jacaranda.servlet;

import java.io.IOException;
import java.time.LocalDate;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.codec.digest.DigestUtils;

import com.jacaranda.control.DaoUser;

/**
 * Servlet implementation class RegistrationServlet
 */
@WebServlet("/checkRegistration")
public class RegistrationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegistrationServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String nick = request.getParameter("nick");
		String password = request.getParameter("password");
		String name = request.getParameter("name");
		String surname = request.getParameter("surname");
		String date = request.getParameter("birth_date");
		String s = request.getParameter("sex");
		boolean admin = Boolean.parseBoolean(request.getParameter("admin"));
		if(nick!=null && !nick.isEmpty() && !nick.isBlank() && password!=null && !password.isEmpty() && !password.isBlank() 
				&& name!=null && !name.isEmpty() && !name.isBlank() && surname!=null && !surname.isEmpty() && !surname.isBlank()
				&& date!=null && s!=null){
			char sex = s.charAt(0);
			String encriptedPassword = DigestUtils.md5Hex(password);
			LocalDate birthDate = LocalDate.parse(date);
			try {
				DaoUser.addUser(nick, encriptedPassword, name, surname, birthDate, sex, admin);
			    response.sendRedirect("index.jsp");  
			}catch(Exception e) {
				String message = e.getMessage();
				response.sendRedirect("regError.jsp?msg=" + message);
			}
		}else {
			response.sendRedirect("regError.jsp?msg=Datos incorrectos");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}