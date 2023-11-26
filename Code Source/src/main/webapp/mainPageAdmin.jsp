<%@page import="e_Library_connection.DbCon"%>
<%@page import="e_Library_model.*"%>
<%@page import="e_Library_DAO.*"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%
Admin auth = (Admin) request.getSession().getAttribute("auth");
if (auth != null) {
    request.setAttribute("person", auth);  
}

BookDAO pd = new BookDAO(DbCon.getConnection());
List<Book> books = pd.getAllBooks("books");
ArrayList<Favorites> fav_list = (ArrayList<Favorites>) session.getAttribute("fav_list");
if (fav_list != null) {
	request.setAttribute("fav_list", fav_list);}
%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>E-books</title>
<%@include file = "includes/head.jsp"%>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://www.w3schools.com/lib/w3-theme-black.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
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

<!-- Navbar -->
<!-- <div class="w3-top">
<!-- <div class="w3-top">
  <div class="w3-bar w3-theme w3-top w3-right-align w3-large">
    <a class="w3-bar-item w3-button w3-right w3-hide-large w3-hover-white w3-large w3-theme-l1" href="javascript:void(0)" onclick="w3_open()"><i class="fa fa-bars"></i></a>
    <a href="#" class="w3-bar-item w3-button w3-theme-l1">
    <img src="images/letter-e-book-logo.avif" alt="Logo" style="height: 70px; width: auto;">
    </a>
    <a href="#" class="w3-bar-item w3-button w3-hide-small w3-hover-white">About</a>
    <a href="#" class="w3-bar-item w3-button w3-hide-small w3-hover-white">Values</a>
    <a href="#" class="w3-bar-item w3-button w3-hide-small w3-hover-white">News</a>
    <a href="#" class="w3-bar-item w3-button w3-hide-small w3-hover-white">Contact</a>
    <a href="#" class="w3-bar-item w3-button w3-hide-small w3-hide-medium">Clients</a>
  </div>
</div> 
-->
<%@include file = "includes/nav-bar-admin.jsp"%>

<!--  sub nav image -->
<div class="image-container">
  <img src="images/GettyImages_1.jpg" alt="Image">
  <div class="text-on-image">WELCOME ADMIN.</div>
</div>
<!----------------- -->


<!-- Overlay effect when opening sidebar on small screens -->
<div class="w3-overlay w3-hide-large" onclick="w3_close()" style="cursor:pointer" title="close side menu" id="myOverlay"></div>

<!-- Main content: shift it to the right by 250 pixels when the sidebar is visible -->
<div class="w3-main" style="margin-left:220px; margin-top: 10px">


  <div class="w3-row w3-padding-32">
    <div class="w3-col l6 m6 s12">
    <div class="w3-container">
      <h1 class="w3-text-teal">Manage Users</h1>
      <a href="ManageUsers.jsp">
        <img src="images/manageusers.jpg" alt="action image" style="width:48% ;height :48%;box-shadow : 5px 10px 8px rgba(0, 150, 250, 1);">
      </a>
    </div>
  </div>

  <div class="w3-col l3 m6 s12">
    <div class="w3-container">
      <h1 class="w3-text-teal">Manage Books</h1>
      <a href="ManageBooks.jsp">
        <img src="images/managebooks.png" alt="action image" style="width:100%;box-shadow : 5px 10px 8px rgba(0, 150, 250, 1);">
      </a>
    </div>
  </div>
 
</div>
    
  </div>


  <footer class="bg-body-tertiary text-center text-lg-start" style = "margin-top: 50px" > 
  <!-- Copyright -->
  <div class="text-center p-3" style="background-color: rgba(0, 0, 0, 0.05);">
    © 2023 Ebooks Website
    <a class="text-body" href="#">About</a>
  </div>
  <!-- Copyright -->
</footer>

<!-- END MAIN -->

<script>
// Get the Sidebar
var mySidebar = document.getElementById("mySidebar");

// Get the DIV with overlay effect
var overlayBg = document.getElementById("myOverlay");

// Toggle between showing and hiding the sidebar, and add overlay effect
function w3_open() {
  if (mySidebar.style.display === 'block') {
    mySidebar.style.display = 'none';
    overlayBg.style.display = "none";
  } else {
    mySidebar.style.display = 'block';
    overlayBg.style.display = "block";
  }
}

// Close the sidebar with the close button
function w3_close() {
  mySidebar.style.display = "none";
  overlayBg.style.display = "none";
}
</script>
<%@include file = "includes/footer.jsp"%>
</body>
</html>
