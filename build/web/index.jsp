<%-- 
    Document   : index
Created on : 16/10/2020, 05:28:56 PM
    Author     : Miguel Rivera
--%>

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
       background:url(imagenes/111.jpg);
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
      color: #ffffff;
      font-family: Lucida Handwriting;
     display: inline;
      margin-left: 25px;
      position: fixed;
      margin-top: 15px;

     }
     
      
   </style>
    <body style=' background-color: #8BC2E1'>
       <h1 class="titulo"> <i><strong>Login</strong> </i></h1>
      <form action="sr_inicio" method="post" class="container">

            <div class="form-group">
                
               
                <h1 style="text-align: center; color: #ffffff; font-family: Bell MT;text-shadow: 1px 1px 1px #ffffff "><i>Iniciar Sesion</i></h1><br>
                
                
               
                
            </div><br>
            <div class="form-input ">
                <label style="color: #ffffff; font-family: Lucida Sans Typewriter; text-shadow: 2px 3px 3px write"><i>Usuario</i></label>

                <input type="text" name="usuario" class="form-control" required=""><br>
                
            </div>
            <div class="form-group">

                <label style="color: #ffffff; font-family: Lucida Sans Typewriter;text-shadow: 2px 3px 3px write">Password</label>

                <input type="password" name="pass" class="form-control" required="">

            </div>
            <br>
            
                <button id="btn_ingresar" name="btn_ingresar" value="ingresar" class="btn btn-primary"><i>Ingresar</i></button>
           
           
           

        </form>
        
    </body>
</html>
