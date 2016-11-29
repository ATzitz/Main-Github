<body>
<% User us=(User)session.getAttribute("user");
			if (us==null) {%>
	<jsp:forward page="login.html" /><%} %>
  
<%@include file="navbar.jsp" %>
  <br>  <br>  <br>

  <div class="row" style="margin-left: 2%; margin-right: 2%;">
	<%@include file="genres.jsp"%>
<!-- register -->
    <div class="col-lg-6" align=center>
    	<h3 align=center style="color:white">Password mismatch</h3>
    	<h3 align=center style="color:white">Please retry</h3>
    	<!-- Main Form -->
    	<div class="login-form-1" align=left>
    		<form id="register-form" class="text-left" action="profileresult.jsp" method="post">
    			<div class="login-form-main-message"></div>
    			<div class="main-login-form">
    				<div class="login-group">
    					<div class="form-group">
    						<label for="username" class="sr-only">Username</label>
    						<input type="text" class="form-control" id="username" name="username" value="<%out.print(u.getUsername()); %>" placeholder="<%out.print(u.getUsername()); %>">
    					</div>
    					<div class="form-group">
    						<label for="password" class="sr-only">Old Password</label>
    						<input type="password" class="form-control" id="password" name="password" value="<%out.print(u.getPassword()); %>" placeholder="<%out.print(u.getPassword()); %>" disabled="disabled">
    					</div>
    					<div class="form-group">
    						<label for="password" class="sr-only">New Password</label>
    						<input type="password" class="form-control" id="password" name="npassword" placeholder="new password">
    					</div>
    					<div class="form-group">
    						<label for="password_confirm" class="sr-only">Confirm new Password</label>
    						<input type="password" class="form-control" id="password_confirm" name="conpassword" placeholder="confirm new password">
    					</div>

    					<div class="form-group">
    						<label for="name" class="sr-only">Name</label>
    						<input type="text" class="form-control" id="name" name="name" value="<%out.print(u.getName());%>" placeholder="<%out.print(u.getName());%>">
    					</div>

              			<div class="form-group">
    						<label for="surname" class="sr-only">Surname</label>
    						<input type="text" class="form-control" id="surname" name="surname" value="<%out.print(u.getSurname());%>" placeholder="<%out.print(u.getSurname());%>">
    					</div>

    					<div class="form-group">
    						<label for="year" class="sr-only">Year of birth</label>
    						<input type="text" class="form-control" id="age" name="year" value="<%out.print(u.getYearOfBirth());%>" placeholder="<%out.print(u.getYearOfBirth());%>">
    					</div>

    					<div class="form-group login-group-checkbox">
    						<%if (u.getSex().equals("m")) {%>
    						<input type="radio" class="" name="gender" value="m" id="male" placeholder="username" checked="checked">
    						<label for="male">Male</label>
							<input type="radio" class="" name="gender" value="f" id="female" placeholder="username">
    						<label for="female">Female</label>
							<%}else{ %>
							<input type="radio" class="" name="gender" value="m" id="male" placeholder="username">
    						<label for="male">Male</label>
    						<input type="radio" class="" name="gender" value="f" id="female" placeholder="username" checked="checked">
    						<label for="female">Female</label>
    						<%} %>
    					</div>
    				</div>
    				<button type="submit" class="login-button" style="background-color: black" ><img src="arrow.png" width=22 height=22></button>
    			</div>
    		</form>
    		<br><br>
			<form name="deleteAccount" action="remove.jsp" method="POST">
				<button name="deleteAccount" class ="btn btn-danger delete2">Delete Account</button>
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
<br>
<br>
<br>

    <%@include file="footer.jsp" %>

      <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
      <!-- Include all compiled plugins (below), or include individual files as needed -->
      <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    </body>
    </html>
