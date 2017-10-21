<HTML>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
</head>
<BODY>

<!-- Navigation Bar -->

<div class="container-fluid">
  <nav class="navbar navbar-inverse navbar-fixed-top">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbarItems"> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> </button>
      <a class="navbar-brand" href="#">Raymond Hong</a></div>
    <div>
      <div class="collapse navbar-collapse" id="navbarItems">
        <ul class="nav navbar-nav">
          <li id="blogButton" class="active"><a href="#blogs">Blog List</a></li>
          <li id="registerButton"><a href="#register">Register</a></li>
        </ul>
      </div>
    </div>
  </nav>
</div>


<%
    System.out.println( "Scriptlet test" );
    java.util.Date date = new java.util.Date();
%>
The time is now <%= date %>
<br>
Test
</BODY>
</HTML>