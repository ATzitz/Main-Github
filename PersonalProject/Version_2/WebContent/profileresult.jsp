<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="Bookcamp.*"%>
<%@ page import="java.io.*,java.util.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
  <title>BooKcamp: My Account</title>
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
<%  User t=(User)session.getAttribute("user");
	UserDAO udao = new UserDAO();
			if (t==null) {%>
<jsp:forward page="login.html" />
<%} %>
<br>
<br>
<br>

<%
 		int id=t.getUserId();
		String name=request.getParameter("name");
		String surname=request.getParameter("surname");
		String username=request.getParameter("username");
 		String password=request.getParameter("password");
 		String newpassword=request.getParameter("npassword");
 		String conpassword=request.getParameter("conpassword");
 		int year=Integer.parseInt(request.getParameter("year"));
 		String sex=request.getParameter("gender");
 	if (newpassword!=""){
		if (newpassword.equals(conpassword)){
			t.setPassword(newpassword);
			t.setName(name);
			t.setSurname(surname);
			t.setYearOfBirth(year);
			t.setUsername(username);
			t.setSex(sex);
			udao.updateUser(id, username, newpassword, name, surname,year, sex); 
			session.removeAttribute("user");
			session.setAttribute("user",t);%>
			<br><br><br>
			<h4 align=center>Update Successful</h4>
			<%@include file="logedin.jsp"%>
 		<% }else{%>
		<%@include file="profilbody.jsp"%>
		<%}
		}else{
			password=t.getPassword();
			t.setPassword(password);
			t.setName(name);
			t.setSurname(surname);
			t.setYearOfBirth(year);
			t.setUsername(username);
			t.setSex(sex);
			udao.updateUser(id, username, password, name, surname, year, sex);
			session.removeAttribute("user");
			session.setAttribute("user",t);%>
			<br><br><br>
			<h4 align=center>Update Successful</h4>
			<%@include file="profilbody.jsp"%>
			<%}%>