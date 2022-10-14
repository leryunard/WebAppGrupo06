<%@page import="modelo.libro"%>
<%@page import="modeloDAO.libroDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ACTUALIZAR UN REGISTRO DE LA TABLA</title>
    </head>
    <body>
        <%@ include file="insert.jsp" %>
        <h1>ACTUALIZAR UN REGISTRO DE LA TABLA</h1>
        <p style="color:blue;font-size: 7mm;">
        <c:if test="${empty param.id or empty param.last or empty param.nlast}">
            <c:redirect url="error.jsp">
                <c:param name="destino" value="index.jsp"/>
            </c:redirect>
        </c:if>           

        <c:set var = "Id" value = "${param.id}"/>

        <sql:update dataSource = "${fuenteDatos}" var = "count">
            UPDATE libroDAO WHERE  id=?
            <sql:param value="${param.nlast}"/>
            <sql:param value = "${empId}" />
        </sql:update>

        <sql:query dataSource = "${fuenteDatos}" var = "result">
            SELECT * from libro;
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
                    <td><c:out value = "${row.Editorial}"/></td>
                </tr>
            </c:forEach>
        </table>

        <sql:update dataSource = "${fuenteDatos}" var = "count">
            UPDATE employees SET last = ?  WHERE  Id=?
            <sql:param value = "${Id}" />
        </sql:update>
        <sql:query dataSource = "${fuenteDatos}" var = "result">
            SELECT * from libroDAO;
        </sql:query>
        <br><br><br>
        <p style="color:blue;font-size: 7mm;">
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
                    <td><c:out value = "${row.Editorial}"/></td>
                </tr>
            </c:forEach>
        </table>    
        <a href="index.jsp" style="font-size:1cm;color:blue;">RETORNAR A INDEX</a>
    </body>
</html>