
<jsp:useBean id='user'
 scope='session'
 class='beans.UserBean'/>
<jsp:setProperty name='user' property='*' />

<HTML>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
</head>



<body>
<%@ include file="header.jsp" %>


<h3 align="center"> Registration Page </h3>
<form method="POST" action="test.jsp">
<p> Username: <input type="text" name="username" size="20"> </p>
<p> Password: <input type="text" name="password" size="20"> </p>

<p>
<input type="submit" value="Submit" name="B1">
</p>
</form>


</body>
</HTML>