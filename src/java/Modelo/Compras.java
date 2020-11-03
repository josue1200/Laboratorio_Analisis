/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 *
 * @author Miguel Rivera
 */
public class Compras {
        private int idCompras,Orden,idProveedor;
    private String FechaOden,FechaIngreso;
    private Conexion Con;

    public Compras() {
    }

    public Compras(int idCompras, int Orden, int idProveedor, String FechaOden, String FechaIngreso) {
        this.idCompras = idCompras;
        this.Orden = Orden;
        this.idProveedor = idProveedor;
        this.FechaOden = FechaOden;
        this.FechaIngreso = FechaIngreso;
    }

    public int getIdCompras() {
        return idCompras;
    }

    public void setIdCompras(int idCompras) {
        this.idCompras = idCompras;
    }

    public int getOrden() {
        return Orden;
    }

    public void setOrden(int Orden) {
        this.Orden = Orden;
    }

    public int getIdProveedor() {
        return idProveedor;
    }

    public void setIdProveedor(int idProveedor) {
        this.idProveedor = idProveedor;
    }

    public String getFechaOden() {
        return FechaOden;
    }

    public void setFechaOden(String FechaOden) {
        this.FechaOden = FechaOden;
    }

    public String getFechaIngreso() {
        return FechaIngreso;
    }

    public void setFechaIngreso(String FechaIngreso) {
        this.FechaIngreso = FechaIngreso;
    }
    
    
 public int agregar(){
        int retorno =0;
        try{
            PreparedStatement parametro;
            Con = new Conexion();
            String query = "insert into compras(no_orden_compra,idproveedor,fecha_orden,fechaingreso) values(?,?,?,now());";
            Con.abrir_conexion();
            parametro = (PreparedStatement)Con.conexionbd.prepareStatement(query);
            parametro.setInt(1,getOrden());
            parametro.setInt(2,getIdProveedor());
            parametro.setString(3,getFechaOden());
            retorno = parametro.executeUpdate();
            Con.cerrar_conexion();
        }catch(SQLException ex){
            System.out.println(ex.getMessage());
        }
    return retorno;
    }
      
     public int Modificar(){
        int retorno =0;
        try{
            PreparedStatement parametro;
            Con = new Conexion();
            String query = "UPDATE compras set no_orden_compra=?,idproveedor=?,fecha_orden=?,fechaingreso=? where idcompra=?";
            Con.abrir_conexion();
            parametro = (PreparedStatement)Con.conexionbd.prepareStatement(query);
            parametro.setInt(1,getOrden());
            parametro.setInt(2,getIdProveedor());
            parametro.setString(3,getFechaOden());
            parametro.setString(4,getFechaIngreso());
            parametro.setInt(5,getIdCompras());
            retorno = parametro.executeUpdate();
            Con.cerrar_conexion();
        }catch(SQLException ex){
            System.out.println(ex.getMessage());
        }
    return retorno;
    }
      
       public int Eliminar(){
        int retorno =0;
        try{
            PreparedStatement parametro;
            Con = new Conexion();
            String query = "delete from compras where idcompra=?";
            Con.abrir_conexion();
            parametro = (PreparedStatement)Con.conexionbd.prepareStatement(query);
            parametro.setInt(1,getIdCompras());
            retorno = parametro.executeUpdate();
            Con.cerrar_conexion();
        }catch(SQLException ex){
            System.out.println(ex.getMessage());
        }
    return retorno;
    }
    
}
