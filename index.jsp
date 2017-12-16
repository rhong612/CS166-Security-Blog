<HTML>
<head>
<%@ include file="header.jsp" %>
<title>CS 166 Security Blog</title>
</head>


<body>

<%

if (session.getAttribute("username") != null) {
	out.print("Hello " + session.getAttribute("fullname") + ".");	
}
else {
	out.print("Hello guest! Register for an account and login to access all of the features of this site (:");
}


%>
</body>

<%@ include file="footer.jsp" %>
</HTML>