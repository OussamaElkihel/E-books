<%@page import="e_Library_connection.DbCon"%>
<%@page import="e_Library_model.*"%>
<%@page import="e_Library_DAO.*"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%
User auth = (User) request.getSession().getAttribute("auth");
if (auth != null) {
    request.setAttribute("person", auth);  
}

BookDAO pd = new BookDAO(DbCon.getConnection());
List<Book> books = pd.getAllBooks("sci_fi_books");

ArrayList<Favorites> fav_list = (ArrayList<Favorites>) session.getAttribute("fav_list");
if (fav_list != null) {
	request.setAttribute("fav_list", fav_list);
}

%>
<!DOCTYPE html>
<html>
<head>
<%@include file="/includes/head.jsp"%>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://www.w3schools.com/lib/w3-theme-black.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
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
<title>E-books</title>
</head>
<body>
	<%@include file="/includes/nav-bar.jsp"%>
	
	<div class="image-container">
  <img src="images/GettyImages_1.jpg" alt="Image">
  <div class="text-on-image">WELCOME. <br>Explore an extensive collection of free ebooks in our welcoming library.</div>
</div>

	<div class="container">
		<div class="card-header my-3">All Books</div>
		<div class="row">
			<%
			if (!books.isEmpty()) {
				for (Book p : books) {
			%>
			<div class="col-md-3 my-3">
				<div class="card w-100">
					<img class="card-img-top" src="book-images/<%=p.getImage() %>"
						alt="Card image cap">
					<div class="card-body">
						<h5 class="card-title"><%=p.getTitle() %></h5>
						<h6 class="price">Author : <%=p.getAuthor() %></h6>
						<h6 class="category">Genre : <%=p.getGenre() %></h6>
						<div class="mt-3 d-flex justify-content-between">
							<a class="btn btn-dark" href="add-tofav?id=<%=p.getId()%>">Add to Favorites</a> <a
								class="btn btn-primary" href="<%=p.getDownload_link()%>">Download</a>
						</div>
					</div>
				</div>
			</div>
			<%
			}
			} else {
			out.println("There is no books");
			}
			%>

		</div>
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