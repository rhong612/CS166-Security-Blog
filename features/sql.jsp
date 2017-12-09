<HTML>
<head>
<%@ include file="../header.jsp" %>
<title>CS 166 Security Blog</title>
</head>


<body>
<h2>SQL Injection</h2>
<p>SQL Injection is an attack in which the attacker inputs malicious SQL code in a web page. </p>

<h3>Try it out: </h3>
<p>Below is a search box that is protected against SQL injection. Input a term into the search box and all of the blogs that contain your search term will be shown. Try the following search term: ' OR 1=1;# </p>
<p>Now, try the same query with this second search box. This form is not protected against SQL injection. The query ' OR 1=1;# will return the entire list of blogs stored in the database.</p>
<p>The example query above was a relatively harmless one. SQL Injection can be used for more malicious purposes such as:.....</p>

<h3>Try it out again:</h3>
<p>Go back to the 2nd search form and input the following query: ';-- DROP TABLE blogs;</p>
</body>

<%@ include file="../footer.jsp" %>
</HTML>