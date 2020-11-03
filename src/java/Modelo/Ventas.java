/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Miguel Rivera
 */
public class Ventas {
    private int id_venta, no_factura,id_cliente,id_empleado;
    private String serie, fecha_de_factura, fecha_de_ingreso;
    private Conexion Con;
    public Ventas() {
    }

    public Ventas(int id_venta, int no_factura, int id_cliente, int id_empleado, String serie, String fecha_de_factura, String fecha_de_ingreso) {
        this.id_venta = id_venta;
        this.no_factura = no_factura;
        this.id_cliente = id_cliente;
        this.id_empleado = id_empleado;
        this.serie = serie;
        this.fecha_de_factura = fecha_de_factura;
        this.fecha_de_ingreso = fecha_de_ingreso;
    }

    public int getId_venta() {
        return id_venta;
    }

    public void setId_venta(int id_venta) {
        this.id_venta = id_venta;
    }

    public int getNo_factura() {
        return no_factura;
    }

    public void setNo_factura(int no_factura) {
        this.no_factura = no_factura;
    }

    public int getId_cliente() {
        return id_cliente;
    }

    public void setId_cliente(int id_cliente) {
        this.id_cliente = id_cliente;
    }

    public int getId_empleado() {
        return id_empleado;
    }

    public void setId_empleado(int id_empleado) {
        this.id_empleado = id_empleado;
    }

    public String getSerie() {
        return serie;
    }

    public void setSerie(String serie) {
        this.serie = serie;
    }

    public String getFecha_de_factura() {
        return fecha_de_factura;
    }

    public void setFecha_de_factura(String fecha_de_factura) {
        this.fecha_de_factura = fecha_de_factura;
    }

    public String getFecha_de_ingreso() {
        return fecha_de_ingreso;
    }

    public void setFecha_de_ingreso(String fecha_de_ingreso) {
        this.fecha_de_ingreso = fecha_de_ingreso;
    }
     public int AgregarVenta(){
        int resultado=0;
        try {
            Con=new Conexion();
            PreparedStatement parameter;
            String query="insert into ventas (nofactura,serie,fechafactura,idcliente,idempleado,fechaingreso)values(?,?,?,?,?,now());";
            Con.abrir_conexion();
            parameter=Con.conexionbd.prepareStatement(query);
            parameter.setInt(1,this.getNo_factura());
            parameter.setString(2,this.getSerie());
            parameter.setString(3,this.getFecha_de_factura());
            parameter.setInt(4,this.getId_cliente());
            parameter.setInt(5,this.getId_empleado());
            resultado=parameter.executeUpdate();
            Con.cerrar_conexion();
        } catch (SQLException e) {
            System.out.println("Error Prro >:V"+e.getMessage());
        }
        return resultado;
    }
     public int ModificarVenta(){
        int resultado=0;
        try {
            Con=new Conexion();
            PreparedStatement parameter;
            String query="update ventas set nofactura=?,serie=?,fechafactura=?,idcliente=?,idempleado=?,fechaingreso=? where idventas=?;";
            Con.abrir_conexion();
            parameter=Con.conexionbd.prepareStatement(query);
           parameter.setInt(1,this.getNo_factura());
            parameter.setString(2,this.getSerie());
            parameter.setString(3,this.getFecha_de_factura());
            parameter.setInt(4,this.getId_cliente());
            parameter.setInt(5,this.getId_empleado());
            parameter.setString(6,this.getFecha_de_ingreso());
            parameter.setInt(7,this.getId_venta());
            resultado=parameter.executeUpdate();
            Con.cerrar_conexion();
        } catch (SQLException e) {
            System.out.println("Error Prro >:V"+e.getMessage());
        }
        return resultado;
    }
          public int EliminaVentas(){
        int resultado=0;
        try {
            Con=new Conexion();
            PreparedStatement parameter;
            String query="delete from ventas where idventas=?;";
            Con.abrir_conexion();
            parameter=Con.conexionbd.prepareStatement(query);
            parameter.setInt(1,this.getId_venta());
            resultado=parameter.executeUpdate();
            Con.cerrar_conexion();
        } catch (SQLException e) {
            System.out.println("Error Prro >:V"+e.getMessage());
        }
        return resultado;
    }
        
          
          public int Existencias(int idProductos){
          
          int e=1;
          int a=0;
     
        try {
            Con=new Conexion();
       
            String query="select existencias from productos where idProductos="+idProductos+";";
            Con.abrir_conexion();
           
            
           
             ResultSet consulta=Con.conexionbd.createStatement().executeQuery(query);
             while (consulta.next()) {
                e=consulta.getInt("existencias");
               
                }
                   
                    
            Con.cerrar_conexion();
            return e;
        } catch (SQLException ex) {
            System.out.println("Error"+ex.getMessage());
              return a;
        }
 }
        
    
          public int IDVENTA(int fac){
          
          int e=0;
     
        try {
            Con=new Conexion();
       
            String query="select idventas from ventas where nofactura="+fac+";";
            Con.abrir_conexion();
           
            
           
             ResultSet consulta=Con.conexionbd.createStatement().executeQuery(query);
             while (consulta.next()) {
                e=consulta.getInt("idventas");
               
                }
                   
                    
            Con.cerrar_conexion();
            return e;
        } catch (SQLException ex) {
            System.out.println("Error"+ex.getMessage());
              return e;
        }
 }
          
}
