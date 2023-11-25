package e_Library_controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import e_Library_model.Book;
import e_Library_model.Favorites;

/**
 * Servlet implementation class RemoveFavServlet
 */
@WebServlet("/rem-fav")
public class RemoveFavServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 
			response.setContentType("text/html;charset=UTF-8");
			try (PrintWriter out = response.getWriter()) {
				String bookId = request.getParameter("id");
				if (bookId != null) {
					ArrayList<Favorites> fav_list = (ArrayList<Favorites>) request.getSession().getAttribute("fav_list");
					if (fav_list != null) {
						for (Book c : fav_list) {
							if (c.getId() == Integer.parseInt(bookId)) {
								fav_list.remove(fav_list.indexOf(c));
								break;
							}
						}
					}
					response.sendRedirect("favorites.jsp");

				} else {
					response.sendRedirect("favorites.jsp");
				}

			}
		}
	}

