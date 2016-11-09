<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ page isErrorPage="true"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
  <title>Book Camp - Error Page</title>
    <link rel="icon" href="favicon.ico">
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

<div class="container">
  <div class="row">
    <div class="span12">
      <div class="hero-unit center">
          <h1>Page Not Found <small><font face="Tahoma" color="red">Error 404</font></small></h1>
          <br />
          <p>The page you requested could not be found, either contact your webmaster or try again. Use your browsers <b>Back</b> button to navigate to the page you have prevously come from</p>
          <p><b>Or you could just press this neat little button:</b></p>
          <a href="index.jsp" class="btn btn-large btn-info"><i class="icon-home icon-white"></i> Take Me Home</a>
        </div>
        <br />
      </div>
      </div>
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

</body>
</html>