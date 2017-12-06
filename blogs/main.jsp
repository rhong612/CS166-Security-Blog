<HTML>
<head>
<%@ include file="../header.jsp" %>
<title>Blogs</title>
</head>



<body>
<p>Hello <%= session.getAttribute("fullname") == null ? "Guest" : session.getAttribute("fullname") %> </p>
</body>




</HTML>