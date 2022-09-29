<%-- 
    Document   : editar
    Created on : 09-28-2022, 10:13:45 PM
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
           <%
              libroDAO dao=new libroDAO();
              int id=Integer.parseInt((String)request.getAttribute("idper"));
              libro p=(libro)dao.list(id);
          %>
           <div class="container mt-5">
              <h1>Editar Libro</h1>
              <div class="card">
                <div class="card-body">
                    <form action="controlador">
                        <div class="row">
                            <div class="col">
                                <label>Autor</label>
                                <input class="form-control" type="text" name="txtAutor" value="<%= p.getAutor()%>">
                            </div>
                            <div class="col">
                                <label for="">Editorial</label>
                                <input class="form-control" type="text" name="txtEditorial" value="<%= p.getEditorial()%>">
                            </div>
                            <div class="col">
                                <label for="">Titulo</label>
                                <input class="form-control" type="text" name="txtTitulo" value="<%= p.getTitulo()%>">
                            </div>
                            <div class="col">
                                <label for="">Isbn</label>
                                <input class="form-control" type="text" name="txtIsbn" value="<%= p.getIsbn()%>">
                            </div>
                             <input type="hidden" name="txtId" value="<%= p.getId()%>">
                            <div class="col col-12 mt-2">
                                <input class="btn btn-primary float-end btn-sm" type="submit" name="accion" value="Actualizar">
                            </div>
                        </div>
                       
                     
                       
                        
                       
                    </form>
                </div>
              </div>
        </div>
    </body>
</html>
