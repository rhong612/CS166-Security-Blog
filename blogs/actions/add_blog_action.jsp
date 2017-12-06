<%@include file="../../databases.jsp" %>


<%
String title = request.getParameter("title");
String body = request.getParameter("body");
if (session.getAttribute("username") == null) {
	con.close();
	response.sendRedirect("../myblogs.jsp");
}
else if (title.length() >= 32) {
	con.close();
	response.sendRedirect("../add_blog.jsp"); //Title too long
}
else if (body.length() >= 65535) {
	con.close();
	response.sendRedirect("../add_blog.jsp"); //Body too long
}
else {
	String query = "INSERT INTO Blogs(user, title, body) VALUES(?, ?, ?)";
	PreparedStatement stmt = con.prepareStatement(query);
	stmt.setString(1, session.getAttribute("username").toString());
	stmt.setString(2, title);
	stmt.setString(3, body);

	stmt.executeUpdate();

	stmt.close();
	con.close();
}

%>
