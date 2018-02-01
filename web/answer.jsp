<%-- 
    Document   : answer
    Created on : 8 Apr, 2016, 8:43:38 PM
    Author     : Elcot
--%>

<%@page import="java.util.Enumeration"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>param values</h1>
        paramvalues
        <%Enumeration paramNames = request.getParameterNames();
          while(paramNames.hasMoreElements()){
              String paramName=(String)paramNames.nextElement();
              out.print(paramName);
              String paramvalue=request.getHeader(paramName);
              out.println(paramvalue);
              
          }
          %>
    </body>
</html>
