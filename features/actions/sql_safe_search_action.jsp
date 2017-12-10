<%@include file="../../databases.jsp" %>


<%
String input = request.getParameter("searchTerm");
String query = "SELECT * FROM blogs WHERE body LIKE ?";
PreparedStatement stmt = con.prepareStatement(query);
stmt.setString(1, "%" + input + "%");
ResultSet rs = stmt.executeQuery();
while (rs.next()) {
	String title = rs.getString("title");
	String body = rs.getString("body");
%>

<h3><%= title %></h3>
<p><%= body %></p>
<br>

<%
}
stmt.close();
con.close();
%>