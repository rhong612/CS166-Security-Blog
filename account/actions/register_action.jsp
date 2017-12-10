<%@include file="../../databases.jsp" %>
<%@include file="../../constants.jsp" %>
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
if (!fullname.equals(cleanedName) || !user.equals(cleanedUser)) {
	session.setAttribute(ERROR_MSG, "Invalid characters found in fullname and/or username" );
	response.sendRedirect("../registration.jsp"); //Invalid
}
else if (fullname.length() >= 128) {
	session.setAttribute(ERROR_MSG, "Fullname cannot be longer than 128 characters" );
	response.sendRedirect("../registration.jsp"); //Invalid
}
else if (user.length() >= 32) {
	session.setAttribute(ERROR_MSG, "Username cannot be longer than 32 characters" );
	response.sendRedirect("../registration.jsp"); //Invalid
}
else if (fullname != null && user != null && pass != null){

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
		session.setAttribute(SUCCESS_MSG, "Registration successful!" );
		stmt.executeUpdate();
		stmt.close();
		con.close();
		response.sendRedirect("../login.jsp"); //Registration succeeded
	}
	catch (Exception e) {
		session.setAttribute(ERROR_MSG, "Username taken" );
		stmt.close();
		con.close();
		response.sendRedirect("../registration.jsp"); //Registration succeeded
	}	
}
%>
