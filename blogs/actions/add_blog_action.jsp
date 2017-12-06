<%@include file="../../databases.jsp" %>


<%
String title = request.getParameter("title");
String body = request.getParameter("body");
if (session.getAttribute("username") == null) {
	con.close();
	response.sendRedirect("../../index.jsp");
}
else if (title == null || body == null) {
	con.close();
	response.sendRedirect("../../unauthorized.jsp");
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

	try {
		stmt.executeUpdate();
		stmt.close();
		con.close();
		response.sendRedirect("../myblogs.jsp"); //Blog successfully added
	}
	catch (Exception e) {
		out.println("<h4>Something went wrong. Please contact the system administrator.</h4>");
		stmt.close();
		con.close();
	}

}

%>
