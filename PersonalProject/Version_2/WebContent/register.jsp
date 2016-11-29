<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="Bookcamp.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
  <title>BooKcamp: Register</title>
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
<body>

<%@include file="navbar.jsp" %>
  <br>  <br>  <br>
 <div class="row" style="margin-left: 2%; margin-right: 2%;">
	<%@include file="genres.jsp"%>

    <!-- register -->
    <div class="col-lg-6" align=center>
    	<h3 align=center style="color:white">Register</h3>
    	<!-- Main Form -->
    	<div class="login-form-1" align=left>
    		<form id="register-form" class="text-left" action="registeresult.jsp" method="post">
    			<div class="login-form-main-message"></div>
    			<div class="main-login-form">
    				<div class="login-group">
    					<div class="form-group">
    						<label for="username" class="sr-only">Username</label>
    						<input type="text" class="form-control" id="username" name="username" placeholder="username" required>
    					</div>
    					<div class="form-group">
    						<label for="password" class="sr-only">Password</label>
    						<input type="password" class="form-control" id="password" name="password" placeholder="password" required>
    					</div>
    					<div class="form-group">
    						<label for="password_confirm" class="sr-only">Password Confirm</label>
    						<input type="password" class="form-control" id="password_confirm" name="password_confirm" placeholder="confirm password" required>
    					</div>

    					<div class="form-group">
    						<label for="name" class="sr-only">Name</label>
    						<input type="text" class="form-control" id="name" name="name" placeholder="name" required>
    					</div>

              			<div class="form-group">
    						<label for="surname" class="sr-only">Surname</label>
    						<input type="text" class="form-control" id="surname" name="surname" placeholder="surname" required>
    					</div>

    					<div class="form-group">
    						<label for="Year of birth" class="sr-only">Year of birth</label>
    						<input type="number" min="1900" max="2000" class="form-control" id="age" name="year" placeholder="Year of birth" required>
    					</div>

    					<div class="form-group login-group-checkbox">
    						<input type="radio" class="" name="gender" value="m" id="male" placeholder="username" required>
    						<label for="male">Male</label>

    						<input type="radio" class="" name="gender" value="f" id="female" placeholder="username" required>
    						<label for="female">Female</label>
    					</div>

    					<div class="form-group login-group-checkbox">
    						<input type="checkbox" class="" id="reg_agree" name="agree" required>
    						<label for="reg_agree">i agree with <a href="#">terms</a></label>
    					</div>
    				</div>
    				<button type="submit" class="login-button" style="background-color: black" ><img src="arrow.png" width=22 height=22></button>
    			</div>
    			<div class="etc-login-form">
    				<p>already have an account? <a href="login.jsp">login here</a></p>
    			</div>
    		</form>
    	</div>
    	<!-- end:Main Form -->
    </div>
    <!-- end:register -->

 <%
			BookDAO bkdao = new BookDAO();
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

    </div>
    <%@include file="footer.jsp" %>


      <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
      <!-- Include all compiled plugins (below), or include individual files as needed -->
      <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    </body>
    </html>
