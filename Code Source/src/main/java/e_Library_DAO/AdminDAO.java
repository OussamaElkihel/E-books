package e_Library_DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import e_Library_model.Admin;

public class AdminDAO {
	
	private Connection con;
	private String query;
	private PreparedStatement pst;
	private ResultSet rs;
	
	public AdminDAO(Connection con) {
		this.con = con;
	}
	
	public Admin adminLogin(String admin_email, String admin_pass) {
		Admin admin = null;
		
		try {
			query = "select * from admin where admin_email = ? and admin_pass = ?";
			pst = this.con.prepareStatement(query);
			pst.setString(1, admin_email);
			pst.setString(2, admin_pass);
			rs = pst.executeQuery();
			
			if(rs.next()) {
				admin = new Admin();
				admin.setId(rs.getInt("id"));
				admin.setAdmin_name(rs.getString("admin_name"));
				admin.setAdmin_email(rs.getString("admin_email"));
				
				
			}
			
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
		return admin;
	}

}
