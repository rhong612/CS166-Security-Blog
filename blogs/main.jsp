<HTML>
<head>
<%@ include file="../header.jsp" %>
<%@ include file="../databases.jsp" %>
<title>Blogs</title>
</head>



<body>
<p>Hello <%= session.getAttribute("username") == null ? "Guest" : session.getAttribute("fullname") %> </p>

<%

if (session.getAttribute("username") != null) {
%>


<form method="post" action="add_blog.jsp">
	<input type="submit" value="Add New Blog"/>
</form>
<form method="post" action="myblogs.jsp">
	<input type="submit" value="My Blogs"/>
</form>
<%
}
%>


<table class="table table-striped">
	<tbody>
		<thead>
			<tr>
				<th>User-submitted Blogs</th>
			</tr>
		</thead>

<%
//Show list of blogs to read
String query = "SELECT * FROM blogs NATURAL JOIN login";
PreparedStatement stmt = con.prepareStatement(query);
ResultSet blogSet = stmt.executeQuery();

while (blogSet.next()) {
	String title = blogSet.getString("title");
	int blog_id = blogSet.getInt("blog_id");
	String author = blogSet.getString("fullname");
%>


		<tr>
			<td>
				<div>
					<h3><%= title %></h3>
					<h5>By: <%= author %></h5>
					<form method="get" action="read_blog.jsp"><input type="hidden" name="blog_id" value="<%= blog_id %>"><input type="Submit" value="Read"></form>
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