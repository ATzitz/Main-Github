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

<%
	// Setting default user and book values for homrpage. You can change these as you wish (withing the iimits of existing database entries).
	
	User us=(User)session.getAttribute("user");
	int userId=0;
	if (us!=null)
		userId = us.getUserId();
	BookDAO bookdao = new BookDAO();
	UserDAO userdao = new UserDAO();
	RatingDAO ratingdao = new RatingDAO();
%>

<title>BooKcamp: Search Results</title>
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
	<!-- SEARCH RESULT -->

	<div class="container">
		<hgroup class="mb20">
			<h1 style="color: white">Search Results</h1>
			<%
				List<Book> qdao = (List<Book>) request.getAttribute("qdao");

				int size = qdao.size();
				String searchby = request.getParameter("searchby");
				String keyword = request.getParameter("searchfield");
			%>

			<h2 class="lead">
				<strong class="text-danger"><%=size%></strong> <span style="color: white">results were found
				for the search for </span><strong class="text-danger">"<%=keyword%>"
				</strong>
				<% if (size == 0) { %>
					<div class="panel panel-default" align="center">
						<img src="images/noresults.png" width=50%>
					</div>
				<% } %>			
			</h2>
		</hgroup>
	</div>
		
	<section class="col-xs-12 col-sm-6 col-md-12">
			<!-- SEARCH ITEM -->
						
			<%			
				for (Book book : qdao) {
					
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
					
					if (!userdao.getUsersWishlist(userId).contains(bookid)) {
						if (request.getParameter("wishlist") != null) {
							userdao.addtoWishlist(userId, bookid); // insert book to user's wishlist
						}	
					}
					
					if (userdao.getUsersWishlist(userId).contains(bookid)) {
						if (request.getParameter("remove") != null) {
							userdao.removeFromWishlist(userId, bookid); // remove book from user's wishlist
						}	
					}
			%>
			<article class="search-result row">
			<div class="panel panel-default">
				<div class="col-xs-12 col-sm-12 col-md-3">
					<a href="index.jsp?bookId=<%=bookid%>"><img
						src="<%=bookimage%>" width=100% height=40%
						title="<%=booktitle%>"></a>
				</div>
				<div class="col-xs-12 col-sm-12 col-md-6 excerpet">
					<h3 class="blue"><a href="index.jsp?bookId=<%=bookid%>" title="<%=booktitle%>"><b> <%=booktitle%> </b></a></h3>
					<br>
					<p>
					<%
					String descriptionWithParagraphs = bookdao.getParagraphs(textdesc);
					out.println(descriptionWithParagraphs);
					%>
					</p>
				</div>
				
				
				<div class="col-xs-12 col-sm-12 col-md-3">
						<br>
						<% 
						if (!userdao.getUsersWishlist(userId).contains(bookid)) { // if book is not in user's wishlist, show <add to wishlist> button...
						%>
							<form name="wishlistForm" action="index.jsp?bookId=<%=bookid%>"" method="POST">
								<button name="wishlist" class="btn btn-info wishlist"><h3>Add to wishlist</h3></button>
							</form>
						
						<% } else { // else, show <remove from wishlist> button... %>
							<form name="removeForm" action="index.jsp?bookId=<%=bookid%>"" method="POST">
								<button name="remove" class="btn btn-warning wishlist"><h3>Remove from wishlist</h3></button>
							</form>
						<% } %>	
						<br>
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
	<!-- SEARCH END -->


	<%@include file="footer.jsp" %>


	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
		integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
		crossorigin="anonymous"></script>
</body>
</html>
