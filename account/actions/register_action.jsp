<%@include file="../../databases.jsp" %>


<%
String fullname = request.getParameter( "fullname" );
String user = request.getParameter( "user" );
String pass = request.getParameter( "pass" );
String sqlStr = "INSERT INTO login(fullname,user, pass) VALUES (?, ?, sha2(?, 256))";
PreparedStatement stmt = con.prepareStatement(sqlStr);
stmt.setString(1,fullname);
stmt.setString(2,user);
stmt.setString(3,pass);
stmt.executeUpdate();
stmt.close();
con.close();
response.sendRedirect("../login.jsp"); 
%>
