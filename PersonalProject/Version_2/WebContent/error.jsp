<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isErrorPage="true"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->


<title>BooKcamp: error</title>
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

<!-- NAVIGATION BAR AND LOG IN START -->
	<nav class="navbar navbar-default navbar-fixed-top" style="width: auto">
		<div class="container-fluid">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
					aria-expanded="false">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="index.jsp"><img alt="Brand"
					src="images/logo.png" width=190 height=35></a>
			</div>

			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">
					<li><a href="home.jsp">Home </a></li>

				</ul>
				<ul class="nav navbar-nav navbar-right">

					<li><a href="login.html">Log In</a></li>


				</ul>

				<form class="navbar-form navbar-search" role="search" method="get"
					action="SearchController">
					<select id="searchby" name="searchby" type="select"
						class="btn btn-search btn-default dropdown-toggle selectpicker"
						data-toggle="dropdown" required name=>
						<span class="glyphicon glyphicon-search"></span>
						<span class="label-icon">Search by...</span>
						<span class="caret"></span>

						<ul class="dropdown-menu pull-left" role="menu">
							<li>
								<option value="book.title" selected><span
										class="glyphicon glyphicon-book"></span> <span
										class="label-icon">Search By Book Title</span>
								</option>
							</li>
							<li>
								<option value="book.category"><span
										class="glyphicon glyphicon-folder-open"></span> <span class=se"label-icon">Search
										By Category</span>
								</option>
							</li>
							<li>
								<option value="author.surname"><span
										class="glyphicon glyphicon-user"></span> <span
										class="label-icon">Search By Author</span>
								</option>
							</li>
						</ul>
					</select>
					<div class="input-group">

						<div class="input-group-btn"></div>

						<input type="text" name="searchfield" class="form-control"
							size=40% placeholder="Search by Book Title, Category or Author">
						<div class="input-group-btn"></div>

					</div>
					<select id="rating" name="rating" type="select"
						class="btn btn-search btn-default dropdown-toggle selectpicker"
						data-toggle="dropdown">
						<span class="glyphicon glyphicon-search"></span>
						<span class="label-icon">Rating of ...</span>
						<span class="caret"></span>

						<ul class="dropdown-menu pull-left" role="menu">
							<li>
								<option value="" selected><span
										class="glyphicon glyphicon-book"></span> <span
										class="label-icon">Any rating</span>
								</option>
							</li>
							<li>
								<option value="AND rating.rating>0.5"><span
										class="glyphicon glyphicon-book"></span> <span
										class="label-icon">1 Star</span>
								</option>
							</li>
							<li>
								<option value="AND rating.rating>1.5"><span
										class="glyphicon glyphicon-folder-open"></span> <span class=se"label-icon">2
										Stars</span>
								</option>
							</li>
							<li>
								<option value="AND rating.rating>2.5"><span
										class="glyphicon glyphicon-user"></span> <span
										class="label-icon">3 Stars</span>
								</option>
							</li>
							<li>
								<option value="AND rating.rating>3.5"><span
										class="glyphicon glyphicon-user"></span> <span
										class="label-icon">4 Stars</span>
								</option>
							</li>
							<li>
								<option value="AND rating.rating>4.5"><span
										class="glyphicon glyphicon-user"></span> <span
										class="label-icon">5 Stars</span>
								</option>
							</li>
						</ul>
					</select>
					<button type="submit" class="btn btn-search btn-default"
						class="Submit">GO</button>

				</form>


			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container-fluid -->
	</nav>

	<br>
	<br>
	<br>
<meta http-equiv="refresh" content="2; home.jsp" />
	<div class="container">
		<div class="row">
			<div class="span12">
				<div class="row panel panel-default " style="padding:20px">
					<h1>
						Page Not Found <small><font face="Tahoma" color="red">Error
								404</font></small>
					</h1>
					<br />
					<p>
					
						The page you requested could not be found, either contact your
						webmaster or try again. Use your browsers <b>Back</b> button to
						navigate to the page you have prevously come from
					</p>
					<p>
					
						<b>Or you could just press this neat little button:</b>
					</p>
					<a href="home.jsp" class="btn btn-large btn-info"><i
						class="icon-home icon-white"></i> Take Me Home</a>
				</div>
				</div>
				<br />
			</div>
		</div>
	</div>
<br><br><br>
 <%@include file="footer.jsp" %>
	

</body>
</html>