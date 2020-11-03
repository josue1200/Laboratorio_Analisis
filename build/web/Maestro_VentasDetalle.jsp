<%-- 
    Document   : Maestro_VentasDetalle
    Created on : 22/10/2020, 10:18:41 AM
    Author     : Miguel Rivera
--%>
<%@page import="Modelo.Empleado"%>
<%@page import="Modelo.Cliente"%>
<%@page import="java.util.HashMap"%>
<%@page import="Modelo.Productos"%>
<%@page import="Modelo.Maestro_VentasDetalle"%>
<%@page import="javax.swing.table.DefaultTableModel"%>
<%@page import="java.util.List"%>
<%
      HttpSession actual =request.getSession(true);
      String usuario = (String) actual.getAttribute("Dentro");
            String jerarquia = (String) actual.getAttribute("j");
             List<List<String>>meniu=(List<List<String>>) actual.getAttribute("menu");
        if(actual.getAttribute("Dentro")!=null){
        %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>

        <title>JSP Page</title>
    </head>
    <style>
         body{
            font-family: 'Roboto', sans-serif;
            background-color: #EEEEEE;
        }
        .titulo{
            text-align: center;
            color: #0057A0;
            font-weight: bold;
        }    
         .ini{
        color: #0057A0;
        position: relative;
        float: right;
        margin-top: 20px;
        margin-right: 40px;
        font-size: 17px;
        text-decoration: none;
      }
        .contenedor{
            background: #fff;
            border-radius: 2px;
            box-shadow: 0 1px 6px rgba(0,0,0,0.12), 0 1px 6px rgba(0,0,0,0.24);
            width: 70%; 
            padding: 3%;
            display: block;
            margin: auto;
        }     
        .regresar{
            position: fixed;
            margin: 10px;
        } 

        table { 
          font-family: 'Arial';
          margin: 25px auto;
          border-collapse: collapse;
          border: 1px solid #eee;
          border-bottom: 2px solid #00cccc;
          box-shadow: 0px 0px 20px rgba(0, 0, 0, 0.1), 0px 10px 20px rgba(0, 0, 0, 0.05), 0px 20px 20px rgba(0, 0, 0, 0.05), 0px 30px 20px rgba(0, 0, 0, 0.05);
        }
        table tr:hover {
          background: #f4f4f4;
        }
        table tr:hover td {
          color: #555;
        }
        table th, table td {
          color: #999;
          border: 1px solid #eee;
          padding: 12px 35px;
          border-collapse: collapse;
        }
        table th {
          background: #208FF3;
          color: #fff;
          text-transform: uppercase;
          font-size: 10px;
        }
        table th.last {
          border-right: none;
        }
        .contTable{
          font-size: 10px;
        }
        footer{
        background-color: #1e1e1e;
        padding: 10px 20px;
      }

    </style>
    <body>
          <form action="sr_inicio" method="post">
            <h6 class="ini"><input type="submit" value="Cerrar Sesion" class="btn btn-dark" id="cerrarsesion" name="cerrarsesion"/></h6>
        </form>
   
        <h1 class="titulo">Maestro Ventas Detalle</h1>
        <div class="container">
        <form action="sr_Maesto_VentasDetalle" method="POST" class="form-group">
             <a href="Primera.jsp" class="btn btn-info" role="button">Regresar</a><br><br>
    <label for="text">ID Ventas</label>
    <input type="text" class="form-control" placeholder="ID" id="txt_id_ventas" name="txt_id_ventas" value="0" readonly>
   
    <label for="text">Numero de Factura:</label>
    <input type="number" name="txt_numfac" id="txt_numfac" class="form-control" required>
    <label for="text">Serie:</label>
    <input type="text" name="txt_serie" id="txt_serie" class="form-control" required>
    <label id="text">Fecha De Factura:</label>
    <input type="date" name="txt_fechafactura" id="txt_fechafactura"  class="form-control" required>
     <label for="text">Empleados</label>
    <select name="Listaempleados" id="Listaempleados" class="form-control" required="">
     <% 
                        Empleado empleados = new Empleado();
                        HashMap<String,String> listadodeempleadoas = empleados.ListadoEmpleados();
                        out.println("<option value='0'>Elija</option>");
                         for (String i:listadodeempleadoas.keySet()){
                             out.println("<option value='" + i + "'>" + listadodeempleadoas.get(i) + "</option>");
                         }
                         
                    
                    %>
    </select>
    <label for="text">Cliente:</label>
    <select name="Listaclientes" id="Listaclientes" class="form-control" required="">
     <% 
                        Cliente cliente = new Cliente();
                        HashMap<String,String> listadoclientes = cliente.ListadoClientes();
                        out.println("<option value='0'>Elija</option>");
                         for (String i:listadoclientes.keySet()){
                             out.println("<option value='" + i + "'>" + listadoclientes.get(i) + "</option>");
                         }
                         
                    
                    %>
    </select>
    
    <label for="text">Fecha de Ingreso</label>
    <input type="text" class="form-control" placeholder="Escriba la fecha de ingreso" id="txt_fi" value="0" name="txt_fi" >
<button name="boton_Siguiente" id="boton_Siguiente" value="Siguiente" class="btn btn-success">Siguente</button>
  <button name="boton_Modificarv" id="boton_Modificarv" value="modificarv" class="btn btn-primary">Modificar</button>
  
  
</form>
        </div>
        <div class="container">
 <table class="table table-hover">
    <thead>
      <tr>
        <th>Numero de Factura</th>
        <th>Serie</th>
        <th>Fecha de Factura</th>
        <th>Nombre Del Cliente</th>
        <th>Nombre de empleado</th>
        <th>Fecha de ingreso de venta</th>
        
      </tr>
    </thead>
    <tbody id="tbl_md">
        <%
            Maestro_VentasDetalle ventadetalle=new Maestro_VentasDetalle();
            DefaultTableModel tabladetalle=new DefaultTableModel();
            tabladetalle=ventadetalle.TablaDeVentasDetalle();
            for (int i = 0; i < tabladetalle.getRowCount(); i++) {
                         out.println("<tr data-idv="+tabladetalle.getValueAt(i, 0)+" data-idc="+tabladetalle.getValueAt(i, 4)+" data-ide="+tabladetalle.getValueAt(i, 6)+">"); 
                         out.println("<td>"+tabladetalle.getValueAt(i,1)+"</td>");
                         out.println("<td>"+tabladetalle.getValueAt(i,2)+"</td>");
                         out.println("<td>"+tabladetalle.getValueAt(i,3)+"</td>");
                         out.println("<td>"+tabladetalle.getValueAt(i,5)+"</td>");
                         out.println("<td>"+tabladetalle.getValueAt(i,7)+"</td>");
                         out.println("<td>"+tabladetalle.getValueAt(i,8)+"</td>");
                      out.println("</tr>");
                }

        

              %>
    </tbody>
  </table>
        </div>
  <script type="text/javascript">
        $('#tbl_md').on('click','tr td',function(e){
            var target,idv,ic,ie,numerofact,serie,fechafactura,fechaingreso;
            target=$(event.target);
            idv=target.parent().data('idv');
            ic=target.parent().data('idc');
            ie=target.parent().data('ide');
            numerofact=target.parent("tr").find("td").eq(0).html();
            serie=target.parent("tr").find("td").eq(1).html();
            fechafactura=target.parent("tr").find("td").eq(2).html();
            fechaingreso=target.parent("tr").find("td").eq(5).html();
           $("#txt_id_ventas").val(idv);
            $("#Listaclientes").val(ic);
            $("#Listaempleados").val(ie);
            
            $("#txt_numfac").val(numerofact);
            $("#txt_serie").val(serie);
            $("#txt_fechafactura").val(fechafactura);
            $("#txt_fi").val(fechaingreso);
   $('#txt_fi').attr("readonly", false);
        });
        </script>
        <script type="text/javascript">
             $(document).ready(function () {
                 $('#txt_fi').attr("readonly", true);
            });
        </script>
    </body>
</html>
<%
   }
else{

response.sendRedirect("Primera.jsp");

}
%>