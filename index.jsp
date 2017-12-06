<HTML>
<head>
<%@ include file="header.jsp" %>
<title>CS 166 Security Blog</title>
</head>

<%

if (session.getAttribute("username") != null) {
	out.print(session.getAttribute("username"));
	out.print("<br>" + session.getAttribute("fullname"));	
}
else {
	out.print("You are not authenticated");
}


%>

<body>
</body>

</HTML>