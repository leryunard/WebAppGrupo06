<%-- 
    Document   : validar.jsp
    Created on : Oct 13, 2022, 11:50:01 PM
    Author     : kevin
--%>
<%@page import="modeloDAO.loginDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
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
                                    out.write("<div class='mt-3 alert alert-danger' role='alert'> Usuario o contraseña incorrectos. Intente nuevamente! </div>");
                                    break;
                            }
                        }
                        if (request.getParameter("cerrar") != null) {
                            session.invalidate();//para eliminar la session !IMPORTANTE¡
                        }
                    %>
    </body>
</html>
