package e_Library_controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import e_Library_model.Favorites;

/**
 * Servlet implementation class AddToFavServlet
 */
public class AddToFavServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html;charset=UTF-8");

        try (PrintWriter out = response.getWriter()) {
//        	out.print("add to cart servlet");

            ArrayList<Favorites> favList = new ArrayList<>();
            int id = Integer.parseInt(request.getParameter("id"));
            Favorites cm = new Favorites();
            cm.setId(id);
            HttpSession session = request.getSession();
            ArrayList<Favorites> fav_list = (ArrayList<Favorites>) session.getAttribute("fav_list");
            if (fav_list == null) {
                favList.add(cm);
                session.setAttribute("fav_list", favList);
                response.sendRedirect("action.jsp");
            } else {
            	favList = fav_list;

                boolean exist = false;
                for (Favorites c : fav_list) {
                    if (c.getId() == id) {
                        exist = true;
                        out.println("<h3 style='color:crimson; text-align: center'>Item Already in Favorites. <a href='favorites.jsp'>GO to Favorites Page</a></h3>");
                    }
                }

                if (!exist) {
                	favList.add(cm);
                    response.sendRedirect("action.jsp");
                }
            }
		
	
        	}

		}
	}
