package e_Library_controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import e_Library_DAO.AdminDAO;
import e_Library_DAO.UserDAO;
import e_Library_connection.DbCon;
import e_Library_model.Admin;
import e_Library_model.User;

/**
 * Servlet implementation class LoginAdminServlet
 */
public class LoginAdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.sendRedirect("login.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset = UTF-8");
		try(PrintWriter out = response.getWriter()) {
			//out.print("this is test");
			String admin_email = request.getParameter("admin_email");
			String admin_pass = request.getParameter("admin_pass");

			try {
				AdminDAO admindao = new AdminDAO(DbCon.getConnection());
				Admin admin = admindao.adminLogin(admin_email, admin_pass);
				
				if(admin != null) {
					request.getSession().setAttribute("auth", admin);
					response.sendRedirect("mainPageAdmin.jsp");
				}else {
					out.print("admin login failed");
				}
			} catch (ClassNotFoundException | SQLException e) {
				
				e.printStackTrace();
			}
	}

	}

}
