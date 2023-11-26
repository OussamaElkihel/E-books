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

import e_Library_DAO.UserDAO;
import e_Library_connection.DbCon;
import e_Library_model.Book;
import e_Library_model.Favorites;
import e_Library_model.User;

/**
 * Servlet implementation class RemoveUserServlet
 */

public class RemoveUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RemoveUserServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int userId = Integer.parseInt(request.getParameter("id"));

        // Use UserDAO to remove the user from the database
        UserDAO uDao = null;
		try {
			uDao = new UserDAO(DbCon.getConnection());
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        uDao.delete(userId);

        // Redirect back to the Manage Users page after removal
        response.sendRedirect(request.getContextPath() + "/ManageUsers.jsp");
	}
	}

	

