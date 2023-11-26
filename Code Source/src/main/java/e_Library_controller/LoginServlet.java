package e_Library_controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import e_Library_DAO.UserDAO;
import e_Library_connection.DbCon;
import e_Library_model.User;

/**
 * Servlet implementation class LoginServlet
 */

public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.sendRedirect("login.jsp");
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset = UTF-8");
		try(PrintWriter out = response.getWriter()) {
			//out.print("this is test");
			String email = request.getParameter("email");
			String password = request.getParameter("pass");

			try {
				UserDAO udao = new UserDAO(DbCon.getConnection());
				User user = udao.userLogin(email, password);
				
				if(user != null) {
					request.getSession().setAttribute("auth", user);
					response.sendRedirect("mainPage.jsp");
				}else {
					out.print("user login failed");
				}
			} catch (ClassNotFoundException | SQLException e) {
				
				e.printStackTrace();
			}
	}

}
}
