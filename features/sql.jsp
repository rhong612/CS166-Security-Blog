<HTML>
<head>
<%@ include file="../header.jsp" %>
<title>CS 166 Security Blog</title>
<%
String token = session.getAttribute("token").toString();
%>
<script>
$(document).ready(function(){
        $('#initDBBtn').click(function() {
        	$.ajax({
	            url: 'actions/sql_action.jsp',
	            type: 'POST',
	            data: { token: "<%= token %>" , searchTerm: $("#searchTerm").val()},
	            success: function(response) {
	                $('#feedback').html(response)
	            },
	            error: function(error) {
	                console.log(error);
	            }
        	});
        });
    });
</script>
</head>


<body>
<h2>SQL Injection</h2>
<p>SQL Injection is an attack in which the attacker inputs malicious SQL code in a web page. </p>

<h3>Try it out: </h3>
<p>First, let's initialize a test database that was created for this demonstration. Click the button below.</p>
<input type="button" id="initDBBtn" value="Initialize"/>


<p>Below is a search box that is protected against SQL injection. Input a term into the search box and all of the blogs (in the test database) that contain your search term will be shown. Try the following search term: ' OR 1=1;# </p>

<div id="feedback"></div>

<textarea class="form-control" rows="1" id="searchTerm"></textarea>
<input type="button" id="searchBtn" name="submit" value="Search"/>


<p>Now, try the same query with this second search box. This form is not protected against SQL injection. The query ' OR 1=1;# will return the entire list of blogs stored in the database.</p>
<p>The example query above was a relatively harmless one. SQL Injection can be used for more malicious purposes such as:.....</p>

<h3>Try it out again:</h3>
<p>Go back to the 2nd search form and input the following query: ';-- DROP TABLE blogs;</p>
</body>

<%@ include file="../footer.jsp" %>
</HTML>