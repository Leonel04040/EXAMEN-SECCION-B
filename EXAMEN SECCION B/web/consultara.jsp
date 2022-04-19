<%-- 
    Document   : consultara
    Created on : Apr 18, 2022, 6:24:23 PM
    Author     : itsnotmel
--%><%@page import="java.util.StringTokenizer"%>


%@ page language="java"%>
<html>
<head>
<title>Example for Printing the OS name</title>
</head>

<body>
    El Sistema operativo es 
<%
 out.println("OS: " + System.getProperty("os.name"));
 String agent = request.getHeader ("user-agent");
 StringTokenizer st = new StringTokenizer (agent ,";");
st.nextToken ();

// Get the user's browser name
String userBrowser = st.nextToken ();

// Get the user's operating system name
String userOs = st.nextToken ();
%>
</body>
</html>

