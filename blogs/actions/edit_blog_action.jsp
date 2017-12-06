<%@include file="../../databases.jsp" %>


<%
String title = request.getParameter("title");
String body = request.getParameter("body");
String blog_id = request.getParameter("blog_id");
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
	String referer = request.getHeader("Referer");
	response.sendRedirect(referer); //Title too long
}
else if (body.length() >= 65535) {
	con.close();
	String referer = request.getHeader("Referer");
	response.sendRedirect(referer); //Body too long
}
else {
	String query = "UPDATE blogs SET title=?, body=? WHERE user=? AND blog_id=?";
	PreparedStatement stmt = con.prepareStatement(query);
	stmt.setString(1, title);
	stmt.setString(2, body);
	stmt.setString(3, session.getAttribute("username").toString());
	stmt.setString(4, blog_id);
	stmt.executeUpdate();

	stmt.close();
	con.close();
	response.sendRedirect("../myblogs.jsp"); //Blog successfully updated
}

%>
