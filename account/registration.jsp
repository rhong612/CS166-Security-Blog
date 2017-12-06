<HTML>
<head>
<%@ include file="../header.jsp" %>
<title>Registration Page</title>
</head>





<body>
	<h2>Please register</h2>
	<form method="post" action="actions/register_action.jsp">
		<label>Name:</label><input name="fullname" /><br>
		<label>Login ID:</label><input name="user" /><br>
		<label>Password:</label> <input name="pass" type="password" /><br>
		<input type="submit" value="Register"/>
	</form>
</body>

</HTML>