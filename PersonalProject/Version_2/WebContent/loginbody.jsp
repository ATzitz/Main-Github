<body>

<%@include file="navbar.jsp" %>
  
 <br><br><br>
 <div class="row" style="margin-left: 2%; margin-right: 2%;">
	<%@include file="genres.jsp"%>
		<!--Login-->
      <div class="col-lg-6" align=center>
     	<h3 align=center style="color:white">Wrong input</h3>
     	<h4 align=center style="color:white">Please retry</h4>
      	<!-- Main Form -->
      	<div class="login-form-1" align=left>
      		<form id="login-form" class="text-left" action="loginresult.jsp" method="post">
      			<div class="login-form-main-message"></div>
      			<div class="main-login-form">
      				<div class="login-group">
      					<div class="form-group">
      						<label for="username" class="sr-only">Username</label>
      						<input type="text" class="form-control" id="username" name="username" placeholder="username">
      					</div>
      					<div class="form-group">
      						<label for="password" class="sr-only" value="">Password</label>
      						<input type="password" class="form-control" id="password" name="password" placeholder="password">
      					</div>
      					
      				</div>
      				<button type="submit" class="login-button" style="background-color: black" ><img src="arrow.png" width=22 height=22></button>
      			</div>
      			<div class="etc-login-form">
    
      				<p>new user? <a href="register.jsp">create new account</a></p>
      			</div>
      		</form>
      	</div>
      	<!-- end:Main Form -->
      </div>
      <!-- end login-->

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
      <br><br><br>
</div>
    </div>
    <%@include file="footer.jsp" %>


      <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
      <!-- Include all compiled plugins (below), or include individual files as needed -->
      <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    </body>
    </html>
