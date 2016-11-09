<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
  <link rel="icon" href="favicon.ico">
  <title>Book Camp</title>
  <link rel="stylesheet" type="text/css" href="css.css">
  
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
              <li><a href="#">Comedy</a></li>
              <li><a href="#">Drama</a></li>
              <li><a href="#">Fiction</a></li>
              <li><a href="#">Children's</a></li>
              <li><a href="#">Fanatasy</a></li>
              <li><a href="#">Historical Fiction</a></li>
              <li><a href="#">Play</a></li>
              <li><a href="#">Science Fiction</a></li>
              <li><a href="#">Young adult</a></li>
            </ul>
          </li>
        </ul>
        <ul class="nav navbar-nav navbar-right">
          <li><a href="#">Log In</a></li>
        </ul>

          <form class="navbar-form navbar-search" role="search"  method="get"  action="SearchController">
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
          <div class="input-group">
            <div class="input-group-btn">
             
              </div>

            <input type="text" name="searchfield" class="form-control" size=55% placeholder="Search by Book Title, Category or Author">
            <div class="input-group-btn">
          </div>

          </div>
			<select id="rating" name="rating" type="select" class="btn btn-search btn-default dropdown-toggle selectpicker" data-toggle="dropdown"  >
                <span class="glyphicon glyphicon-search"></span>
                <span class="label-icon">Rating of ...</span>
                <span class="caret"></span>

                <ul class="dropdown-menu pull-left" role="menu">
                  <li>
                    <option value="" selected>
                      <span class="glyphicon glyphicon-book"></span>
                      <span class="label-icon">Any rating</span>
                    </option>
                  </li>
                  <li>
                    <option value="AND rating.rating>1" >
                      <span class="glyphicon glyphicon-book"></span>
                      <span class="label-icon">1 Star</span>
                    </option>
                  </li>
                  <li>
                    <option value="AND rating.rating>2">
                      <span class="glyphicon glyphicon-folder-open"></span>
                      <span class=se"label-icon">2 Stars</span>
                    </option>
                  </li>
                  <li>
                    <option value="AND rating.rating>3">
                      <span class="glyphicon glyphicon-user"></span>
                      <span class="label-icon">3 Stars</span>
                    </option>
                  </li>
                  <li>
                    <option value="AND rating.rating>4">
                      <span class="glyphicon glyphicon-user"></span>
                      <span class="label-icon">4 Stars</span>
                    </option>
                  </li>
                  <li>
                    <option value="AND rating.rating>5">
                      <span class="glyphicon glyphicon-user"></span>
                      <span class="label-icon">5 Stars</span>
                    </option>
                  </li>
                </ul>
              </select>
          <button type="submit" class="btn btn-search btn-default" class="Submit">
            GO
          </button>

        </form>


      </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
  </nav>

  <br>  <br>  <br> <br>  <br>

<%  String bookimage = (String) request.getAttribute("addedbookimage");%>

<div class="container">

<article class="search-result row">
        <div class="col-xs-12 col-sm-12 col-md-3">
          <a href="#" title="<%=bookimage%>" class="thumbnail"><img src="<%=bookimage%>" /> </a>
        </div>
        
        <div class="col-xs-12 col-sm-12 col-md-7 excerpet">
        <br> <br>  <br>
          <h3><a href="#" title=""></a>This amazing book has been added to your wishlist if it wasn't already there! </h3>
          
        </div>
</article>
</div>
 <footer>
          <div class="col-sm-12" align=center >
      
       		<table align=center width=60%>
          <tr><td align=center width=20%><a href="error.jsp">Sample error page</a><td align=center width=20%><a href="index.jsp">Contact</a><td align=center width=20%><a href="error.jsp">Top 250</a></td></tr>
           <tr></tr>
           <tr><td></td><td align=center width=60%><img src="favicon.ico"> © 2015 <a href="index.jsp">Bookcamp.we.rock</a>. All rights reserved.</td></tr>
            </table>
                
        </div>
      
        </footer>


      <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
      <!-- Include all compiled plugins (below), or include individual files as needed -->
      <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    </body>
    </html>