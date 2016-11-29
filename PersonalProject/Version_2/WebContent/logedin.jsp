<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="Bookcamp.*" %>
<%@ page import="java.util.*" %>
<% User us=(User)session.getAttribute("user");
	if (us==null) {%>
	<jsp:forward page="login.html" /><%} %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="icon" href="favicon.png">
 <link rel="stylesheet" href="box.css"> <!-- my page css -->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Welcome <%out.print(request.getParameter("username")); %></title>
</head>
<body>
<% User current = (User)session.getAttribute("user"); %>
 
<%@include file="navbar.jsp" %>

  <br>  <br>  <br>
<div class="row" style="margin-left: 2%; margin-right: 2%;">
	<%@include file="genres.jsp"%>
  
  <!--center-->
    <div class="col-lg-6">
      <!--recent-->
      <div class="panel panel-default" style="background-color:rgba(255, 255, 255, 0);border:0">
        <div class="panel-heading" align=center>Wishlist</div>
        <%UserDAO usdao = new UserDAO(); 
    	  BookDAO bkdao = new BookDAO();  
        	for (int bookid : usdao.getUsersWishlist(current.getUserId())){
        		Book b = bkdao.getBookById(bookid);
        	%>
          	<div class="media">
  				<div class="media-left">
  				
    				<a href="index.jsp?bookId=<%=b.getBookId()%>" title="<%=b.getTitle()%>">
      				<img class="media-object" src="<%out.print(b.getImagePath());%>" width=50px height=66px style="margin-left:10px">
    				</a>
  			</div>
  			<div class="media-body">
    		<h4 class="media-heading"><h3 class="blue"><a href="index.jsp?bookId=<%=b.getBookId()%>" title="<%=b.getTitle()%>"><b> <%=b.getTitle()%> </b></a></h3></a>
  			</div>
  			</div>
        	<br>
        	<%}%>
      </div><!--close recent-->
  </div><!--close center-->
<%
  			Random rdm = new Random();
			int n = rdm.nextInt(40) + 1;
			Book book = new Book();
			book = bkdao.getBookById(n);
		%>
		<div class="col-lg-3">
			<div id="myCarousel" class="carousel slide" data-ride="carousel">
				<!-- Indicators -->
				<ol class="carousel-indicators">
					<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
					<li data-target="#myCarousel" data-slide-to="1"></li>
					<li data-target="#myCarousel" data-slide-to="2"></li>
				</ol>
				<div class="carousel-inner" role="listbox">
					<div class="item active" align=center>
						<img class="first-slide" src="<%=book.getImagePath()%>"
							alt="First slide">
						<div class="container">
							<div class="carousel-caption">
								<p>
									<a class="btn btn-lg btn-primary"
										href="index.jsp?bookId=<%=book.getBookId()%>" role="button">More</a>
								</p>
							</div>
						</div>
					</div>
					<%
					n = rdm.nextInt(40) + 1;	
					book = bkdao.getBookById(n);
					%>
					<div class="item" align=center>
						<img class="second-slide" src="<%=book.getImagePath()%>"
							alt="Second slide">
						<div class="container">
							<div class="carousel-caption">
								<p>
									<a class="btn btn-lg btn-primary"
										href="index.jsp?bookId=<%=book.getBookId()%>" role="button">More</a>
								</p>
							</div>
						</div>
					</div>
					<%
					n = rdm.nextInt(40) + 1;	
					book = bkdao.getBookById(n);
					%>
					<div class="item" align=center>
						<img class="third-slide" src="<%=book.getImagePath()%>"
							alt="Third slide">
						<div class="container">
							<div class="carousel-caption">
								<p>
									<a class="btn btn-lg btn-primary"
										href="index.jsp?bookId=<%=book.getBookId()%>" role="button">More</a>
								</p>
							</div>
						</div>
					</div>
				</div>
				<a class="left carousel-control" href="#myCarousel" role="button"
					data-slide="prev"> <span
					class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
					<span class="sr-only">Previous</span>
				</a> <a class="right carousel-control" href="#myCarousel" role="button"
					data-slide="next"> <span
					class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
					<span class="sr-only">Next</span>
				</a>
			</div>
		</div>
		<!-- /.carousel -->

		</div>
		<%@include file="footer.jsp" %>

      <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
      <!-- Include all compiled plugins (below), or include individual files as needed -->
      <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    </body>
    </html>