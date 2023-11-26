<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="e_Library_connection.DbCon"%>
<%@page import="e_Library_model.*"%>
<%@page import="java.util.*"%>

<%
User auth = (User) request.getSession().getAttribute("auth");
if (auth != null) {
    request.setAttribute("person", auth);
}%>
<!DOCTYPE html>
<html>
<head>
<%@include file = "includes/head.jsp"%>
<title>Insert title here</title>
</head>
<body>


<%@include file = "includes/footer.jsp"%>
</body>
</html>