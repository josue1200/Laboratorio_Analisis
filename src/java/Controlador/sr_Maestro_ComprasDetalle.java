/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Modelo.Compras;
import Modelo.Maestro_ComprasDetalle;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Miguel Rivera
 */
public class sr_Maestro_ComprasDetalle extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet sr_Maestro_ComprasDetalle</title>");            
            out.println("</head>");
            out.println("<body>");
            Maestro_ComprasDetalle cd,cda;
            Compras c;
              if("Siguiente".equals(request.getParameter("boton_Siguiente"))){
                   c=new Compras(Integer.parseInt(request.getParameter("txt_idcompra")),Integer.parseInt(request.getParameter("txt_orden")),Integer.parseInt(request.getParameter("ListaProveedores")),request.getParameter("txt_fo"),request.getParameter("txt_fi"));
                  if(c.agregar()>0){
                  cd=new Maestro_ComprasDetalle();
               int icompra=cd.idcompra();
               request.setAttribute("nuevo", icompra);
                  request.getRequestDispatcher("Maestro_ProductosCompras.jsp").forward(request, response);
                  }else{
                    out.println("<h1>PTM Error</h1>");
             out.println("<a href='Maestro_ProductosCompras.jsp'>Regresar...</a>");
              }
              }else if("modificar".equals(request.getParameter("boton_Modificar"))){
                  cda=new Maestro_ComprasDetalle();
            int x=cda.antigua(Integer.parseInt(request.getParameter("txt_id_mcd")));
                              cd=new Maestro_ComprasDetalle(Integer.parseInt(request.getParameter("txt_id_mcd")),Integer.parseInt(request.getParameter("txt_idcompra")),Integer.parseInt(request.getParameter("ListaProducto")),(Integer.parseInt(request.getParameter("txt_cantidad"))),Double.parseDouble(request.getParameter("txt_pu")));   
              if(cd.Modificar()>0){
                          if(Integer.parseInt(request.getParameter("txt_cantidad"))>x){
                     cd=new Maestro_ComprasDetalle(Integer.parseInt(request.getParameter("txt_id_mcd")),Integer.parseInt(request.getParameter("txt_idcompra")),Integer.parseInt(request.getParameter("ListaProducto")),(Integer.parseInt(request.getParameter("txt_cantidad"))-x),Double.parseDouble(request.getParameter("txt_pu")));    
                      }else if(Integer.parseInt(request.getParameter("txt_cantidad"))<x){
                     cd=new Maestro_ComprasDetalle(Integer.parseInt(request.getParameter("txt_id_mcd")),Integer.parseInt(request.getParameter("txt_idcompra")),Integer.parseInt(request.getParameter("ListaProducto")),(Integer.parseInt(request.getParameter("txt_cantidad"))-x),Double.parseDouble(request.getParameter("txt_pu")));   
                      }else{
                      cd=new Maestro_ComprasDetalle(Integer.parseInt(request.getParameter("txt_id_mcd")),Integer.parseInt(request.getParameter("txt_idcompra")),Integer.parseInt(request.getParameter("ListaProducto")),(Integer.parseInt(request.getParameter("txt_cantidad"))-x),Double.parseDouble(request.getParameter("txt_pu")));      
                      }
                    if((cd.NuevasExistencias()>0)&&(cd.NuevoCosto()>0)&&(cd.NuevoVenta()>0)){
                      cd=new Maestro_ComprasDetalle();
               int icompra=cd.idcompra();
               request.setAttribute("nuevo", icompra);
                  request.getRequestDispatcher("Maestro_ProductosCompras.jsp").forward(request, response);
                    }
                
                   
              }else{
                    out.println("<h1>PTM Error</h1>");
                    cd=new Maestro_ComprasDetalle();
               int icompra=cd.idcompra();
               request.setAttribute("nuevo", icompra);
                  request.getRequestDispatcher("Maestro_ProductosCompras.jsp").forward(request, response);
              }
              }
              else if("eliminar".equals(request.getParameter("boton_Eliminar"))){
                cd=new Maestro_ComprasDetalle(Integer.parseInt(request.getParameter("txt_id_mcd")),Integer.parseInt(request.getParameter("txt_idcompra")),Integer.parseInt(request.getParameter("ListaProducto")),Integer.parseInt(request.getParameter("txt_cantidad")),Double.parseDouble(request.getParameter("txt_pu")));   
              if(cd.Eliminar()>0){
                           Maestro_ComprasDetalle   cd2=new Maestro_ComprasDetalle(Integer.parseInt(request.getParameter("txt_id_mcd")),Integer.parseInt(request.getParameter("txt_idcompra")),Integer.parseInt(request.getParameter("ListaProducto")),(0-Integer.parseInt(request.getParameter("txt_cantidad"))),Double.parseDouble(request.getParameter("txt_pu")));      
                  if(cd2.NuevasExistencias()>0){
                  cd=new Maestro_ComprasDetalle();
               int icompra=cd.idcompra();
               request.setAttribute("nuevo", icompra);
                  request.getRequestDispatcher("Maestro_ProductosCompras.jsp").forward(request, response);
                    }
                
                   
              }else{
                    out.println("<h1>PTM Error</h1>");
              cd=new Maestro_ComprasDetalle();
               int icompra=cd.idcompra();
               request.setAttribute("nuevo", icompra);
                  request.getRequestDispatcher("Maestro_ProductosCompras.jsp").forward(request, response);
              }
              }
              else
             if("agregar".equals(request.getParameter("boton_agregar"))){
              cda=new Maestro_ComprasDetalle();
                              cd=new Maestro_ComprasDetalle(Integer.parseInt(request.getParameter("txt_id_mcd")),Integer.parseInt(request.getParameter("txt_idcompra")),Integer.parseInt(request.getParameter("ListaProducto")),Integer.parseInt(request.getParameter("txt_cantidad")),Double.parseDouble(request.getParameter("txt_pu")));   
           if(cd.agregar()>0){
                   if(cd.NuevasExistencias()>0){
                    if(cd.NuevoCosto()>0){   
                   if(cd.NuevoVenta()>0){  
                 
                       cd=new Maestro_ComprasDetalle();
               int icompra=cd.idcompra();
               request.setAttribute("nuevo", icompra);
                  request.getRequestDispatcher("Maestro_ProductosCompras.jsp").forward(request, response);
                   }
                    }
                   }
                  }else{
                   out.println("<h1>PTM Error</h1>");
             out.println("<a href='Maestro_ProductosCompras.jsp'>Regresar...</a>");
              }
              
             } 
             else if("terminar".equals(request.getParameter("boton_finalizar"))){
                 response.sendRedirect("Maestro_ComprasDetalle.jsp");
             }else if ("modificarv".equals(request.getParameter("boton_Modificarv"))){
                  c=new Compras(Integer.parseInt(request.getParameter("txt_idcompra")),Integer.parseInt(request.getParameter("txt_orden")),Integer.parseInt(request.getParameter("ListaProveedores")),request.getParameter("txt_fo"),request.getParameter("txt_fi"));
              if(c.Modificar()>0){
                 
                   response.sendRedirect("Maestro_ComprasDetalle.jsp");
              }else{
                   out.println("<h1>PTM Error</h1>");
             out.println("<a href='Maestro_ComprasDetalle.jsp'>Regresar...</a>");
              }
                 
             }else{
                  out.println("<h1>PTM Error</h1>");
             out.println("<a href='Maestro_ComprasDetalle.jsp'>Regresar...</a>");
              }
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(sr_Maestro_ComprasDetalle.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(sr_Maestro_ComprasDetalle.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
