<%@page import="java.sql.*" %>


<%
String token = request.getParameter("token");
String input = request.getParameter("searchTerm");
if (token.equals(session.getAttribute("token"))) {
	Connection con = null;
	try{
		Class.forName("com.mysql.jdbc.Driver");
    	con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cs166_test", "injection", "injection");

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
	} catch (Exception e) {
		out.print("An error occurred while connecting to the database");
    }
}

%>

<p>TROLOLOLO</p>