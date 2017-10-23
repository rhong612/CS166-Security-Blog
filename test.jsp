
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

<h2> <%= user.getUsername() %>
	<br>
 <%= user.getPassword() %> </h2>

<%
    System.out.println( "Scriptlet test" );
    java.util.Date date = new java.util.Date();
%>
The time is now <%= date %>
<br>
Test
</body>
</HTML>
