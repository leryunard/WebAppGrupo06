<%-- 
    Document   : index
    Created on : 09-27-2022, 03:50:21 PM
    Author     : Leo
--%>

<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
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
            <div class="d-flex justify-content-end">
                <%
                    HttpSession sesion = request.getSession();
                    String usuario;
                    String nivel;
                    if (sesion.getAttribute("user") != null && sesion.getAttribute("nivel") != null) {
                        usuario = sesion.getAttribute("user").toString();
                        nivel = sesion.getAttribute("nivel").toString();
                        out.print("<h5>" + usuario + " Bienvenido</h5>");
                    } else {
                        nivel = "0";
                        out.print("<a href='/WebAppGrupo6/vistas/login.jsp?cerrar=true'><h2> Iniciar Sesion</h2></a>");
                    }
                %>           
            </div>

            <div class="container mt-5">
                <h1>Lista de Libros</h1>
                <div class="card">
                    <div class="card-body">
                        <form action="controlador">
                            <div class="row">
                                <div class="col">
                                    <label>Autor</label>
                                    <input class="form-control" type="text" name="txtAutor">
                                </div>
                                <div class="col">
                                    <label for="">Editorial</label>
                                    <input class="form-control" type="text" name="txtEditorial">
                                </div>
                                <div class="col">
                                    <label for="">Titulo</label>
                                    <input class="form-control" type="text" name="txtTitulo">
                                </div>
                                <div class="col">
                                    <label for="">Isbn</label>
                                    <input class="form-control" type="text" name="txtIsbn">
                                </div>
                                <div class="col col-12 mt-2">
                                    <input class="btn btn-primary float-end btn-sm" type="submit" name="accion" value="Agregar">
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
                
                <table class="table table-bordered mt-4">
                    <thead>
                        <tr>
                            <th class="text-center">ID</th>
                            <th class="text-center">Autor</th>
                            <th class="text-center">Editorial</th>
                            <th class="text-center">Titulo</th>
                            <th class="text-center">isbn</th>
                            <th class="text-center">ACCIONES</th>
                        </tr>
                    </thead>
                    <%
                        libroDAO dao = new libroDAO();
                        List<libro> list = dao.listar();
                        Iterator<libro> iter = list.iterator();
                        libro per = null;
                        while (iter.hasNext()) {
                            per = iter.next();

                    %>
                    <tbody>
                        <tr>
                            <td class="text-center"><%= per.getId()%></td>
                            <td class="text-center"><%= per.getAutor()%></td>
                            <td class="text-center"><%= per.getEditorial()%></td>
                            <td><%= per.getTitulo()%></td>
                            <td><%= per.getIsbn()%></td>
                            <td class="text-center">
                                <a class="btn btn-warning btn-sm" href="controlador?accion=editar&id=<%= per.getId()%>">Actualizar</a>
                                <a class="btn btn-danger btn-sm" href="controlador?accion=eliminar&id=<%= per.getId()%>">Borrar</a>
                            </td>
                        </tr>
                        <%}%>
                    </tbody>
                </table>
                    
            </div>
                    <div>
                        <a class="btn btn-warning btn-sm" href="controlador?accion=cerrar">Cerrar Sesion</a>
                    </div>
    </body>
</html>
