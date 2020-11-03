/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.swing.table.DefaultTableModel;

/**
 *
 * @author Miguel Rivera
 */
public class Maestro_ComprasDetalle {
       private int id,idCompra,idProducto,cantidad;
    private double PrecioUnitario;
    private Conexion Con; 

    public Maestro_ComprasDetalle() {
    }

    public Maestro_ComprasDetalle(int id, int idCompra, int idProducto, int cantidad, double PrecioUnitario) {
        this.id = id;
        this.idCompra = idCompra;
        this.idProducto = idProducto;
        this.cantidad = cantidad;
        this.PrecioUnitario = PrecioUnitario;
    }

   

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getIdCompra() {
        return idCompra;
    }

    public void setIdCompra(int idCompra) {
        this.idCompra = idCompra;
    }

    public int getIdProducto() {
        return idProducto;
    }

    public void setIdProducto(int idProducto) {
        this.idProducto = idProducto;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public double getPrecioUnitario() {
        return PrecioUnitario;
    }

    public void setPrecioUnitario(double PrecioUnitario) {
        this.PrecioUnitario = PrecioUnitario;
    }
    public DefaultTableModel ListadoCompras(){
 DefaultTableModel tabla = new DefaultTableModel();
 try{
     Con = new Conexion();
     Con.abrir_conexion();
      String query = "select c.idcompra as ID,c.no_orden_compra,pr.idProveedores,pr.Proveedor,c.fecha_orden,c.fechaingreso from compras as c inner join proveedores as pr on c.idproveedor=pr.idProveedores order by id;";
      ResultSet consulta = Con.conexionbd.createStatement().executeQuery(query);
      String encabezado[] = {"ID","idCompras","no Orden","idProveedor","Proveedor","Fecha De Orden","Fecha de Ingreso"};
      tabla.setColumnIdentifiers(encabezado);
      String datos[] = new String[6];
      while (consulta.next()){
          datos[0] = consulta.getString("ID");
          datos[1] = consulta.getString("no_orden_compra");
          datos[2] = consulta.getString("idProveedores");
          datos[3] = consulta.getString("Proveedor");
          datos[4] = consulta.getString("fecha_orden");
          datos[5] = consulta.getString("fechaingreso");
          tabla.addRow(datos);
      
      }
      
     Con.cerrar_conexion();
 }catch(SQLException ex){
     System.out.println(ex.getMessage());
 }
  return tabla;
      
    }

     
    public int agregar(){
        int retorno =0;
        try{
            PreparedStatement parametro;
            Con = new Conexion();
            String query = "insert into compras_detalle(idcompra,idproducto,cantidad,precio_costo_unitario) values(?,?,?,?)";
            Con.abrir_conexion();
            parametro = (PreparedStatement)Con.conexionbd.prepareStatement(query);
            parametro.setInt(1,getIdCompra());
            parametro.setInt(2,getIdProducto());
            parametro.setInt(3,getCantidad());
            parametro.setDouble(4,getPrecioUnitario());
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
            String query = "UPDATE compras_detalle set idcompra=?,idproducto=?,cantidad=?,precio_costo_unitario=? where idcompra_detalle=?";
            Con.abrir_conexion();
            parametro = (PreparedStatement)Con.conexionbd.prepareStatement(query);
            parametro.setInt(1,getIdCompra());
            parametro.setInt(2,getIdProducto());
            parametro.setInt(3,getCantidad());
            parametro.setDouble(4,getPrecioUnitario());
            parametro.setInt(5,getId());
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
            String query = "delete from compras_detalle where idcompra_detalle=?";
            Con.abrir_conexion();
            parametro = (PreparedStatement)Con.conexionbd.prepareStatement(query);
            parametro.setInt(1,getId());
            retorno = parametro.executeUpdate();
            Con.cerrar_conexion();
        }catch(SQLException ex){
            System.out.println(ex.getMessage());
        }
    return retorno;
    }
    
       public int antigua(int id){
          int retorno=0;
          int cant=0;
     
        try {
            Con=new Conexion();
       
            String query="select cantidad from compras_detalle where idcompra_detalle="+id+";";
            Con.abrir_conexion();
           
            
           
             ResultSet consulta=Con.conexionbd.createStatement().executeQuery(query);
             while (consulta.next()) {
                cant=consulta.getInt("cantidad");
               
                }
                   
                    
            Con.cerrar_conexion();
            return cant;
        } catch (SQLException e) {
            System.out.println("Error"+e.getMessage());
              return retorno;
        }
    }
    public int NuevasExistencias(){
          
          int e=0;
     
        try {
            Con=new Conexion();
       
            String query="update productos set existencias=?+? where idProductos=?;";
            Con.abrir_conexion();
           PreparedStatement parameter;
        Ventas ex=new Ventas();
        
            Con.abrir_conexion();
            parameter=Con.conexionbd.prepareStatement(query);
            parameter.setInt(1,ex.Existencias(getIdProducto()));
            parameter.setInt(2,getCantidad());
            parameter.setInt(3,getIdProducto());
            e=parameter.executeUpdate();
                   
                    
            Con.cerrar_conexion();
            return e;
        } catch (SQLException ex) {
            System.out.println("Error"+ex.getMessage());
              return e;
        }
             }
    public int NuevoCosto(){
         int retorno=0;
        try {
            Con=new Conexion();
            
            PreparedStatement parametro;
            String query="UPDATE  productos SET Precio_Costo=? WHERE idProductos=?;";
            Con.abrir_conexion();
            parametro=Con.conexionbd.prepareStatement(query);
            parametro.setDouble(1, getPrecioUnitario());
            parametro.setInt(2,getIdProducto());
           
                    retorno=parametro.executeUpdate();
            Con.cerrar_conexion();
            return retorno;
        } catch (SQLException e) {
            System.out.println("Error"+e.getMessage());
              return retorno;
        } 
    }
     public int NuevoVenta(){
         int retorno=0;
        try {
            Con=new Conexion();
            double porcentaje=0.25;
            PreparedStatement parametro;
            String query="UPDATE  productos SET Precio_Venta=?+(?*"+porcentaje+") WHERE idProductos=?;";
            Con.abrir_conexion();
            parametro=Con.conexionbd.prepareStatement(query);
            parametro.setDouble(1, getPrecioUnitario());
            parametro.setDouble(2, getPrecioUnitario());
            parametro.setInt(3,getIdProducto());
           
                    retorno=parametro.executeUpdate();
            Con.cerrar_conexion();
            return retorno;
        } catch (SQLException e) {
            System.out.println("Error"+e.getMessage());
              return retorno;
        } 
    }
     
          public int idcompra() throws SQLException{
          int retorno=0;
          int exi=0;
     
        try {
            Con=new Conexion();
       
            String query="SELECT max(idcompra) FROM compras;";
            Con.abrir_conexion();
           
            
           
             ResultSet consulta=Con.conexionbd.createStatement().executeQuery(query);
             while (consulta.next()) {
                exi=consulta.getInt("max(idcompra)");
               
                }
                   
                    
            Con.cerrar_conexion();
            return exi;
        } catch (SQLException e) {
            System.out.println("Error"+e.getMessage());
              return retorno;
        }
 }

    
     
     
         public DefaultTableModel TablaDeProductos(int val){
 DefaultTableModel tabla = new DefaultTableModel();
 try{
     Con = new Conexion();
     Con.abrir_conexion();
      String query = "select p.idProductos as id,cd.idcompra_detalle,p.Productos,cd.cantidad,cd.precio_costo_unitario from compras_detalle as cd inner join productos as p on cd.idproducto=p.idProductos  where cd.idcompra='"+val+"' order by id;";
      ResultSet consulta = Con.conexionbd.createStatement().executeQuery(query);
      String encabezado[] = {"id","idcompradetalle","Producto","Cantidad","Precio_Unitario"};
      tabla.setColumnIdentifiers(encabezado);
      String datos[] = new String[5];
      while (consulta.next()){
          datos[0] = consulta.getString("id");
          datos[1] = consulta.getString("idcompra_detalle");
          datos[2] = consulta.getString("Productos");
          datos[3] = consulta.getString("cantidad");
          datos[4] = consulta.getString("precio_costo_unitario");
          
          tabla.addRow(datos);
      
      }
      
     Con.cerrar_conexion();
 }catch(SQLException ex){
     System.out.println(ex.getMessage());
 }
  return tabla;
      
    }
}
