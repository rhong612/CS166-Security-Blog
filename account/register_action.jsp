<%@include file="databases.jsp" %>



<%
String fullname = request.getParameter( "fullname" );
String user = request.getParameter( "user" );
String pass = request.getParameter( "pass" );

String sqlStr = "INSERT INTO login(fullname, user, pass) VALUES ('" + fullname + "', '" + user + "', sha2('"+ pass + "', 256))";
Statement stmt = con.createStatement();
stmt.execute(sqlStr);
stmt.close();
con.close();
response.sendRedirect("login.html"); 
%>





<%
//Correct
/*
String sqlStr = "insert into login(fullname,user, pass) values (?,? sha2(?, 256))";
PreparedStatement stmt = con.prepareStatement(sqlStr);
stmt.setString(1,fullname);
stmt.setString(2,user);
stmt.setString(3,pass);
ResultSet rs = stmt.execute();
*/
//SQL injection attack
// a' OR 1=1 -- 
%>
