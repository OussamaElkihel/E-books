package e_Library_controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;

import e_Library_DAO.BookDAO;

import e_Library_connection.DbCon;


/**
 * Servlet implementation class RemoveBookServlet
 */

public class RemoveBookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int bookId = Integer.parseInt(request.getParameter("id"));
		// Use UserDAO to remove the user from the database
        BookDAO bDao = null;
		try {
			bDao = new BookDAO(DbCon.getConnection());
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        bDao.delete(bookId);

        // Redirect back to the Manage Users page after removal
        response.sendRedirect(request.getContextPath() + "/ManageBooks.jsp");
	}


}
