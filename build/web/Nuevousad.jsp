%-- 
    Document   : Nuevousad
    Created on : 18/10/2020, 06:22:14 PM
    Author     : Miguel Rivera
--%>
<%@page import="Modelo.usuario"%>
<%@page import="java.util.List"%>
<%
      HttpSession actual =request.getSession(true);
      String usuario = (String) actual.getAttribute("Dentro");
      String jerarquia = (String) actual.getAttribute("j");
             List<List<String>>meniu=(List<List<String>>) actual.getAttribute("menu");
      if((actual.getAttribute("Dentro")!=null)&&(jerarquia.equals("administrador"))){
        %>
<%@page import="Modelo.Empleado"%>
<%@page import="java.util.HashMap"%>
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
          padding:1px;
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
 
        <h1 class='titulo';">CRUD De Usuarios</h1>
        <div class="container">
        <form action="sr_nuevo" method="POST" class="form-group">
    <a href="Primera.jsp" class="btn btn-info" role="button">Regresar</a><br><br>
      
  <br>
  <label for="text">ID</label>
    <input type="text" class="form-control" placeholder="ID" id="txt_ID" name="txt_ID" value="0" readonly>
  
    <label for="text">Usuario</label>
    <input type="text" class="form-control" placeholder="user" id="txt_usuario" name="txt_usuario"  required>

    <label for="text">Nombres:</label>
    <input type="text" class="form-control" placeholder="Escriba los nombres" id="txt_nombres" name="txt_nombres" required>

    <label for="text">Apellidos:</label>
    <input type="text" class="form-control" placeholder="Escriba los apellidos" id="txt_apellidos" name="txt_apellidos" required>
    
 
    <label for="text">Correo</label>
    <input type="email" class="form-control" placeholder="Escriba el Correo" id="txt_correo" name="txt_correo" required>
    
    <label for="text">Contraseña</label>
    <input type="text" class="form-control" placeholder="Escriba la contraseña" id="txt_contra" name="txt_contra" required>
    <br>
    <label for="text">Tipo</label>
    <select name="Listatipe" id="Listatipe">
        <option value="0"></option>
        <option value="administrador">Admin</option>
        <option value="usuario">User</option>
    </select>
    <br>
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
          <th>Usuario</th>
        <th>Nombre</th>
        <th>Apellidos</th>
        <th>Correo</th>
        
        <th>Contraseña</th>
        <th>Tipo</th>
        
      </tr>
    </thead>
    <tbody id="tbl_usuarios">
        <%
            usuario use=new usuario();
            DefaultTableModel tablausers=new DefaultTableModel();
            tablausers=use.TablaDeusers();
            for (int i = 0; i < tablausers.getRowCount(); i++) {
                         out.println("<tr data-ide="+tablausers.getValueAt(i, 0)+">"); 
                         out.println("<td>"+tablausers.getValueAt(i,1)+"</td>");
                         out.println("<td>"+tablausers.getValueAt(i,2)+"</td>");
                         out.println("<td>"+tablausers.getValueAt(i,3)+"</td>");
                         out.println("<td>"+tablausers.getValueAt(i,4)+"</td>");
                         out.println("<td>"+tablausers.getValueAt(i,5)+"</td>");
                         out.println("<td>"+tablausers.getValueAt(i,6)+"</td>");
                        
                      out.println("</tr>");
                }

        

              %>
    </tbody>
  </table>
        </div>
    <script type="text/javascript">
        $('#tbl_usuarios').on('click','tr td',function(e){
            var target,ide,nombres,Apellidos,tipo,correo,user,contra;
            target=$(event.target);
            ide=target.parent().data('ide');
           
            user=target.parent("tr").find("td").eq(0).html();
            nombres=target.parent("tr").find("td").eq(1).html();
            Apellidos=target.parent("tr").find("td").eq(2).html();
            correo=target.parent("tr").find("td").eq(3).html();
            contra=target.parent("tr").find("td").eq(4).html();
            tipo=target.parent("tr").find("td").eq(5).html();
            
            $("#txt_ID").val(ide);
            $("#txt_usuario").val(user);
            $("#txt_nombres").val(nombres);
            $("#txt_apellidos").val(Apellidos);
            $("#txt_correo").val(correo);
            $("#txt_contra").val(contra);
            $("#Listatipe").val(tipo);
 
        });
        </script>
  
    </body>
</html>
<%
   }
else{

response.sendRedirect("index.jsp");

}
%>