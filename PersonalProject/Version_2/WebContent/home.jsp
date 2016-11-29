<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*"%>
<%@ page import="Bookcamp.*"%>
<!-- PAge icon & page -->
<head>
<link rel="icon" href="favicon.png">
<title>Welcome to BooKcamp!</title>

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


<link rel="stylesheet" href="box.css">
<!-- my page css -->
<link rel="stylesheet" href="star.css">
<!-- my stars css -->
<link rel="stylesheet" href="popup.css">
<link rel="stylesheet" href="login.css">

</head>
<body>
	<%@include file="navbar.jsp"%>
	<br>
	<br>
	<br>
	<%@include file="genres.jsp"%>

	<!-- RANDOM BOOKS-->
	<div class="col-md-9">
		<div class="row panel panel-default ">

			<div class="panel-heading" align=center>Explore new books!</div>
			<div>

				<%
					BookDAO bdao = new BookDAO();
					int numberofbooks = bdao.getAllBooks().size();
					List<Integer> listofbookids = new ArrayList<>();
					for (int i = 0; i < numberofbooks; i++) {
						listofbookids.add(i + 1);
					}
					Random rnd = new Random();
					Collections.shuffle(listofbookids, rnd);
					String primebooktitle = bdao.getBookById(listofbookids.get(0)).getTitle();
					String primebookimage = bdao.getBookById(listofbookids.get(0)).getImagePath();
					int primebookid = listofbookids.get(0);
				%>

				<div class="container-fluid">
					<div>
						<div id="main_area">
							<!-- Slider -->
							<div class="row">
								<div class="col-xs-12" id="slider">
									<!-- Top part of the slider -->
									<div class="row">
										<div class="col-sm-6" id="carousel-bounding-box">
											<div class="carousel slide col-sm-12" id="myCarousel">
												<!-- Carousel items -->
												<div class="carousel-inner " align="center">
													<div class="active item" data-slide-number="0"
														style="height: 450">
														<a href="index.jsp?bookId=<%=primebookid%>"><img
															src="<%=primebookimage%>"></a>
													</div>
													<%
														for (int i = 1; i < 6; i++) {
															

															Book currentBook = bdao.getBookById(listofbookids.get(i));
															String bookimage = currentBook.getImagePath();
													%>

															<div class="item" data-slide-number="<%=i%>"
																style="height: 450px">
																<a href="index.jsp?bookId=<%=currentBook.getBookId()%>">
																<img src="<%=bookimage%>"></a>
															</div>
													<%
														}
													%>
												</div>
							

												<!-- Carousel nav -->
												<a class="left carousel-control" href="#myCarousel"
													role="button" data-slide="prev"> <span
													class="glyphicon glyphicon-chevron-left"></span>
												</a> <a class="right carousel-control" href="#myCarousel"
													role="button" data-slide="next"> <span
													class="glyphicon glyphicon-chevron-right"></span>
												</a>
											</div>
										</div>
										<div class="col-sm-6" id="carousel-text"></div>
										<div id="slide-content" style="display: none;">

											<%
												for (int i = 0; i < 6; i++) {
													Book currentBook = bdao.getBookById(listofbookids.get(i));

													String booktitle = currentBook.getTitle();
													String bookimage = currentBook.getImagePath();
													String desc = currentBook.getDescription();
													String booknameauthor = currentBook.getAuthor().getName();
													String booksurnameauthor = currentBook.getAuthor().getSurname();
											%>

											<div id="slide-content-<%=i%>">
												<h2><%=booktitle%></h2>
												<p>
													By
													<%=booknameauthor%>
													<%=booksurnameauthor%></p>
												<!-- INSERT DESC ? -->
												<a href="index.jsp?bookId=<%=currentBook.getBookId()%>" style="color: blue">Read more</a>
												<br><br><br>
												
												<div align="center"> <!-- memes -->
													<% if ((primebookid % 2) == 0) { %>
													<img src="images/dory.jpg" width=75%>
													<% } else { %>
													<img src="images/bequiet.jpg" width=75%>
													<% } %>			
												</div>
											
											</div>
											<%
												}
											%>

										</div>
									</div>
								</div>
							</div>
							<!--/Slider-->
							<br>
							<div class="row hidden-xs " id="slider-thumbs">
								<!-- Bottom switcher of slider -->

								<%
									for (int i = 0; i < 6; i++) {
										Book currentBook = bdao.getBookById(listofbookids.get(i));

										String booktitle = currentBook.getTitle();
										String bookimage = currentBook.getImagePath();
								%>
								<div class="col-sm-2">
									<a class="thumbnail" id="carousel-selector-<%=i%>"><img
										src="<%=bookimage%>"></a>
								</div>

								<%
									}
								%>

							</div>
						</div>
					</div>



					<span> </span>
				</div>
			</div>
		</div>
	</div>
	<!-- END RANDOM BOOKS-->
	<br>
	<br>
	<br>
	<!--END RANDOM BOOKS-->

	<!-- TOP BOOKS-->
	<div class="col-md-12">
		<div class="row panel panel-default">
			<div class="panel panel-default"
				style="background-color: rgba(255, 255, 255, 0); border: 0">
				<div class="panel-heading" align=center>Top rated books!</div>
				<%
					List<Book> book = bdao.getQuery("book.title", "", "HAVING average > 4");
					for (int i = 0; i < 6; i++) {

						String currentbooktitle = book.get(i).getTitle();
						String currentbookimage = book.get(i).getImagePath();
						int currentbookid = book.get(i).getBookId();
				%>
				<div class="col-sm-3 col-md-2 col-xs-6">
					<a href="index.jsp?bookId=<%=currentbookid%>"><img
						src="<%=currentbookimage%>" width=100% height=40%
						alt="<%=currentbooktitle%>"></a>
					<p></p>

				</div>

				<%
					}
				%>

				<!-- END TOP BOOKS-->
			</div>
		</div>
		</div>
		
	<%@include file="footer.jsp"%>


	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
		integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
		crossorigin="anonymous"></script>
	<script>
		jQuery(document).ready(function($) {

			$('#myCarousel').carousel({
				interval : 5000
			});

			$('#carousel-text').html($('#slide-content-0').html());

			//Handles the carousel thumbnails
			$('[id^=carousel-selector-]').click(function() {
				var id = this.id.substr(this.id.lastIndexOf("-") + 1);
				var id = parseInt(id);
				$('#myCarousel').carousel(id);
			});

			// When the carousel slides, auto update the text
			$('#myCarousel').on('slid.bs.carousel', function(e) {
				var id = $('.item.active').data('slide-number');
				$('#carousel-text').html($('#slide-content-' + id).html());
			});
		});
	</script>
</body>
</html>