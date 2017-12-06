<HTML>
<head>
<%@ include file="header.jsp" %>
</head>

<%

if (session.getAttribute("user") != null) {
	out.print(session.getAttribute("user"));
	out.print("<br>" + session.getAttribute("fullname"));	
}
else {
	out.print("You are not authenticated");
}


%>

<body>
</body>

</HTML>