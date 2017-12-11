<HTML>
<head>
<%@ include file="../header.jsp" %>
<title>CS 166 Security Blog</title>
</head>


<body>
<p>You might have noticed that every time you close the browser, this site automatically logs you off. That is due to an expiring session. A session is essentially an object that is associated with each visitor. Data can be stored in a session and retrieved. Each visitor has a different session ID, allowing the server to differentiate them. For example, a session may keep track of the visitor's username, so the server can know who is authenticated. Sessions are set to expire after a certain time period. In terms of JSP/Servlets, the session is automatically expired when the visitor closes his/her browser. That is why you must sign in again afterwards.</p>
</body>

<%@ include file="../footer.jsp" %>
</HTML>