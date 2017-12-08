<HTML>
<head>
<%@ include file="../header.jsp" %>
<%@include file="../databases.jsp" %>
<title>My Blogs</title>
</head>



<body>
<h1> My Blogs </h1>
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
if (session.getAttribute("username") == null) {
	response.sendRedirect("../index.jsp");
}
else {
	String query = "SELECT * FROM blogs WHERE user = ?";
	PreparedStatement stmt = con.prepareStatement(query);
	stmt.setString(1, session.getAttribute("username").toString());
	ResultSet rs = stmt.executeQuery();
	while (rs.next()) {
		String title = rs.getString("title");
		String date = rs.getString("date");
		int blog_id = rs.getInt("blog_id");
%>
			<tr>
				<td><%= title %></td>
				<td><%= date %></td>
				<td>
					<div class="col-sm-6">
						<form method="post" action="edit_blog.jsp"><input type="hidden" name="blog_id" value="<%= blog_id %>"><input type="Submit" value="Edit"></form>
					</div>
					<div class="col-sm-6">
						<form method="post" action="actions/delete_blog_action.jsp">
      						<input type="hidden" name="token" value=<%= session.getAttribute("token") %>><input type="hidden" name="blog_id" value="<%= blog_id %>"><input type="Submit" value="Delete">
      					</form>
					</div>
				</td>
			</tr>

<%
	}

stmt.close();
}
con.close();
%>

	</tbody>
</table>

</body>




<%@ include file="../footer.jsp" %>
</HTML>