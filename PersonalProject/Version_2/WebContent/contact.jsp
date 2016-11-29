<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="Bookcamp.* " %>
<!DOCTYPE html>
<html lang="en">
<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<link rel="icon" href="favicon.ico">

<title>Contact BooKcamp</title>

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
<link rel="stylesheet" href="box.css"><!-- my page css -->
  
</head>
<body>
<%@include file="navbar.jsp" %>
	<br>
	<br>
	<br>
	<br>
	<br>

	<!-- CONTACT AND MAP FORM START -->
	<div class="row">

		<div class="col-md-6">
			<div class="panel panel-default" style="background-color:rgba(255, 255, 255, 0);border:0">
				<div class="panel-heading" align=center>Contact Us</div>
				<form action="mailto:werock@bookcamp.com"
					enctype="text/plain" method="post" style="background-color:rgba(255, 255, 255, 0)">

					<fieldset>
						<br>

						<div class="form-group">
							<div class="col-md-10 col-md-offset-1">
								<input id="fname" name="name" type="text"
									placeholder="First Name" class="form-control" required>
							</div>
						</div>
						<div class="form-group">
							<div class="col-md-10 col-md-offset-1">
								<input id="lname" name="name" type="text"
									placeholder="Last Name" class="form-control" required>
							</div>
						</div>

						<div class="form-group">
							<div class="col-md-10 col-md-offset-1">
								<input id="email" name="email" type="email"
									placeholder="Email Address" class="form-control" required>
							</div>
						</div>

						<div class="form-group">
							<div class="col-md-10 col-md-offset-1">
								<input id="phone" name="phone" type="number" min="10"
									placeholder="Phone" class="form-control">
							</div>
						</div>

						<div class="form-group">
							<div class="col-md-10 col-md-offset-1">
								<textarea class="form-control" id="message" name="message"
									placeholder="Enter your message for us here. We will get back to you within 2 business days."
									rows="9" required></textarea>
							</div>
						</div>
				
						<div class="form-group">
							<div class="col-md-12 text-center">
								<br />
								<button type="submit" class="btn btn-primary btn-lg">Submit</button>
								<p>
							</div>
						</div>
					</fieldset>
				</form>
			</div>
		</div>
		<div class="col-md-6">
			<div>
				<div class="panel panel-default" style="background-color:rgba(255, 255, 255, 0);border:0">
					<div class="panel-heading" align=center>Our Offices</div>
					<div style="background-color:rgba(255, 255, 255, 0);height:436px" align=center>
						<br>
						<iframe
							src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d1572.436230820157!2d23.731196057984793!3d37.98010560911486!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x19b0496278db9770!2zRUNETCDOlc6bzpvOkc6jIM6RLs6VLg!5e0!3m2!1sel!2sgr!4v1478174894161"
							width="500" height="300" frameborder="0" style="border: 0"
							allowfullscreen></iframe>
						<h4><U>Address</U></h4>
						<div>
							Korai 3, BookCamp 6940 000 000 werock@bookcamp.com<br>
							
						</div>
						<br>
						<div id="map1" class="map"></div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- CONTACT AND MAP FORM END -->

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
