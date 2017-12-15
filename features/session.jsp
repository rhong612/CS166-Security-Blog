<HTML>
<head>
<%@ include file="../header.jsp" %>
<title>CS 166 Security Blog</title>
</head>


<body>
<h3>Sessions</h3>
<p>You might have noticed that every time you close the browser, this site automatically logs you off. That is due to an expiring session. A session is essentially an object that is associated with each visitor. Data can be stored in a session and retrieved. Each visitor has a different session ID, allowing the server to differentiate them. For example, a session may keep track of the visitor's username, so the server can know who is authenticated. Sessions are set to expire after a certain time period. In terms of JSP/Servlets, the session is automatically expired when the visitor closes his/her browser. That is why you must sign in again afterwards.</p>

<p>While cookies are stored in the client's browser, session data is stored on the server. Therefore, session data is typically trusted. For example, in terms of JSP, if we set a session attribute to a particular value (let's say 5), we can guarantee that the value will not change unless we change it ourselves. The expression session.getAttribute("someRandomAttribute") will return 5. Cookies, on the other hand, can be modified by the client, so we cannot trust cookie data.</p>
</body>

<%@ include file="../footer.jsp" %>
</HTML>