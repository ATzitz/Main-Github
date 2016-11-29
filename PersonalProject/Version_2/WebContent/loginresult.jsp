<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*" %>
<%@ page import="Bookcamp.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
  <title>BooKcamp: Log In</title>
  <link href="carousel.css" rel="stylesheet">
  <link rel="icon" href="favicon.png">
  <!-- Bootstrap -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
  <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->
  <link rel="stylesheet" href="box.css"> <!-- my page css -->
  <link href="login.css" rel="stylesheet">
  
</head>
 <%UserDAO udao = new UserDAO();
 	int check=0;
 	 for (User s: udao.getAllUsers()){
 		 if (s.getUsername().equals(request.getParameter("username")) & s.getPassword().equals(request.getParameter("password"))){   
 			 request.setAttribute("user", s);
 			 session.setAttribute("user", s);
 			 check++;
 			 break;}
 	 }
 	if (check==1){
 		String a = (String)session.getAttribute("bookid");
 		String forwardURL = "index.jsp?bookId=" + a;
 		if (a==null){%>
 		<jsp:forward page="logedin2.jsp"/>
 		<%}else{
   			response.setStatus(response.SC_MOVED_TEMPORARILY);
   			response.setHeader("Location", forwardURL);
 		} %>
 <% }else{ %>
 	<%@include file="loginbody.jsp" %>
 	<%} %>