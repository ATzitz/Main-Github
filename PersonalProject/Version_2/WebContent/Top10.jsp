<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="Bookcamp.*" %>
<%@ page import="java.sql.*, java.util.*, java.io.*" %>


<!DOCTYPE html>
<html lang="en">
<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->


<title>BooKcamp: Top 10</title>
<link rel="icon" href="favicon.ico">
<link rel="stylesheet" type="text/css" href="css.css">
<!-- Bootstrap -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"
	integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp"
	crossorigin="anonymous">
<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->
  
<link rel="stylesheet" href="box.css"> <!-- my page css -->
<link rel="stylesheet" href="star.css"> <!-- my stars css -->
  
</head>
<body>

	<%@include file="navbar.jsp" %>
<br>
<br>

<br>

<br>


<section class="col-xs-12 col-sm-6 col-md-12">
			<!-- SEARCH ITEM -->
						
			<%			

			RatingDAO ratingdao = new RatingDAO();
			BookDAO bdao = new BookDAO();
			List<Book> qdao = bdao.getQuery("book.title", "", "HAVING average > 3");
			for (int i=0; i<10; i++) {
					Book book=qdao.get(i);
					String bookimage = book.getImagePath();
					String booktitle = book.getTitle();
					String bookcategory = book.getCategory();
					int year = book.getPublicationYear();
					String desc = book.getDescription();
					int bookid = book.getBookId();
					BookDAO bookdesc= new BookDAO();
					String textdesc= bookdesc.getBookById(bookid).getDescription();
					String authorname = book.getAuthor().getName();
					String authorsurname = book.getAuthor().getSurname();
					double averagerating = ratingdao.averageBookRating(bookid); // many queries
					
					
			%>
			<article class="search-result row">
			<div class="panel panel-default">
				<div class="col-xs-12 col-sm-12 col-md-3">
					<a href="index.jsp?bookId=<%=bookid%>"><img
						src="<%=bookimage%>" width=100% height=40%
						title="<%=booktitle%>"></a>
				</div>
				<div class="col-xs-12 col-sm-12 col-md-6 excerpet">
					<h3 class="blue"><a href="index.jsp?bookId=<%=bookid%>" title="<%=booktitle%>"><b><%=i+1%>. <%=booktitle%> </b></a></h3>
					<br>
					<p><%=textdesc%></p>
				</div>
				
				
				<div class="col-xs-12 col-sm-12 col-md-3">
					
						<% int pix = (int) (ratingdao.averageBookRating(bookid) * 40); %> <!-- average rating translation from int to stars... -->
						<div id="container">
							<img src="images/0.png" class="mwid"/> <!-- ...with image on image (check star.css for more info) -->
							<img src="images/5.png" class="mwid" id="img2" style="clip: rect(0px,<%= pix %>px,1000px,0px);"/>
						</div>
						<br>
						<i class="glyphicon glyphicon-user"></i> <span class="blue"><a href="SearchController?searchby=author.surname&searchfield=<%=authorsurname%>&rating="> <%=authorname%><%=authorsurname%> </a></span><br>
						<i class="glyphicon glyphicon-folder-open"></i> <span class="blue"><a href="SearchController?searchby=book.category&searchfield=<%=bookcategory%>&rating="> <%=bookcategory%> </a></span><br>
						<i class="glyphicon glyphicon-calendar"></i> <span class="blue"> <%=year%> </span>
				</div>
				<span class="clearfix borda"></span>
			</div>
			</article>
			<%
				}
			
			%>
			<!-- SEARCH ITEM END -->
	</section>
<%@include file="footer.jsp" %>
</body>
</html>