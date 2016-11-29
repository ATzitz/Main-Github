<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>BooKcamp: See you soon!</title>
</head>
<body>
<h3 align="center">Logout Successful</h3>
<div align=center>
<img src="images/loading.gif">
</div>
<meta http-equiv="refresh" content="2; url=home.jsp" />
<%session.invalidate(); %>
</body>
</html>