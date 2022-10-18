<%-- 
    Document   : delete
    Created on : 09-28-2022, 10:50:46 PM
    Author     : Migue Galdámez
--%>

<%@page import="modelo.libro"%>
<%@page import="modeloDAO.libroDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">

        <title>JSP Page</title>
    </head>
    <body>
          
          <div class="container mt-5">
            <h1>Realizado, se ha Eliminado el registro!</h1>
            Nombre Autor <b><%= request.getAttribute("txtAutor") %></b><br>
            Titulo <b><%= request.getAttribute("txtTitulo") %></b><br>
            Editorial <b><%= request.getAttribute("txtEditorial") %></b><br>
            Isbn <b><%= request.getAttribute("txtIsbn") %></b><br>
            <a class="btn btn-success btn-sm" href="controlador?accion=listar">Regresar</a>
        </div>
    </body>
</html>
