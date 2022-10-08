<%-- 
    Document   : login
    Created on : 07-oct-2022, 21:16:56
    Author     : Carlos Rafaelano
--%>

<%@page import="modeloDAO.loginDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
        <title>login</title>
    </head>
    <body>

        <div class="container w-25 mt-5">
            <div class="card text-center">
                <div class="card-body">
                    <!-- Captura de datos del usuario-->
                    <form action="login.jsp" method="POST">
                        <div class="row">
                            <div class="col">
                                <label for="txtUser">Usuario</label>
                                <input class="form-control" type="text" name="txtUser"><br>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <label for="txtPass">Contraseña</label>
                                <input class="form-control" type="text" name="txtPass"><br>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <input class="btn btn-primary" type="submit" name="btnIngresar" value="Ingresar">
                            </div>
                        </div>
                    </form>
                    <%
                        loginDAO log = new loginDAO();
                        if (request.getParameter("btnIngresar") != null) {
                            String nombre = request.getParameter("txtUser");
                            String contra = request.getParameter("txtPass");
                            HttpSession sesion = request.getSession();
                            switch (log.loguear(nombre, contra)) {
                                case 1:
                                    sesion.setAttribute("user", nombre);
                                    sesion.setAttribute("nivel", "1");
                                    response.sendRedirect("/WebAppGrupo6/index.jsp");
                                    break;
                                case 2:
                                    sesion.setAttribute("user", nombre);
                                    sesion.setAttribute("nivel", "2");
                                    response.sendRedirect("/WebAppGrupo6/index.jsp");
                                    break;
                                default:
                                    out.write("<p><br>Usuario no existe o Contraseña no valida</p>");
                                    break;
                            }
                        }
                        if (request.getParameter("cerrar") != null) {
                            session.invalidate();//para eliminar la session !IMPORTANTE¡
                        }
                    %>
                </div>
            </div>
        </div>

    </body>
</html>
