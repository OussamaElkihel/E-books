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
User auth = (User) request.getSession().getAttribute("auth");
if (auth != null) {
    request.setAttribute("person", auth);
}
ArrayList<Favorites> fav_list = (ArrayList<Favorites>) session.getAttribute("fav_list");
List<Favorites> favBook = null;
if (fav_list != null) {
	BookDAO pDao = new BookDAO(DbCon.getConnection());
	favBook = pDao.getFavBooks(fav_list);
	request.setAttribute("fav_list", fav_list);
}
%>
<!DOCTYPE html>
<html>
<head>
<%@include file="/includes/head.jsp"%>
<title>E-books</title>
<style type="text/css">

.table tbody td{
vertical-align: middle;
}
.btn-incre, .btn-decre{
box-shadow: none;
font-size: 25px;
}


html,body,h1,h2,h3,h4,h5,h6 {font-family: "Roboto", sans-serif;}
.w3-sidebar {
  z-index: 3;
  width: 250px;
  top: 70px;
  bottom: 0;
  height: inherit;
  background-image: url('images/GettyImages.jpg'); 
  background-size: cover;
}

  .w3-top .w3-bar {
    height: 70px; /* Adjust the height to your preference */
    background-color: #B8736C !important;
  }

  .w3-top .w3-bar img {
    height: 30px; /* Adjust the height of the logo */
    width: auto;
  }

  
  .w3-theme-l1{
    height: 70px; /* Adjust the height of the logo */
    width: auto;
    background-color: #B8736C !important;
  }
  
      .image-container {
      text-align: center;
    }
    .image-container img {
      width: 100%;
      max-width: auto; /* Adjust the maximum width of the image */
      height: 400px;
      display: block;
      margin: 0 auto;
    }
    
        .text-on-image {
      position: absolute;
      top: 30%;
      left: 50%;
      transform: translate(-50%, -50%);
      color: #ffffff; /* Text color */
      font-size: 40px; /* Adjust the font size as needed */
      font-weight: bold;
      font-family: "Tahoma", sans_serif;
    }
    .block-title{
     position: absolute;
      font-size: 30px; /* Adjust the font size as needed */
      font-weight: bold;
      font-family: "Optima";
    }
    
    .w3-container{
    display: inline-block;
    vertical-align: top; /* Align containers at the top */
    margin-right: 0px; /* Adjust the margin as needed */
  }
</style>
</head>
<body>
	<%@include file="/includes/nav-bar.jsp"%>
	
		<div class="image-container">
  <img src="images/GettyImages_1.jpg" alt="Image">
  <div class="text-on-image">Welcome <%=auth.getName() %>.</div>
</div>

	<div class="container my-3">
		<div class="d-flex py-3"><h3>Profile Info :  </h3> </div>
		<table class="table table-light">
			<thead>
				<tr>
					<th scope="col">Name</th>
					<th scope="col">Email</th>
					<th scope="col">Password</th>
					<th scope="col">Favorites</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td><%=auth.getName()%></td>
					<td><%=auth.getEmail()%></td>
					<td><%=auth.getPass() %></td>
			
					<td><a href="favorites.jsp" class="btn btn-sm btn-danger">Favorites</a></td>
				</tr>

		
			</tbody>
		</table>
	</div>
	
	<footer class="bg-body-tertiary text-center text-lg-start" style = "margin-top: 30px" > 
  <!-- Copyright -->
  <div class="text-center p-3" style="background-color: rgba(0, 0, 0, 0.05);">
    © 2023 Ebooks Website <br>
    <a class="text-body" href="#">About</a>
  </div>
  <!-- Copyright -->
</footer>

	<%@include file="/includes/footer.jsp"%>
</body>
</html>