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
import java.util.ArrayList;
import java.util.List;
import modelo.libro;

/**
 *
 * @author Migue Galdámez
 */
public class libroDAO {

    conexion cn = new conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    libro p = new libro();

    public List listar() {
        ArrayList<libro> list = new ArrayList<>();
        String sql = "select * from libro";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                libro per = new libro();
                per.setId(rs.getInt("Id"));
                per.setAutor(rs.getString("autor"));
                per.setEditorial(rs.getString("editorial"));
                per.setIsbn(rs.getString("isbn"));
                per.setTitulo(rs.getString("titulo"));
                list.add(per);
            }
        } catch (Exception e) {
        }
        return list;
    }

    public libro list(int id) {
        String sql = "select * from libro where Id=" + id;
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                p.setId(rs.getInt("Id"));
                p.setEditorial(rs.getString("editorial"));
                p.setAutor(rs.getString("autor"));
                p.setIsbn(rs.getString("isbn"));
                p.setTitulo(rs.getString("titulo"));

            }
        } catch (Exception e) {
        }
        return p;
    }

    public boolean add(libro per) {
        String sql = "insert into libro(isbn,titulo,autor,editorial)values('" + per.getIsbn() + "','" + per.getTitulo() + "','" + per.getAutor() + "','" + per.getEditorial() + "')";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
        }
        return false;
    }

    public boolean edit(libro per) {
        String sql = "update libro set isbn='" + per.getIsbn() + "',titulo='" + per.getTitulo() + "',autor='" + per.getAutor() + "',editorial='" + per.getEditorial() + "'where Id=" + per.getId();
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
        }
        return false;
    }

    public boolean eliminar(int id) {
        String sql = "delete from libro where Id=" + id;
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
        }
        return false;
    }
}
