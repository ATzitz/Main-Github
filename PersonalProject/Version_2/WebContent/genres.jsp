<div class="col-lg-3">
	<div class="panel panel-default"
		style="background-color: rgba(255, 255, 255, 0); border: 0">
		<div class="panel-heading" align=center>Genres</div>
		<div>
			<br>
			<ul>
				<%
						BookDAO catdao = new BookDAO();
						List<String> categories = catdao.getAllCategories();
						for (int i = 0; i < categories.size(); i++) {
							String category = categories.get(i);
					%>
				<li><a
					href="SearchController?searchby=book.category&searchfield=<%=category%>&rating="
					style="color: blue"><%=category%></a></li>

				<%
						}
					%>
				<li><a
					href="SearchController?searchby=book.title&searchfield=&rating="
					style="color: blue">Any Genre</a></li>
			</ul>
		</div>
		<div align="center">
			<img src="images/genres.gif" width=90%>
		</div>
		<br>
	</div>
	<div align="center">
		<img src="images/brown.jpg" width=95%>
	</div>
	<br>
</div>