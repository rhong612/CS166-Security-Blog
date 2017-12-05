<%@include file="../databases.jsp" %>

<%

//Check user
String user = request.getParameter( "user" );
String pass = request.getParameter( "pass" );
String sqlStr = "SELECT fullname FROM login WHERE user='" + user + "' and pass = sha2('"+ pass + "', 256)";

//String sqlStr = "SELECT fullname FROM login WHERE user=? and pass = sha2(?, 256)";
PreparedStatement stmt = con.prepareStatement(sqlStr);
//stmt.setString(1,user);
//stmt.setString(2,pass);
ResultSet rs = stmt.executeQuery();
//Statement stmt = con.createStatement();
//ResultSet rs = stmt.executeQuery(sqlStr);

if ( rs.next() ) {
	session.setAttribute( "user", user );
	session.setAttribute( "username", rs.getString(1) );
	session.setMaxInactiveInterval(60*20);
	stmt.close();
	con.close();
	response.sendRedirect("blog_list.jsp");	
} else {
	stmt.close();
	con.close();
	response.sendRedirect("login.html");
}
%>



<%
//Correct
/*
String sqlStr = "SELECT count(*) FROM login WHERE user=? and pass = sha2(?, 256)";
PreparedStatement stmt = con.prepareStatement(sqlStr);
stmt.setString(1,user);
stmt.setString(2,pass);
ResultSet rs = stmt.executeQuery();
rs.next();
if ( rs.getInt(1) == 1 ) isAuth=true;
*/

//SQL injection attack
// a ' OR '1'='1' -- 

%>
