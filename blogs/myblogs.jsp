<HTML>
<head>
<%@ include file="../header.jsp" %>
<title>Blogs</title>
</head>



<body>
<p>Hello <%= session.getAttribute("fullname") == null ? "Guest" : session.getAttribute("fullname") %> </p>

<%

if (session.getAttribute("fullname") != null) {
%>


<form method="post" action="actions/add_blog_page.jsp">
	<label>Login ID:</label><input name="user" /><br>
	<label>Password:</label> <input name="pass"  type="password" /><br>
	<label>Remember Me:</label> <input type="checkbox" name="rememberMe" value="true">
	<input type="submit" value="addBlog"/>
</form>


<%
}

//Show list of blogs to read

%>



</body>




</HTML>