<%@include file="../../databases.jsp" %>
<%@include file="../../constants.jsp" %>
<%@ page import="org.jsoup.Jsoup" %>
<%@ page import="org.jsoup.safety.Whitelist" %>
<%@ page import="org.jsoup.nodes.Document.OutputSettings" %>



<%
String title = request.getParameter("title");
String body = request.getParameter("body");

String cleanedTitle = Jsoup.clean(title, Whitelist.basicWithImages());
String cleanedBody = Jsoup.clean(body, "", Whitelist.basicWithImages(), new OutputSettings().prettyPrint(false));


String blog_id = request.getParameter("blog_id");
String token = request.getParameter("token");
if (session.getAttribute("username") == null || title == null || body == null || !session.getAttribute("token").equals(token)) {
	con.close();
	response.sendRedirect("../../unauthorized.jsp");
}
else if(!cleanedTitle.equals(title) || !cleanedBody.equals(body)) {
	session.setAttribute(ERROR_MSG, "Invalid characters found in blog title and/or blog body" );
	con.close();
	response.sendRedirect("../myblogs.jsp"); //Invalid HTML entities
	
}
else if (title.length() >= 32) {
	session.setAttribute(ERROR_MSG, "Title cannot be longer than 32 characters" );
	con.close();
	response.sendRedirect("../myblogs.jsp"); //Title too long
}
else if (body.length() >= 65535) {
	session.setAttribute(ERROR_MSG, "Body cannot be longer than 65535 characters" );
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
		session.setAttribute(SUCCESS_MSG, "Blog successfully updated!" );
		response.sendRedirect("../myblogs.jsp"); //Blog successfully updated
	}
	catch (Exception e) {
		out.println("<h4>Something went wrong. Please contact the system administrator.</h4>");
		stmt.close();
		con.close();
	}
}

%>
