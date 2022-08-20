<%-- 
    Document   : index
    Created on : Aug 20, 2022, 1:29:58 AM
    Author     : Anandha Narayanan Balu
--%>

<%@page import="com.mycompany.computerstore.helper.FactoryProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Computer Store | Home</title>
        <%@include file="components/common_css_js.jsp" %>
    </head>
    <body>
        <h1>Hello World!</h1>
        <h1>Creating session factory object</h1>
        
        <%
        
            out.println(FactoryProvider.getFactory());
        
        %>
    </body>
</html>
