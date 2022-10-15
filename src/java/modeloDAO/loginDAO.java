/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modeloDAO;

import config.conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import modelo.login;

/**
 *
 * @author Carlos Rafaelano
 */
public class loginDAO {

//preparando la coneccion y los objetos
    conexion cn = new conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    login log = new login();

//loguear al usuario
    public int loguear(String log, String pass) {
        int cont = 0;
        int nivel = 0;
        String sql = "select nivel from usuarios where login='" + log + "' and clave='" + pass + "'";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                nivel = rs.getInt("nivel");
            }
            con.close();
        } catch (SQLException e) {
        }
        return nivel;
    }

//recuperando los elementos de la tabla
    public List listar() {
        ArrayList<login> list = new ArrayList<>();
        String sql = "select * from usuarios";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                login per = new login();
                per.setLogin(rs.getString("login"));
                per.setClave(rs.getString("clave"));
                per.setNombre(rs.getString("nombre"));
                per.setNivel(rs.getInt("nivel"));
                list.add(per);
            }
            con.close();
        } catch (SQLException e) {
        }
        return list;
    }
}
