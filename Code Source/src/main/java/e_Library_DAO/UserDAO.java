package e_Library_DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import e_Library_model.Book;
import e_Library_model.User;

public class UserDAO {
	
	private Connection con;
	private String query;
	private PreparedStatement pst;
	private ResultSet rs;
	

	
	public UserDAO(Connection con) {
		this.con = con;
	}

	public User userLogin(String email, String pass) {
		User user = null;
		
		try {
			query = "select * from members where email = ? and pass = ?";
			pst = this.con.prepareStatement(query);
			pst.setString(1, email);
			pst.setString(2, pass);
			rs = pst.executeQuery();
			
			if(rs.next()) {
				user = new User();
				user.setId(rs.getInt("id"));
				user.setName(rs.getString("name"));
				user.setPass(rs.getString("pass"));
				user.setEmail(rs.getString("email"));
				
				
			}
			
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
		return user;
	}
	
	public List<User> getAllUsers() {
	
		List<User> user = new ArrayList<>();

        // SQL query to select all users
        String query = "SELECT * FROM members";

        try (
          
            PreparedStatement preparedStatement = con.prepareStatement(query);
            ResultSet resultSet = preparedStatement.executeQuery();
        ) {
            while (resultSet.next()) {
                User member = new User();
                member.setId(resultSet.getInt("id"));
                member.setName(resultSet.getString("name"));
                member.setEmail(resultSet.getString("email"));
                member.setPass(resultSet.getString("pass"));

                user.add(member);
            }
        } catch (SQLException e) {
            e.printStackTrace(); 
        }

        return user;
    }
	
	public void delete(long id) {
        PreparedStatement pst = null;
        String sql = "delete from members where id = ?";
        try {
            pst = con.prepareStatement(sql);
            pst.setLong(1, id);
            pst.executeUpdate();
        } catch (SQLException exp) {
            System.out.println(exp.getMessage());
        }
    }

}
