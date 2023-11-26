<%@page import="e_Library_connection.DbCon"%>
<%@page import="e_Library_model.*"%>
<%@page import="e_Library_DAO.*"%>
<%@page import="java.util.*"%>
<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%

DecimalFormat dcf = new DecimalFormat("#.##");
request.setAttribute("dcf", dcf);
Admin auth = (Admin) request.getSession().getAttribute("auth");
if (auth != null) {
	request.setAttribute("person", auth);
}
List<User> userList = (List<User>) session.getAttribute("user_list");
UserDAO uDao = new UserDAO(DbCon.getConnection());
userList = uDao.getAllUsers();
request.setAttribute("user_list", userList);

%>
<!DOCTYPE html>
<html>
<head>
<%@include file="/includes/head.jsp"%>
<title>E-books</title>
<style type="text/css">
.table tbody td {
	vertical-align: middle;
}

.btn-incre, .btn-decre {
	box-shadow: none;
	font-size: 25px;
}
</style>
</head>
<body>
	<%@include file="/includes/nav-bar-admin.jsp"%>

	<div class="container my-3">
		<div class="d-flex py-3">
			<h3>Manage Users :</h3>
		</div>
		<table class="table table-light">
			<thead>
				<tr>
					<th scope="col">Name</th>
					<th scope="col">Email</th>
					<th scope="col">Password</th>
					<th scope="col">Delete</th>
				</tr>
			</thead>
			<tbody>
              
                    <% for (User user : userList) { %>
                        <tr>
                            <td><%= user.getName() %></td>
                            <td><%= user.getEmail() %></td>
                            <td><%= user.getPass() %></td>
                            
                            <td><a href="rem-user?id=<%=user.getId() %>" class="btn btn-sm btn-danger">Remove</a></td>
                            
                        </tr>
                    <% } %>
               
            </tbody>
		</table>
	</div>

	<%@include file="/includes/footer.jsp"%>
</body>
</html>