<%@include file="../../databases.jsp" %>


<%
String blog_id = request.getParameter("blog_id");
if (session.getAttribute("username") == null) {
	con.close();
	response.sendRedirect("../../index.jsp");
}
else {
	String query = "DELETE FROM blogs WHERE user=? AND blog_id=?";
	PreparedStatement stmt = con.prepareStatement(query);
	stmt.setString(1, session.getAttribute("username").toString());
	stmt.setString(2, blog_id);
	stmt.executeUpdate();

	stmt.close();
	con.close();
	response.sendRedirect("../myblogs.jsp"); //Blog successfully deleted
}

%>
