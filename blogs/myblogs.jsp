<HTML>
<head>
<%@ include file="../header.jsp" %>
<%@include file="../databases.jsp" %>
<title>My Blogs</title>
</head>



<body>
<table class="table table-striped">
	<thead>
		<tr>
			<th>Title</th>
			<th>Last Updated</th>
			<th>Action</th>
		</tr>
	</thead>
	<tbody>
<%
String query = "SELECT * FROM blogs WHERE user = ?";
PreparedStatement stmt = con.prepareStatement(query);
stmt.setString(1, session.getAttribute("username").toString());
ResultSet rs = stmt.executeQuery();
while (rs.next()) {
	String title = rs.getString("title");
	String date = rs.getString("date");
%>
		<tr>
			<td><%= title %></td>
			<td><%= date %></td>
			<td>
				<div class="col-sm-6">
					<form method="get" action="edit_blog.jsp"><input type="Submit" value="Edit"></form>
				</div>
				<div class="col-sm-6">
					<form method="post" action="actions/delete_blog.jsp"><input type="Submit" value="Delete"></form>
				</div>
			</td>
		</tr>

<%
}


stmt.close();
con.close();
%>

	</tbody>
</table>

</body>




</HTML>