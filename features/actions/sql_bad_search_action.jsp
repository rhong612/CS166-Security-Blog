<%@include file="../../databases.jsp" %>

<%
String input = request.getParameter("badSearchTerm");
String query = "SELECT * FROM blogs WHERE body LIKE '%" + input + "%'";
PreparedStatement stmt = con.prepareStatement(query);
ResultSet rs = stmt.executeQuery();

while (rs.next()) {
	String title = rs.getString("title");
%>

<h3><%= title %></h3>
<br>


<%
}
stmt.close();
con.close();

%>