<%@include file="../../databases.jsp" %>
<%@include file="../../constants.jsp" %>




<%

//Check user
String user = request.getParameter( "user" );
String pass = request.getParameter( "pass" );
String sqlStr = "SELECT fullname FROM login WHERE user=? and pass = sha2(?, 256)";
PreparedStatement stmt = con.prepareStatement(sqlStr);
stmt.setString(1,user);
stmt.setString(2,pass);
ResultSet rs = stmt.executeQuery();
if ( rs.next() ) {
	session.setAttribute( "username", user );
	session.setAttribute( "fullname", rs.getString("fullname"));
	session.setMaxInactiveInterval(60 * 60); //1 hour

	if (request.getParameter("rememberMe") != null) {
		//Set cookie to remember user account details
		Cookie usernameCookie = new Cookie(USERNAME_COOKIE, user);
		Cookie passwordCookie = new Cookie(PASSWORD_COOKIE, pass);
		usernameCookie.setMaxAge(24*60*60);
		passwordCookie.setMaxAge(24*60*60);
		response.addCookie(usernameCookie);
		response.addCookie(passwordCookie);
	}
	else {
		//Remove all cookies
		Cookie[] cookies = request.getCookies();
		if (cookies != null) {
			for (Cookie cookie : cookies) {
				if (cookie.getName().equals(USERNAME_COOKIE) || cookie.getName().equals(PASSWORD_COOKIE)) {
					cookie.setMaxAge(0);
					response.addCookie(cookie);
				}
			}
		}
	}

	stmt.close();
	con.close();
	response.sendRedirect("../../index.jsp");	
} else {
	//Invalid login credentials
	stmt.close();
	con.close();
	response.sendRedirect("../login.jsp");
}
%>
