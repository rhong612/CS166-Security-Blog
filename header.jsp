
<%@page import="java.util.Date" %>
<%@include file="constants.jsp" %>


<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!--Navigation Bar-->
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="/index.jsp">CS 166 Security Blog</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        <li><a href="/index.jsp">Home</a></li>
        <li><a href="/blogs/main.jsp">Blogs</a></li>
        <li class="dropdown">
          <a class="dropdown-toggle" data-toggle="dropdown" href="#">Feature Demonstrations
          <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="/features/sql.jsp">SQL Injection</a></li>
            <li><a href="/features/xss.jsp">Cross-site Scripting</a></li>
            <li><a href="/features/defacing.jsp">Web Site Defacing</a></li>
            <li><a href="/features/cookies.jsp">Web Cookies</a></li>
            <li><a href="/features/session.jsp">JSP/Servlet Session Management</a></li>
          </ul>
        </li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
          <%
          if (session.getAttribute("username") != null) {
            out.print("<li id='logoutButton'><a href='/account/actions/logout_action.jsp'><span class='glyphicon glyphicon-log-out'></span> Logout</a></li>");
          }
          else {
            out.print("<li><a href='/account/registration.jsp''><span class='glyphicon glyphicon-user'></span> Sign Up</a></li>");
            out.print("<li><a href='/account/login.jsp''><span class='glyphicon glyphicon-log-in'></span> Login</a></li>");
          }
          %>
      </ul>
    </div>
  </div>
</nav>


<%
//Print error msg if it exists
if (session.getAttribute(ERROR_MSG) != null) {
	out.print("<h4 style='color:red;'>" + session.getAttribute(ERROR_MSG) + "</h4>");
	session.removeAttribute(ERROR_MSG);
}

//Print success msg if it exists
if (session.getAttribute(SUCCESS_MSG) != null) {
	out.print("<h4 style='color:green;'>" + session.getAttribute(SUCCESS_MSG) + "</h4>");
	session.removeAttribute(SUCCESS_MSG);
}
%>



<%

  //Cookie used to remember last visited page and time
  Cookie[] allCookies = request.getCookies();
  Date currentDate = new Date();
  boolean timeCookieExists = false;
  boolean pageCookieExists = false;
  String currentPage = request.getRequestURL().toString();
  if (allCookies != null) {
    for (Cookie cookie : allCookies) {
      if (cookie.getName().equals(TIME_COOKIE)) {
      	if (!currentPage.endsWith("cookies.jsp")) {
        	cookie.setValue(currentDate.toString());
        	cookie.setPath("/");
        	response.addCookie(cookie);
      	}
        timeCookieExists = true;
      }
      else if (cookie.getName().equals(PAGE_COOKIE)) {
        if (!currentPage.endsWith("cookies.jsp")) {
          cookie.setValue(currentPage);
          cookie.setPath("/");
          response.addCookie(cookie);
        }
        pageCookieExists = true;
      }
    }
  }
  if (!timeCookieExists) {
    Cookie timeCookie = new Cookie(TIME_COOKIE, currentDate.toString());
    timeCookie.setMaxAge(365 * 24 * 60 * 60); //A year
    timeCookie.setPath("/");
    response.addCookie(timeCookie);
  }
  if (!pageCookieExists) {
    Cookie pageCookie = new Cookie(PAGE_COOKIE, currentPage);
    pageCookie.setMaxAge(365 * 24 * 60 * 60); //A year
    pageCookie.setPath("/");
    response.addCookie(pageCookie);
  }

%>
