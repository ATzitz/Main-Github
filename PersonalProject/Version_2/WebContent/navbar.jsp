	<nav class="navbar navbar-default navbar-fixed-top">
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
				<a class="navbar-brand" href="home.jsp"><img alt="Brand"
					src="images/logo.png" width=190 height=35></a>
			</div>

			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">
					<li><a href="home.jsp">Home <span
							class="sr-only">(current)</span></a></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
				<% User u=(User)session.getAttribute("user");
				if (u==null) {%>
				<li><a href="login.jsp">Log In / Register</a></li>
				<%}else{ %>
         		<li><a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"> <%out.print(u.getUsername()); %> <span class="caret"></span></a>
         		<ul class="dropdown-menu">
        			<li><a href="logedin2.jsp">My profile</a></li>
        			<li><a href="profile.jsp">My account</a></li>
              		<li><a href="logout.jsp">Log out</a></li>
        		</ul></li>
         <% }%>
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
								<option value="having average > 0.5"><span
										class="glyphicon glyphicon-book"></span> <span
										class="label-icon">1 Star</span>
								</option>
							</li>
							<li>
								<option value="having average > 1.5"><span
										class="glyphicon glyphicon-folder-open"></span> <span
										class=se"label-icon">2 Stars</span>
								</option>
							</li>
							<li>
								<option value="having average > 2.5"><span
										class="glyphicon glyphicon-user"></span> <span
										class="label-icon">3 Stars</span>
								</option>
							</li>
							<li>
								<option value="having average > 3.5"><span
										class="glyphicon glyphicon-user"></span> <span
										class="label-icon">4 Stars</span>
								</option>
							</li>
							<li>
								<option value="having average > 4.5"><span
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