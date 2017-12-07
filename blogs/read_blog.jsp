<HTML>
<head>
<%@ include file="../header.jsp" %>
<%@ include file="../databases.jsp" %>
<%@ page import="org.jsoup.Jsoup" %>
<%@ page import="org.jsoup.safety.Whitelist" %>
</head>



<body>

<%
String title = "404";
String query = "SELECT * FROM blogs NATURAL JOIN login WHERE blog_id = ?";
PreparedStatement stmt = con.prepareStatement(query);
stmt.setString(1, request.getParameter("blog_id"));
ResultSet rs = stmt.executeQuery();
if (rs.next()) {
  title = rs.getString("title");
  String author = rs.getString("fullname");
  String body = rs.getString("body");
%>

<div class="container">
  <div class="row">
    <div class="col-md-12">
      <h2 class="text-center"><%= title %></h2>
      <h4 class="text-center">By: <%= author %></h4>
      <h5 style="word-wrap: break-word;""><%= Jsoup.clean(body, Whitelist.basicWithImages())  %></h5>
    </div>
  </div>
</div>

<%
}
else {
  out.print("<h2>This blog could not be found.</h2>");
}

stmt.close();
con.close();

%>

</body>


<title><%= title %></title>
</HTML>