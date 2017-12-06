<%@include file="../../databases.jsp" %>


<%
String fullname = request.getParameter( "fullname" );
String user = request.getParameter( "user" );
String pass = request.getParameter( "pass" );
if (fullname == null || user == null || fullname.length() >= 128 || user.length() >= 32) {
	response.sendRedirect("../registration.jsp"); //Full name or username too long
}
else {
	String sqlStr = "INSERT INTO login(fullname,user, pass) VALUES (?, ?, sha2(?, 256))";
	PreparedStatement stmt = con.prepareStatement(sqlStr);
	stmt.setString(1,fullname);
	stmt.setString(2,user);
	stmt.setString(3,pass);
	try {
		stmt.executeUpdate();
		stmt.close();
		con.close();
		response.sendRedirect("../login.jsp"); //Registration succeeded
	}
	catch (Exception e) {
		out.println("<h4>Something went wrong. Please contact the system administrator.</h4>");
		stmt.close();
		con.close();
	}	
}
%>
