<%-- 
    Document   : ExpPage
    Created on : Jun 28, 2017, 4:07:04 PM
    Author     : rahulchauhan
--%>
<%@page isErrorPage="true" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Exception Page</title>
    </head>
    <body>
        <h1>Exception Aaya re!</h1>
        <p> Something gone wrong! </p>
        <p><%
            if(exception!=null)
            {
        out.print(exception);
            }
        %></p>
        <a href="home.jsp">HOME</a>
    </body>
</html>
