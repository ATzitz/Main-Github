<div class="box">
	<a class="btn btn-info wishlist" href="#popup1"><h3>Add to wishlist</h3></a>
</div>

<div id="popup1" class="overlay" align="center">
	<div class="popup">
		<a class="close" href="#">&times;</a>
		<div class="content">
			<div class="col-lg-11" align=center>
      	<div class="logo">login</div>
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
    </div>
	</div>
</div>