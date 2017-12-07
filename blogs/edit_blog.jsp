<HTML>
<head>
<%@ include file="../header.jsp" %>
<%@ include file="../databases.jsp" %>
<title>Add Blog</title>
</head>



<body>
<%
String title = "";
String body = "";
String blog_id = request.getParameter("blog_id");
if (session.getAttribute("username") == null) {
  con.close();
	response.sendRedirect("../index.jsp");
}
else {
  String query = "SELECT * FROM blogs WHERE user = ? AND blog_id=?";
  PreparedStatement stmt = con.prepareStatement(query);
  stmt.setString(1, session.getAttribute("username").toString());
  stmt.setString(2, blog_id);
  ResultSet rs = stmt.executeQuery();
  if (rs.next()) {
    title = rs.getString("title");
    body = rs.getString("body");
    stmt.close();
    con.close();
  }
  else {
    //Invalid blog ID or a user is attempting to edit a blog that isn't theirs
    stmt.close();
    con.close();
    response.sendRedirect("myblogs.jsp");
  }

}
%>


<div class="container">
  <h2>Blog Title:</h2>
  <h5>Max 32 characters</h5>
  <form method="post" action="actions/edit_blog_action.jsp">
    <div class="form-group">
      <textarea class="form-control" name="title" rows="1" id="comment"><%= title %></textarea>
      <br>
      <label for="comment">Blog Body:</label>
      <textarea class="form-control" name="body" rows="20" id="comment"><%= body %></textarea>
      <br>
      <input type="hidden" name="blog_id" value="<%= blog_id %>"/>
      <input type="Submit"/>
    </div>
  </form>
</div>

</body>




<%@ include file="../footer.jsp" %>
</HTML>