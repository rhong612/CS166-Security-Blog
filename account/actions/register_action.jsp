<%@include file="../../databases.jsp" %>
<%@page import="java.security.SecureRandom" %>
<%@page import="java.util.Base64" %>
<%@ page import="org.jsoup.Jsoup" %>
<%@ page import="org.jsoup.safety.Whitelist" %>


<%
String fullname = request.getParameter( "fullname" );
String user = request.getParameter( "user" );

String cleanedName = Jsoup.clean(fullname, Whitelist.basicWithImages());
String cleanedUser = Jsoup.clean(user, Whitelist.basicWithImages());

String pass = request.getParameter( "pass" );
if (!fullname.equals(cleanedName) || !user.equals(cleanedUser) || fullname == null || user == null || fullname.length() >= 128 || user.length() >= 32) {
	response.sendRedirect("../registration.jsp"); //Invalid
}
else {

	SecureRandom saltGenerator = new SecureRandom();
	byte[] salt = new byte[16]; //16 bytes salt
	saltGenerator.nextBytes(salt);
	String saltStr = Base64.getEncoder().encodeToString(salt);

	String sqlStr = "INSERT INTO login(fullname,user, pass, salt) VALUES (?, ?, sha2(?, 256), ?)";
	PreparedStatement stmt = con.prepareStatement(sqlStr);
	stmt.setString(1,fullname);
	stmt.setString(2,user);
	stmt.setString(3, saltStr + pass);
	stmt.setString(4, saltStr);
	try {
		stmt.executeUpdate();
		stmt.close();
		con.close();
		response.sendRedirect("../login.jsp"); //Registration succeeded
	}
	catch (Exception e) {
		out.println("<h4>Username taken.</h4>");
		System.out.println(saltStr);
		stmt.close();
		con.close();
	}	
}
%>
