<HTML>
<head>
<%@ include file="../header.jsp" %>
<title>CS 166 Security Blog</title>
<script>
$(document).ready(function(){
        $('#safeSearchBtn').click(function() {
        	$.ajax({
	            url: 'actions/sql_safe_search_action.jsp',
	            type: 'POST',
	            data: { searchTerm: $("#searchTerm").val()},
	            success: function(response) {
	                $('#searchFeedback').html(response)
	            },
	            error: function(error) {
	                console.log(error);
	            }
        	});
        });


        $('#badSearchBtn').click(function() {
        	$.ajax({
	            url: 'actions/sql_bad_search_action.jsp',
	            type: 'POST',
	            data: { badSearchTerm: $("#badSearchTerm").val()},
	            success: function(response) {
	                $('#searchFeedback').html(response)
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
<p>SQL Injection is an attack in which the attacker inputs malicious SQL code in a web page. Through SQL injection, an attacker can gain unauthorized access to your website, read data stored in your MySQL database, or destroy your data. Suppose a login system uses the following query: "SELECT * FROM users WHERE username=' + userInput + ' AND password=' + userPW + '"; If an attacker inputted " ' OR 1=1;# " as their username, then the SELECT query will get every single row in the table, resulting in unauthorized access.</p>

<h3>Try it out: </h3>
<p>Below is a search box that is protected against SQL injection through the use of Prepared Statements. The search results will appear without the page reloading due to the use of AJAX. Input a term into the search box and all of the blogs stored in the database that contain your search term will be shown. Test it out by trying some terms that are in some of the blogs you've read here. For example, if you input "javascript", the Behind the Scenes Tour blog will be shown, because it contains the word "javascript" in its body.</p>

<p>Then, try some SQL injection. Input the following term into the search box and observe that it returns no results: ' OR 1=1;#</p>
<textarea class="form-control" rows="1" id="searchTerm"></textarea>
<input type="button" id="safeSearchBtn" name="submit" value="Search"/>


<p>The search box below is unprotected against SQL injection. Instead of using PreparedStatements, user input is concatenated with the SQL query string. Let's try the same query with the second (evil) search box below. This form is not protected against SQL injection. Thus, the query ' OR 1=1;# will return the entire list of blogs stored in the database.</p>

<textarea class="form-control" rows="1" id="badSearchTerm"></textarea>
<input type="button" id="badSearchBtn" name="submit" value="Evil Search"/>


<h3>Search Results</h3>
<div id="searchFeedback"></div>

</body>

<%@ include file="../footer.jsp" %>
</HTML>