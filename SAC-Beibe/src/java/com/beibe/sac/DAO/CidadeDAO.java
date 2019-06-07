package com.beibe.sac.DAO;

import com.beibe.sac.facade.EstadoFacade;
import com.beibe.sac.model.Cidade;
import com.beibe.sac.model.Estado;
import com.beibe.sac.utils.ConnectionFactory;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author lemospadilha
 */
public class CidadeDAO {
    Connection conn = null;
    public List<Cidade> all() throws SQLException {

        List<Cidade> listaCidades = new ArrayList<Cidade>();
        try {

            conn = ConnectionFactory.getConnection();
            ResultSet rs = ConnectionFactory.getResultSet(conn, "SELECT * FROM tb_cidade");

            while (rs.next()) {
                Cidade cidade = new Cidade();
                cidade.setIdCidade(rs.getInt("id_cidade")); 
                cidade.setNomeCidade(rs.getString("nome_cidade"));
                int idEstado = rs.getInt("id_estado"); 
                Estado estado = EstadoFacade.buscarEstadoCliente(idEstado);
                cidade.setEstado(estado);
                listaCidades.add(cidade);
            }
        } catch (Exception e) {
            System.out.println("Erro: " + e.getMessage());

        } finally {
            if (conn != null) {
                conn.close();
            }

        }
        return listaCidades;
    }
    
     public Cidade buscarPorId(int idCidade) throws SQLException{
         conn = null;
         Cidade cidade = new Cidade();
        try {
            conn = ConnectionFactory.getConnection();
            PreparedStatement statement = ConnectionFactory.getPreparedStatement(conn,
                    "SELECT * FROM tb_cidade WHERE id_cidade = ?");
            statement.setInt(1, idCidade);
            statement.execute();
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                cidade.setIdCidade(rs.getInt("id_cidade")); 
                cidade.setNomeCidade(rs.getString("nome_cidade"));
                int idEstado = rs.getInt("id_estado"); 
                Estado estado = EstadoFacade.buscarEstadoCliente(idEstado);
                cidade.setEstado(estado); 
            } else {
               cidade = null;
            }
        } catch (Exception e) {
            System.out.println("Erro: " + e.getMessage());

        } finally {
            if (conn != null) {
                conn.close();
            }
            return cidade;
        }
    }
     
    public List<Cidade> buscarCidadesPorEstado(int idEstado) throws SQLException {
         conn = null;
         List<Cidade> listaCidades = new ArrayList<Cidade>();
        try {
            conn = ConnectionFactory.getConnection();
            PreparedStatement statement = ConnectionFactory.getPreparedStatement(conn,
                    "SELECT * FROM tb_cidade WHERE id_estado = ?");
            statement.setInt(1, idEstado);
            statement.execute();
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Cidade cidade = new Cidade();
                cidade.setIdCidade(rs.getInt("id_cidade"));
                idEstado = rs.getInt("id_estado");
                Estado estado = EstadoFacade.buscarEstadoCliente(idEstado);
                cidade.setEstado(estado);
                cidade.setNomeCidade(rs.getString("nome_cidade"));
                listaCidades.add(cidade);
            }
        } catch (Exception e) {
            System.out.println("Erro: " + e.getMessage());

        } finally {
            if (conn != null) {
                conn.close();
            }
            return listaCidades;
        
        }
    }
}
