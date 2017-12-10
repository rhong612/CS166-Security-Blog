<HTML>
<head>
<%@ include file="../header.jsp" %>
<title>Registration Page</title>
</head>


<%
	if (session.getAttribute("username") != null) {
		response.sendRedirect("../index.jsp");
	}

%>


<body>
	<h2>Please register</h2>
	<form method="post" action="actions/register_action.jsp">
		<label>Name:</label><input name="fullname" required/><br>
		<label>Username:</label><input name="user" required/><br>
		<label>Password:</label> <input name="pass" type="password" required/><br>
		<input type="submit" value="Register"/>
	</form>
</body>

<%@ include file="../footer.jsp" %>
</HTML>