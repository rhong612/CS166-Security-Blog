<%@include file="../../databases.jsp" %>
<%@include file="../../constants.jsp" %>


<%
String blog_id = request.getParameter("blog_id");
String token = request.getParameter("token");
if (session.getAttribute("username") == null || blog_id == null || !session.getAttribute("token").equals(token)) {
	con.close();
	response.sendRedirect("../../unauthorized.jsp");
}
else {
	PreparedStatement stmt = null;
	String query = "DELETE FROM blogs WHERE user=? AND blog_id=?";

	if(session.getAttribute("role") != null && session.getAttribute("role").equals(ADMIN_ROLE)) {
		query = "DELETE FROM blogs WHERE blog_id = ?";
		stmt = con.prepareStatement(query);
		stmt.setString(1, blog_id);
	}
	else {
		stmt = con.prepareStatement(query);
		stmt.setString(1, session.getAttribute("username").toString());
		stmt.setString(2, blog_id);
	}


	try {
		int rowsAffected = stmt.executeUpdate();
		stmt.close();
		con.close();

		if (rowsAffected == 1) {
			session.setAttribute(SUCCESS_MSG, "Blog successfully deleted!" );
		}
		else {
			session.setAttribute(ERROR_MSG, "An error occurred" );
		}
		response.sendRedirect("../myblogs.jsp"); //Blog successfully deleted
	}
	catch (Exception e) {
		out.println("<h4>Something went wrong. Please contact the system administrator.</h4>");
		stmt.close();
		con.close();
	}
}

%>
