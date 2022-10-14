<%-- 
    Document   : logout
    Created on : 10-10-2022, 09:01:29 PM
    Author     : USER
--%>

<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="modelo.libro"%>
<%@page import="modeloDAO.loginDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            try{
            HttpSession sesion = request.getSession();
            sesion.invalidate();
            out.print("<h1>SESION CERRADA CORRECTAMENTE</h1>");
            
            }
           catch (Exception e){
               out.print("<h1>ERROR AL CERRAR SESION</h1>");
           }
            %>
            <a class="btn btn-success btn-sm" href="controlador?accion=listar">Aceptar</a>
    </body>
</html>
