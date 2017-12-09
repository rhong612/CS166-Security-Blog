<HTML>
<head>
<%@ include file="../header.jsp" %>
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

<p> Above you can see your last visited page (excluding this one) as well as the time/date of the visit. This information was obtained via cookies. Since HTTP is a stateless protocol, cookies can be used as a form of persistent storage. This website uses cookies to store your last visited page via 2 cookies: 1 cookie that tracks the page and another cookie that tracks the date and time. These cookies are updated every time you load a new page. Cookies are stored on your local machine and sent to the server whenever appropriate. Note that no important information is stored in cookies, because they are easily seen and are stored in plaintext. You can try this by opening up your browser console (ctrl+shift+J on google chrome) and typing in "document.cookie" without the quotes. It will then give you a list of cookie names and their respective values. If a site was vulnerable to cross-site scripting injections, an attacker could write javascript code to send victims' cookies to him/her.</p>



</body>

<%@ include file="../footer.jsp" %>
</HTML>