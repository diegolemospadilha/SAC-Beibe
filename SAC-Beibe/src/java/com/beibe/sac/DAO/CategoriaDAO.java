/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.beibe.sac.DAO;

import com.beibe.sac.model.Categoria;
import com.beibe.sac.utils.ConnectionFactory;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author dev
 */
public class CategoriaDAO {

    Connection conn = null;

    public static List<Categoria> all() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    public static Categoria findById(int idCategoria) throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException {
        Categoria categoria = new Categoria();
        Connection conn = null;

        conn = ConnectionFactory.getConnection();
        PreparedStatement statement = null;
        try {
            statement = ConnectionFactory.getPreparedStatement(conn, "SELECT * FROM tb_categoria WHERE id_categoria = ?");

            statement.setInt(1, idCategoria);
            statement.execute();
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                categoria.setIdCategoria(rs.getInt("id_categoria"));
                categoria.setNomeCategoria(rs.getString("nome_categoria"));
            } else {
                categoria = null;
            }
            return categoria;

        } catch (Exception e) {
            System.out.println("Erro: " + e.getMessage());

        } finally {
            if (conn != null) {
                conn.close();
            }
            return categoria;
        }
    }

}
