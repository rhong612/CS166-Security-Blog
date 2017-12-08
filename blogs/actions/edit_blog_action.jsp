<%@include file="../../databases.jsp" %>


<%
String title = request.getParameter("title");
String body = request.getParameter("body");
String blog_id = request.getParameter("blog_id");
String token = request.getParameter("token");
if (session.getAttribute("username") == null) {
	con.close();
	response.sendRedirect("../../index.jsp");
}
else if (title == null || body == null || !session.getAttribute("token").equals(token)) {
	con.close();
	response.sendRedirect("../../unauthorized.jsp");
}
else if (title.length() >= 32) {
	con.close();
	response.sendRedirect("../myblogs.jsp"); //Title too long
}
else if (body.length() >= 65535) {
	con.close();
	response.sendRedirect("../myblogs.jsp"); //Body too long
}
else {
	String query = "UPDATE blogs SET title=?, body=? WHERE user=? AND blog_id=?";
	PreparedStatement stmt = con.prepareStatement(query);
	stmt.setString(1, title);
	stmt.setString(2, body);
	stmt.setString(3, session.getAttribute("username").toString());
	stmt.setString(4, blog_id);
	try {
		stmt.executeUpdate();
		stmt.close();
		con.close();
		response.sendRedirect("../myblogs.jsp"); //Blog successfully updated
	}
	catch (Exception e) {
		out.println("<h4>Something went wrong. Please contact the system administrator.</h4>");
		stmt.close();
		con.close();
	}
}

%>
