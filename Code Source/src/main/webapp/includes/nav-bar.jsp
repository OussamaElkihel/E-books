<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
<div class = "container">
  <a class="navbar-brand" href="#">E-books</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav ml-auto">
      
    	<%
				if (auth != null) {
				%>
				<li class="nav-item active">
        <a class="nav-link" href="mainPage.jsp">Home <span class="sr-only">(current)</span></a>
      </li>
				<li class="nav-item"><a class="nav-link" href="profile.jsp">Profile</a></li>
				<li class="nav-item"><a class="nav-link" href="favorites.jsp">Favorites<span class = "badge badge-danger">${ fav_list.size() }</span></a></li>
				<li class="nav-item"><a class="nav-link" href="log-out">Logout</a></li>
				<%
				} else {
				%>
				<li class="nav-item"><a class="nav-link" href="login.jsp">Login</a></li>
				<%
				}
				%>
    </ul>
  </div>
</div>
</nav>