<%-- 
    Document   : questionario
    Created on : 09/05/2018, 11:17:43
    Author     : Tiago
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%if(session.getAttribute("nomeSessao") == null || session.getAttribute("nomeSessao").equals("")) {
            response.sendRedirect("home.jsp?user=deslogado");
        }%>
        <h1>Hello World!</h1>
    </body>
</html>
