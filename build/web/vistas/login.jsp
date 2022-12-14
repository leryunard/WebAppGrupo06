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
                    <form action="vistas/validar.jsp" method="POST">
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
                                <input class="btn btn-primary w-100" type="submit" name="btnIngresar" value="Ingresar">
                            </div>
                        </div>
                    </form>
                
                </div>
                <div class="col">  </div>
       <a class="btn btn-success btn-sm" href="controlador?accion=listar">Regresar a página principal</a>
            </div>
             <h3 class="mt-2"> Usuarios de Prueba  </h3>
            <ol class="list-group list-group-numbered">
                <li class="list-group-item d-flex justify-content-between align-items-start">
                  <div class="ms-2 me-auto">
                    <div class="fw-bold">admin1</div>
                    admin
                  </div>
                  <span class="badge bg-primary rounded-pill">Nivel 2</span>
                </li>
                <li class="list-group-item d-flex justify-content-between align-items-start">
                  <div class="ms-2 me-auto">
                    <div class="fw-bold">admin2</div>
                    admin2
                  </div>
                  <span class="badge bg-primary rounded-pill">Nivel 1</span>
                </li>

              </ol>
            
        </div>
    </body>
</html>