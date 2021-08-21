<%-- 
    Document   : index
    Created on : 9/10/2020, 01:42:46 PM
    Author     : Miguel Rivera
--%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@page import="Modelo.usuario"%>
<%
      HttpSession actual =request.getSession(true);
      String usuario = (String) actual.getAttribute("Dentro");
      List<List<String>>meniu=(List<List<String>>) actual.getAttribute("menu");
   List<List<String>>Lista=(List<List<String>>) actual.getAttribute("imagenes");
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
       margin: 0;
       padding: 0;
       font-family: 'Roboto', sans-serif;
       background-color: #A2CEE6;
     }
     .navbar{
      margin-top: -40px;
      background-color: #fff;
      display:block;
      width: 100%;
      overflow: hidden;
      padding: 10px 10px;
      position: fixed;
      z-index: 2;
     }
     ul{
      list-style-type: none;
      margin: 0;
      padding: 0;
     }
     li{
      display: inline;
     }
     .titulo{
      color: #0057A0;
      font-family :Bowlby One SC; 
      display: inline;
      margin-left: 20px;
      position: fixed;
      margin-top: 15px;

     }
     .logo{
      margin-left: 50px;
     }

     .fondo{
       background: url("2.jpg") no-repeat fixed center;
      -webkit-background-size: cover;
       -moz-background-size: cover;
       -o-background-size: cover;
       background-size: cover;
       height:600px;
       width: 100%;
       z-index: 1;
      }

    
       .card {
        background: #fff;
        border-radius: 2px;
        display: inline-block;
        margin: 1rem;
        position: relative;
        height: 300px;
        width: 220px;
        box-shadow: 0 1px 3px rgba(0,0,0,0.12), 0 1px 2px rgba(0,0,0,0.24);
        padding: 40px;
        text-align: center;
        align-items: center;
        transition: .1s;  
      }
      .card1{
        margin-left: 40px;
      }
      
      .card:hover{
        background-color: #ff7400;
        box-shadow: 0 0px 15px #ff7400;
        cursor: pointer;
        filter: invert(1);

      }
      
      .separador{
        width: 100%;
        height: 100px;
        background-color: transparent;
        
      }

      .txt{
        padding: 15% 40%;
        color: white; 
        font-size: 60px;
        text-shadow: 0 0 10px #000;
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
      .cardimg{
        display: block;
        margin: auto;
        width: 140px;
        margin-bottom: 40px;
      }
      .parrafo{
        color: #000;
        opacity: .5;
      }

      a{
        color: #000;
      }
      footer{
        background-color: #1e1e1e;
        padding: 10px 20px;
      }

      @media screen and (min-width: 1640px){
        .card{
          padding: 50px;
        }
        .card1 {
          margin-left: 120px;
        }

        .txt{
          font-size: 70px;
          padding: 15% 43%;
        }
      }
      @media screen and (max-width: 1350px){
        .card{
          margin: 5px;
        }
        .card1{
          margin-left: 25px;
        }
      }
       @media screen and (max-width: 1250px){
        .card{
          margin: 5px;
          width: 140px;
        }
        .card1{
          margin-left: 20px;
        }
      }
      @media screen and (max-width: 1180px){
        .card{
          margin: 5px;
          width: 140px;
        }
        .card1{
          margin-left: 100px;
        }
        .card3{
          margin-left: 100px;
        }
      }

       @media screen and (max-width: 1080px){
     
        .card1{
          margin-left: 40px;
        }
        .card3{
          margin-left: 40px;
        }
      }
      @media screen and (max-width: 1000px){
        .card1{
          margin-left: 100px;
        }
        .card2{
           margin-left: 100px;
        }
        .card3{
          margin-left: 0;
        }
        .fondo{
          height:400px;
          width: 100%;  
        }
        .txt{
          font-size: 50px;
          padding: 13% 45%;
        }
        .titulo{
          font-size: 30px;
        }
      }
   </style>
 <body>
  <div class="navbar">
        <ul>
            <br>
          <img class="logo" src="1.png" width="60">
          <br>
          <li>


            <h1 style='font-family :Bookman Old Style;' class="titulo">GRUPO 8 UMG </h1>

      


            

          </li>
                    <form action="sr_inicio" method="post">
                        <h6 class="text-muted"><input type="submit" value="Cerrar Sesion" class="ini" id="cerrarsesion" name="cerrarsesion"/></h6>
                    </form>
          <li><a href="#" class="ini">INICIO</a></li>
        </ul>
      </div>
       
      <div class="fondo">
        <h1 class="txt" style='font-family :Bookman Old Style; '>Tienda OnLine</h1>
      </div>
      <div class="separador"></div>
      


      

      <h1 style='font-family :Bookman Old Style; text-align: center;' >Bienvenido de nuevo: <h1 style='font-family :Bookman Old Style; color: #0057A0; text-align: center; '><%=usuario%></h1></h1>


   

     
       <%
    
for( int i=0;i<meniu.get(0).size();i++){
      out.println("<a href='"+meniu.get(0).get(i)+"'> <div class='card'><img src='"+Lista.get(1).get(i)+"' style='max-width:40px;  ' class='cardimg'><h4>"+ meniu.get(1).get(i)+"</h4></div></a>");
  }
       
   



 %>
     
       <footer>
        <img src="umg.png" width="250">
       </footer>
    </body>
    
</html>
<%
   }
else{

response.sendRedirect("index.jsp");

}
%>