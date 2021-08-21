<%-- 
    Document   : Puestos
    Created on : 10/10/2020, 11:57:23 AM
    Author     : Miguel Rivera
--%>
<%--
<%@page import="java.util.List"%>
<%
      HttpSession actual =request.getSession(true);
      String usuario = (String) actual.getAttribute("Dentro");
      String jerarquia = (String) actual.getAttribute("j");
             List<List<String>>meniu=(List<List<String>>) actual.getAttribute("menu");
      if((actual.getAttribute("Dentro")!=null)&&(jerarquia.equals("administrador"))){
        %>
<%@page import="Modelo.Puesto"%>
<%@page import="javax.swing.table.DefaultTableModel"%>
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
          border-collapse: collapse;
          border: 1px solid #eee;
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
          font-size: 12px;
        }
        table th.last {
          border-right: none;
        }

        .contTable{
          margin-left: 50px;
          width: 200px;
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
     
        <h1 class='titulo'>CRUD De Puestos</h1>
        <div class="container">
            <a href="Empleados.jsp" class="btn btn-info">Regresar</a><br>
            <br>
        <form action="sr_puestos" method="POST" class="form-group">
     
  <br>
    <label for="text">ID:</label>
    <input type="text" class="form-control" placeholder="ID" id="txt_id" name="txt_id" value="0" readonly>

    <label for="text">Puesto:</label>
    <input type="text" class="form-control" placeholder="Escriba el Puesto" id="txt_Puesto" name="txt_Puesto" required>
    <br>
   <button name="boton_agregar" id="boton_agregar" value="agregar" class="btn btn-success">Agregar</button>
  <button name="boton_Modificar" id="boton_Modificar" value="modificar" class="btn btn-primary">Modificar</button>
  <button name="boton_Eliminar" id="boton_Eliminar" value="eliminar" class="btn btn-danger" onclick="javascript:if(!confirm('¿Desea Eliminar?'))return false">Eliminar</button>
</form>
        </div>
        <div>
 <table class="table table-hover">
    <thead>
      <tr>
        <th>Puesto</th>
      </tr>
    </thead>
    <tbody id="tblPuesto">
        <%
            Puesto puesto=new Puesto();
            DefaultTableModel tablaPuesto=new DefaultTableModel();
            tablaPuesto=puesto.TablaPuesto();
            for (int i = 0; i < tablaPuesto.getRowCount(); i++) {
                         out.println("<tr data-idp="+tablaPuesto.getValueAt(i, 0)+">"); 
                         out.println("<td>"+tablaPuesto.getValueAt(i,1)+"</td>");
                      out.println("</tr>");
                }

        

              %>
    </tbody>
  </table>
        </div>
    <script type="text/javascript">
        $('#tblPuesto').on('click','tr td',function(e){
            var target,id,Puesto;
            target=$(event.target);
            id=target.parent().data('idp');
            marca=target.parent("tr").find("td").eq(0).html();
            $("#txt_id").val(id);
            $("#txt_Puesto").val(marca);
        })
        </script>
    </body>
</html>
<%
   }
else{

response.sendRedirect("Primera.jsp");

}
%>
--%>