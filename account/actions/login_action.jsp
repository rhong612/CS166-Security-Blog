<%@include file="../../databases.jsp" %>
<%@include file="../../constants.jsp" %>
<%@page import="java.security.SecureRandom" %>   
<%@page import="java.util.*" %>
<%@page import="java.net.URL" %>
<%@page import="java.net.HttpURLConnection" %>
<%@page import="java.net.URLEncoder" %>
<%@page import="java.io.DataOutputStream" %> 
<%@page import="java.io.InputStream" %>
<%@page import="java.io.InputStreamReader" %>
<%@page import="org.json.simple.parser.*" %>   
<%@page import="org.json.simple.*" %>


<%
//Google ReCAPTCHA v2
String userResponse = request.getParameter("g-recaptcha-response");
String urlParameters = "secret=" + URLEncoder.encode(SECRET_CAPTCHA_CODE, "UTF-8") + "&response=" + URLEncoder.encode(userResponse, "UTF-8");
URL url = new URL("https://www.google.com/recaptcha/api/siteverify");
HttpURLConnection connection = (HttpURLConnection) url.openConnection();
connection.setRequestMethod("POST");
connection.setDoOutput(true);

//Send request
DataOutputStream postRequest = new DataOutputStream (connection.getOutputStream());
postRequest.writeBytes(urlParameters);
postRequest.close();

InputStream inputStream = connection.getInputStream();
JSONParser jsonParser = new JSONParser();
JSONObject jsonObject = (JSONObject)jsonParser.parse(new InputStreamReader(inputStream, "UTF-8"));
inputStream.close();


String result = jsonObject.get("success").toString();

if (result.equals("false")) {
	session.setAttribute(ERROR_MSG, "Please click on the captcha." );
	con.close();
	response.sendRedirect("../login.jsp");
}
else {
	//Check user
	String user = request.getParameter( "user" );
	String pass = request.getParameter( "pass" );
	String sqlStr = "SELECT fullname FROM login WHERE user=? and pass = sha2(CONCAT(login.salt, ?), 256)";
	PreparedStatement stmt = con.prepareStatement(sqlStr);
	stmt.setString(1,user);
	stmt.setString(2,pass);
	ResultSet rs = stmt.executeQuery();
	if ( rs.next() ) {
		session.setAttribute( "username", user );
		session.setAttribute( "fullname", rs.getString("fullname"));
		
		if (request.getParameter("rememberMe") != null) {
			//Set cookie to remember user account details
			Cookie usernameCookie = new Cookie(USERNAME_COOKIE, user);
			usernameCookie.setMaxAge(24*60*60);
			usernameCookie.setPath("/account");
			response.addCookie(usernameCookie);
		}
		else {
			//Remove all username cookies
			Cookie[] cookies = request.getCookies();
			if (cookies != null) {
				for (Cookie cookie : cookies) {
					if (cookie.getName().equals(USERNAME_COOKIE)) {
						cookie.setMaxAge(0);
						response.addCookie(cookie);
					}
				}
			}
		}

		//Generate CSRF token
		SecureRandom tokenGenerator = new SecureRandom();
		byte[] token = new byte[16]; //16 bytes token
		tokenGenerator.nextBytes(token);
		String tokenStr = Base64.getEncoder().encodeToString(token);
		session.setAttribute( "token", tokenStr);
		session.setMaxInactiveInterval(60 * 60); //1 hour

		stmt.close();
		con.close();
		response.sendRedirect("../../index.jsp");	
	} else {
		//Invalid login credentials
		session.setAttribute(ERROR_MSG, "Incorrect username and/or password" );
		stmt.close();
		con.close();
		response.sendRedirect("../login.jsp");
	}
}
%>
