/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.libro;
import modeloDAO.libroDAO;

/**
 *
 * @author Migue Galdámez
 */
public class controlador  extends HttpServlet{
    String listar="index.jsp";
    String add="vistas/add.jsp";
    String edit="vistas/frmupdate.jsp";
    String insert="vistas/insert.jsp";
    String update="vistas/update.jsp";
    String delete="vistas/delete.jsp";
    String error = "vistas/error.jsp";
    String cerrar = "vistas/logout.jsp";
    libro p=new libro();
    libroDAO dao=new libroDAO();
    int id;
    
     protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Controlador</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Controlador at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }
     
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String acceso="";
        String action=request.getParameter("accion");
        if(action.equalsIgnoreCase("listar")){
            acceso=listar;            
        }else if(action.equalsIgnoreCase("add")){
            acceso=add;
        }
        else if(action.equalsIgnoreCase("Agregar")){
            if(request.getParameter("txtAutor") == "" || request.getParameter("txtEditorial") == "" || request.getParameter("txtIsbn") == "" || request.getParameter("txtTitulo") ==""){
                
                acceso = error;
            }
            else{
             p.setAutor(request.getParameter("txtAutor"));
            p.setEditorial(request.getParameter("txtEditorial"));
            p.setIsbn(request.getParameter("txtIsbn"));
            p.setTitulo(request.getParameter("txtTitulo"));
            dao.add(p);
            acceso=insert;
            }
           
        }
        else if(action.equalsIgnoreCase("editar")){
            request.setAttribute("idper",request.getParameter("id"));
            acceso=edit;
        }
        else if(action.equalsIgnoreCase("Actualizar")){
            id=Integer.parseInt(request.getParameter("txtId"));
            p.setId(id);
            p.setAutor(request.getParameter("txtAutor"));
            p.setIsbn(request.getParameter("txtIsbn"));
            p.setTitulo(request.getParameter("txtTitulo"));
            p.setEditorial(request.getParameter("txtEditorial"));
            dao.edit(p);
            acceso=update;
        }
        else if(action.equalsIgnoreCase("eliminar")){
            id=Integer.parseInt(request.getParameter("id"));
            libro l=(libro)dao.list(id);
            request.setAttribute("txtAutor",l.getAutor());
            request.setAttribute("txtTitulo",l.getTitulo());
            request.setAttribute("txtIsbn",l.getIsbn());
            request.setAttribute("txtEditorial",l.getEditorial());
            p.setId(id);
            dao.eliminar(id);
            acceso=delete;
        }
        else if(action.equalsIgnoreCase("cerrar")){
           acceso =cerrar;
        }
        RequestDispatcher vista=request.getRequestDispatcher(acceso);
        vista.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

   
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
