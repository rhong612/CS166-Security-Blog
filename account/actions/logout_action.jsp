<%@include file="../../databases.jsp" %>
<%@include file="../../constants.jsp" %>




<%

session.invalidate();

//Remove all username cookies
Cookie[] cookies = request.getCookies();
if (cookies != null) {
	for (Cookie cookie : cookies) {
		if (cookie.getName().equals(USERNAME_COOKIE)) {
			cookie.setMaxAge(0);
			cookie.setPath("/account");
			response.addCookie(cookie);
		}
	}
}


response.sendRedirect("../../index.jsp");
%>
