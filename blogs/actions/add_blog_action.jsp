<%@include file="../../databases.jsp" %>




<%

if (session.getAttribute("username") == null) {
	con.close();
	response.sendRedirect("../myblogs.jsp");
}

String query = "INSERT INTO Blogs(user, title, body) VALUES(?, ?, ?)";
PreparedStatement stmt = con.prepareStatement(query);
stmt.setString(1, session.getAttribute("username").toString());
stmt.setString(2, request.getParameter("title"));
stmt.setString(3, request.getParameter("body"));

stmt.executeUpdate();

stmt.close();
con.close();
%>
