<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page errorPage="error.jsp"%>
<%@ page import="org.afdemp.bootcamp.domain.QueryCat" %>
<%@ page import="org.afdemp.bootcamp.domain.Query" %>
<%@ page import="org.afdemp.bootcamp.controllers.SearchController" %>
<%@ page import="org.afdemp.bootcamp.dao.QueryDAO, java.util.List, java.util.stream.*, java.util.*, java.util.Collections" %>



<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
  <title>Book Camp</title>
  <link href="carousel.css" rel="stylesheet">
  <!-- Bootstrap -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
  <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->
</head>
<body>

  <nav class="navbar navbar-default navbar-fixed-top">
    <div class="container-fluid">
      <!-- Brand and toggle get grouped for better mobile display -->
      <div class="navbar-header">
        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
          <span class="sr-only">Toggle navigation</span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand" href="#" ><img alt="Brand" src="images/bookcamp.png" width=190 height=35></a>
      </div>

      <!-- Collect the nav links, forms, and other content for toggling -->
      <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
        <ul class="nav navbar-nav">
          <li class="active"><a href="#">Home <span class="sr-only">(current)</span></a></li>
          <li class="dropdown">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Categories <span class="caret"></span></a>
            <ul class="dropdown-menu">
            <%
            List<QueryCat> catdao = (List<QueryCat>) request.getAttribute("catdao");
            for (int i=0; catdao.size()>i;){ 
            	
            	String dropcat = catdao.get(i).getBookcategory();
            			i++;
            	 
            %>
            
              <li><a href="#"><%=dropcat %></a></li>
              <% } %>
            </ul>
          </li>
        </ul>
        <ul class="nav navbar-nav navbar-right">
          <li><a href="#">Log In</a></li>
        </ul>

          <form class="navbar-form navbar-search" role="search"  method="get"  action="SearchController">

          <div class="input-group">
            <div class="input-group-btn">
              <select id="searchby" name="searchby" type="select" class="btn btn-search btn-default dropdown-toggle selectpicker" data-toggle="dropdown" required name=>
                <span class="glyphicon glyphicon-search"></span>
                <span class="label-icon">Search by...</span>
                <span class="caret"></span>

                <ul class="dropdown-menu pull-left" role="menu">
                  <li>
                    <option value="book.title" selected>
                      <span class="glyphicon glyphicon-book"></span>
                      <span class="label-icon">Search By Book Title</span>
                    </option>
                  </li>
                  <li>
                    <option value="book.category">
                      <span class="glyphicon glyphicon-folder-open"></span>
                      <span class=se"label-icon">Search By Category</span>
                    </option>
                  </li>
                  <li>
                    <option value="author.surname">
                      <span class="glyphicon glyphicon-user"></span>
                      <span class="label-icon">Search By Author</span>
                    </option>
                  </li>
                </ul>
              </select>
              </div>

            <input type="text" name="searchfield" class="form-control" size=55% placeholder="Search by Book Title, Category or Author">
            <div class="input-group-btn">

            </div>

          </div>

          <button type="submit" class="btn btn-search btn-default" class="Submit">
            GO
          </button>

        </form>


      </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
  </nav>

  <br>  <br>  <br>
  <!-- SEARCH RESULT -->

  <div class="container">

    <hgroup class="mb20">
      <h1>Search Results</h1>  
<% List<QueryCat> qdao = (List<QueryCat>) request.getAttribute("qdao");

Collections.sort(qdao, new Comparator<QueryCat>() {
	@Override
	public int compare(QueryCat cat1, QueryCat cat2)
	{ 
		if ((cat1.getAveragerating()!=null & (cat2.getAveragerating()!=null))){
			double a= Double.parseDouble((cat1.getAveragerating()));
			double b= Double.parseDouble((cat2.getAveragerating()));
			double delta= a - b;
			if(delta > 0) return -1;
			if(delta < 0) return 1;
		}
			return 0;
		
		
	}
});
	
     Query query= (Query) request.getAttribute("query");
     String searchby = request.getParameter("searchby");
     String keyword = request.getParameter("searchfield");
     
     int size= qdao.size();
%>

      <h2 class="lead"><strong class="text-danger"><%=size %></strong> results were found for the search for <strong class="text-danger">"<%=keyword %>"</strong></h2>
    </hgroup>
    <section class="col-xs-12 col-sm-6 col-md-12">
      <!-- SEARCH ITEM -->
      
<% for (int i=0; size>i;i++){
	if (qdao.get(i).getAveragerating()!=null){
QueryCat book = qdao.get(i);

String authorname=book.getAuthorname(); 
String bookimage  = book.getBookimage();
String booktitle = book.getBooktitle();
String bookcategory = book.getBookcategory();
String authorsurname = book.getAuthorsurname();
String averagerating = book.getAveragerating();
String year=book.getYear();
String desc=book.getDesc(); 
String bookid=book.getBookid();

int count=0;%>
      
      <article class="search-result row">
        <div class="col-xs-12 col-sm-12 col-md-3">
          <a href="#" title="Lorem ipsum" class="thumbnail"><img src="<%=bookimage%>" alt="<%=authorname %><%=authorsurname %>" /></a>
        </div>
         <div class="col-xs-12 col-sm-12 col-md-7 excerpet">
          <h3><a href="#" title=""></a><%=booktitle %> </h3>
          <br>
          <p><%=desc %></p>
          
          <form  method="POST" action="SearchController" >
          <button type="submit" name="addtowish" value="<%=bookid%>"   class="btn btn-search btn-default" class="Submit">
            Add to wishlist </button>
          </form>
          
          <form  method="POST" action="SearchController" > 
          <button type="submit" name="delarg" value="<%=bookid%>"   class="btn btn-search btn-default" class="Submit">
            Delete from wishlist </button>
            
          </form>
          
          
        </div>
        <div class="col-xs-12 col-sm-12 col-md-2">
          <ul class="meta-search">
            <br>
            <% if (averagerating!=null){  %>
            <li><i class="glyphicon glyphicon-star"></i> <span><%=averagerating %></span></li>
            <%} %>
            <li><i class="glyphicon glyphicon-user"></i> <span><%=authorname %><%=authorsurname %></span></li>
            <li><i class="glyphicon glyphicon-folder-open"></i> <span><%=bookcategory %></span></li>
            <li><i class="glyphicon glyphicon-calendar"></i> <span><%=year %></span></li>
  
          </ul>
        </div>
        <span class="clearfix borda"></span>
      </article>
      <%
      count++;
       }} %>
      <!-- SEARCH ITEM END -->


    </section>
  </div>
  <!-- SEARCH END -->


  <div class="col-sm-12" align=center >
    <div class="panel panel-default" style="background-color:grey">
      <table align=center width=60%>
        <tr><td align=center><a href="error.jsp">Error Page</a><td align=center><a href="contact.jsp">Contact</a><td align=center><a href="#">Top 250</a>
        </table>
      </div>
    </div>


    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
  </body>
  </html>