
<jsp:useBean id='user'
 scope='session'
 class='beans.UserBean'/>
<jsp:setProperty name='user' property='*' />

<HTML>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
</head>

<body>
<%@ include file="header.jsp" %>

Main Page Here
</body>

</HTML>