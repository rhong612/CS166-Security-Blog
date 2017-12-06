<%@include file="../../databases.jsp" %>
<%@include file="../../constants.jsp" %>




<%

session.invalidate();

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


response.sendRedirect("../../index.jsp");
%>
