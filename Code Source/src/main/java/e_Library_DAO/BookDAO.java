package e_Library_DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import e_Library_model.Book;
import e_Library_model.Favorites;

public class BookDAO {
	
	private Connection con;

	private String query;
    private PreparedStatement pst;
    private ResultSet rs;
    

	public BookDAO(Connection con) {
		super();
		this.con = con;
	}
	
	
	public List<Book> getAllBooks(String book_genre) {
        List<Book> book = new ArrayList<>();
        try {

            query = "select * from " + book_genre;
            pst = this.con.prepareStatement(query);
            rs = pst.executeQuery();

            while (rs.next()) {
            	Book row = new Book();
                row.setId(rs.getInt("id"));
                row.setTitle(rs.getString("title"));
                row.setAuthor(rs.getString("author"));
                row.setGenre(rs.getString("genre"));
                row.setImage(rs.getString("image"));
                row.setDownload_link(rs.getString("Download_link"));

                book.add(row);
            }

        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }
        return book;
    }
	
	
	 public Book getSingleProduct(int id) {
		 Book row = null;
	        try {
	            query = "select * from books where id=? ";

	            pst = this.con.prepareStatement(query);
	            pst.setInt(1, id);
	            ResultSet rs = pst.executeQuery();

	            while (rs.next()) {
	            	row = new Book();
	                row.setId(rs.getInt("id"));
	                row.setTitle(rs.getString("title"));
	                row.setAuthor(rs.getString("author"));
	                row.setGenre(rs.getString("genre"));
	                row.setImage(rs.getString("image"));
	                row.setDownload_link(rs.getString("Download_link"));
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	            System.out.println(e.getMessage());
	        }

	        return row;
	    }

    
    public List<Favorites> getFavBooks(ArrayList<Favorites> favList) {
        List<Favorites> book = new ArrayList<>();
        try {
            if (favList.size() > 0) {
                for (Favorites item : favList) {
                    query = "select * from books where id=?";
                    pst = this.con.prepareStatement(query);
                    pst.setInt(1, item.getId());
                    rs = pst.executeQuery();
                    while (rs.next()) {
                    	Favorites row = new Favorites();
                        row.setId(rs.getInt("id"));
                        row.setTitle(rs.getString("title"));
                        row.setAuthor(rs.getString("author"));
                        row.setGenre(rs.getString("genre"));
                        book.add(row);
                    }

                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }
        return book;
    }
    
    public void delete(long id) {
        PreparedStatement pst = null;
        String sql = "delete from books where id = ?";
        try {
            pst = con.prepareStatement(sql);
            pst.setLong(1, id);
            pst.executeUpdate();
        } catch (SQLException exp) {
            System.out.println(exp.getMessage());
        }
    }

}
