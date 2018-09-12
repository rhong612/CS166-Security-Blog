# Security Blog
A web application with a focus on security that allows users to write/edit/read blogs

# Demo
You can find a demo of the application hosted on Google Compute Engine here: http://raymondsecurityblog.hopto.org

# Setup
You will need MySQL and Apache Tomcat to run the application on your own machine. Clone the repository. Then, run the included .sql script to create the necessary MySQL tables/columns. The application by default connects to MySQL on port 3306 with the username "root" and no password. If you would like to change this, you can modify databases.jsp to fit your own configurations. Adding a password is highly recommended. Finally, deploy the web pages using Apache Tomcat.
