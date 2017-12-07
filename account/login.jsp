<html>
<head>
<%@include file="../constants.jsp" %>
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
	String pass = "";

	if (cookies != null) {
		for (Cookie cookie : cookies) {
			if (cookie.getName().equals(USERNAME_COOKIE)) {
				name = cookie.getValue();
			}
			else if (cookie.getName().equals(PASSWORD_COOKIE)) {
				pass = cookie.getValue();
			}
		}
	}

	String isChecked = "";
	if (!name.equals("") && !pass.equals("")) {
		isChecked = "checked";
	}
%>


<form method="post" action="actions/login_action.jsp">
	<label>Login ID:</label><input name="user" value = "<%= name %>"/><br>
	<label>Password:</label> <input name="pass" value = "<%= pass %>" type="password" /><br>
	<label>Remember Me:</label> <input type="checkbox" name="rememberMe" value="true" <%= isChecked %>>
	<input type="submit" value="login"/>
</form>

</body>

<%@ include file="../footer.jsp" %>
</html>