<html>
<head>
<%@ include file="../header.jsp" %>
<title>Login Page</title>
</head>
<body>


<%
	if (session.getAttribute("username") != null) {
		response.sendRedirect("../index.jsp");
	}


	Cookie[] cookies = request.getCookies();
	String name = "";

	if (cookies != null) {
		for (Cookie cookie : cookies) {
			if (cookie.getName().equals(USERNAME_COOKIE)) {
				name = cookie.getValue();
			}
		}
	}

	String isChecked = "";
	if (!name.equals("")) {
		isChecked = "checked";
	}
%>


<form method="post" action="actions/login_action.jsp">
	<label>Username:</label><input name="user" value = "<%= name %>"/><br>
	<label>Password:</label> <input name="pass" type="password" /><br>
	<label>Remember Username:</label> <input type="checkbox" name="rememberMe" value="true" <%= isChecked %>>
	<input type="submit" value="login"/>
</form>

</body>

<%@ include file="../footer.jsp" %>
</html>