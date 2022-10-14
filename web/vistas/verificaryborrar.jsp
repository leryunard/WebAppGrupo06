<%@page import="modelo.libro"%>
<%@page import="modeloDAO.libroDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
        <title>ELIMINAR UN REGISTRO DE LA TABLA</title>
    </head>
    <body>
        <%@ include file="frmupdate.jsp" %>
        <h1>ELIMINAR UN REGISTRO DE LA TABLA</h1>
        <c:if test="${empty param.id}">
            <c:redirect url="error.jsp">
                <c:param name="destino" value="index.jsp"/>
            </c:redirect>
        </c:if>    
        <c:set var = "Id" value = "${param.id}"/>
        
        <sql:query dataSource = "${fuenteDatos}" var = "result">
            SELECT * from libroDAO;
        </sql:query>
            
        <table border = "1" width = "100%">
            <tr>
                <th>Id</th>
                <th>Titulo</th>
                <th>Isbn</th>
                <th>Autor</th>
                <th>Editorial</th>
            </tr>

            <c:forEach var = "row" items = "${result.rows}">
                <tr class="fila${row.id}">
                    <td><c:out value = "${row.Id}"/></td>
                    <td><c:out value = "${row.Titulo}"/></td>
                    <td><c:out value = "${row.Isbn}"/></td>
                    <td><c:out value = "${row.Autor}"/></td>
                    <td><c:out value = "${row.Editorial}"/></t
                </tr>
            </c:forEach>
        </table>        
        
        <sql:update dataSource = "${fuenteDatos}" var = "count">
            DELETE FROM libroDAO WHERE Id = ?
            <sql:param value = "${empId}" />
        </sql:update>

        <sql:query dataSource = "${fuenteDatos}" var = "result">
            SELECT * from libro;
        </sql:query>
            <h3>Favor verifique que el registro ha sido borrado con éxito</h3>
        <table border = "1" width = "100%">
            <tr>
                <th>Id</th>
                <th>Titulo</th>
                <th>Isbn</th>
                <th>Autor</th>
                <th>Editorial</th>
            </tr>

            <c:forEach var = "row" items = "${result.rows}">
                <tr>
                    <td><c:out value = "${row.Id}"/></td>
                    <td><c:out value = "${row.Titulo}"/></td>
                    <td><c:out value = "${row.Isbn}"/></td>
                    <td><c:out value = "${row.Autor}"/></td>
                    <td><c:out value = "${row.Editorial}"/></td>
                </tr>
            </c:forEach>
        </table>    
        <a href="index.jsp" style="font-size:1cm;color:blue;">RETORNAR A INDEX</a>
    </body>
</html>
