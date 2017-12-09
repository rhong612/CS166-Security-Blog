<HTML>
<head>
<%@ include file="../header.jsp" %>
<%@ include file="../constants.jsp" %>
<title>CS 166 Security Blog</title>
</head>


<body>

<%
//Check cookies
String lastVisitedPage = "";
String timeOfVisit = "";
Cookie[] cookies = request.getCookies();
if (cookies != null) {
	for (Cookie cookie : cookies) {
		if (cookie.getName().equals(TIME_COOKIE)) {
			timeOfVisit = cookie.getValue();
		}
		else if (cookie.getName().equals(PAGE_COOKIE)) {
			lastVisitedPage = cookie.getValue();
		}
	}
}
out.print("Last visited page: " + lastVisitedPage);
out.print("<br>");
out.print("Time/Date of Visit: " + timeOfVisit);
%>

<h2> Cookie Management </h2>

<p> Above you can see your last visited page (excluding this one) as well as the time/date of the visit. This information was obtained via cookies. </p>



</body>

<%@ include file="../footer.jsp" %>
</HTML>