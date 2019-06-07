package com.beibe.sac.DAO;

import com.beibe.sac.facade.LoginFacade;
import com.beibe.sac.facade.ProdutoFacade;
import com.beibe.sac.facade.TipoAtendimentoFacade;
import com.beibe.sac.facade.UsuarioFacade;
import com.beibe.sac.model.Atendimento;
import com.beibe.sac.model.Produto;
import com.beibe.sac.model.TipoAtendimento;
import com.beibe.sac.model.Usuario;
import com.beibe.sac.utils.ConnectionFactory;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class AtendimentoDAO {
   Connection conn = null;

    public List<Atendimento> all() throws SQLException {
        List<Atendimento> listaAtendimentos = new ArrayList<Atendimento>();
        int id;
        try {
            conn = ConnectionFactory.getConnection();
            ResultSet rs = ConnectionFactory.getResultSet(conn, "SELECT * FROM tb_atendimento");

            while (rs.next()) {
                Atendimento atendimento = new Atendimento();
                atendimento.setIdAtendimento(rs.getInt("id_atendimento"));
                Date data = rs.getTimestamp("dt_hr_atendimento");
                LocalDateTime d = data.toInstant().atZone(ZoneId.systemDefault()).toLocalDateTime();
                atendimento.setDataHoraAtendimento(d);
                atendimento.setDescricaoAtendimento(rs.getString("desc_atendimento"));
                Produto produto = ProdutoFacade.buscarProdutoPorId(rs.getInt("id_produto"));
                atendimento.setProduto(produto);
                atendimento.setSituacao(rs.getString("res_atendimento"));
                id = rs.getInt("id_usuario");
                Usuario usuario = LoginFacade.buscarUsuarioPorId(id);
                atendimento.setUsuario(usuario);
                id = rs.getInt("id_tipo_atendimento");
                TipoAtendimento tipoAtendimento = TipoAtendimentoFacade.buscaTipoAtendimentoPorId(id);
                atendimento.setTipoAtendimento(tipoAtendimento);
                listaAtendimentos.add(atendimento);
            }

        } catch (Exception e) {
            System.out.println("Erro: " + e.getMessage());

        } finally {
            if (conn != null) {
                conn.close();
            }

        }
        return listaAtendimentos;

    }

    public void insert(Atendimento atendimento) throws InstantiationException, IllegalAccessException, ClassNotFoundException, SQLException {

        try {
            conn = ConnectionFactory.getConnection();
            PreparedStatement statement = ConnectionFactory.getPreparedStatement(conn,
                    "INSERT INTO tb_atendimento (dt_hr_atendimento, res_atendimento, id_tipo_atendimento, desc_atendimento, id_produto, id_usuario, id_cliente)"
                    + " values (?,?,?,?,?,?,?) ");

            statement.setObject(1, atendimento.getDataHoraAtendimento());
            statement.setString(2, atendimento.getSituacao());
            statement.setInt(3, atendimento.getTipoAtendimento().getIdTipoAtendimento());
            statement.setString(4, atendimento.getDescricaoAtendimento());
            statement.setInt(5, atendimento.getProduto().getIdProduto());
            statement.setInt(6, atendimento.getUsuario().getIdUsuario());
            
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (conn != null) {
                conn.close();
            }

        }
    }

    public Atendimento findById(int id) throws SQLException {
        conn = null;
        Atendimento atendimento = new Atendimento();
        try {
            conn = ConnectionFactory.getConnection();
            PreparedStatement statement = ConnectionFactory.getPreparedStatement(conn,
                    "SELECT * FROM tb_atendimento WHERE id_atendimento = ?");
            statement.setInt(1, id);
            statement.execute();
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                atendimento.setIdAtendimento(rs.getInt("id_atendimento"));
                Date data = rs.getTimestamp("dt_hr_atendimento");
                LocalDateTime d = data.toInstant().atZone(ZoneId.systemDefault()).toLocalDateTime();
                atendimento.setDataHoraAtendimento(d);
                atendimento.setDescricaoAtendimento(rs.getString("descricao_atendimento"));
                Produto produto = ProdutoFacade.buscarProdutoPorId(rs.getInt("id_produto"));
                atendimento.setProduto(produto);
                atendimento.setSituacao(rs.getString("res_atendimento"));
                id = rs.getInt("id_usuario");
                Usuario usuario = LoginFacade.buscarUsuarioPorId(id);
                atendimento.setUsuario(usuario);
                id = rs.getInt("id_tipo_atendimento");
                TipoAtendimento tipoAtendimento = TipoAtendimentoFacade.buscaTipoAtendimentoPorId(id);
                atendimento.setTipoAtendimento(tipoAtendimento);

            } else {
                atendimento = null;
            }
        } catch (Exception e) {
            System.out.println("Erro: " + e.getMessage());

        } finally {
            if (conn != null) {
                conn.close();
            }

            return atendimento;
        }
    }

    public List<Atendimento> allByUser(int id) throws SQLException {
        conn = null;
         List<Atendimento> listaAtendimentos = new ArrayList<Atendimento>();
        try {
            conn = ConnectionFactory.getConnection();
            PreparedStatement statement = ConnectionFactory.getPreparedStatement(conn,
                    "SELECT * FROM tb_atendimento WHERE id_usuario = ? ORDER BY dt_hr_atendimento DESC");
            statement.setInt(1, id);
            statement.execute();
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Atendimento atendimento = new Atendimento();
                atendimento.setIdAtendimento(rs.getInt("id_atendimento"));
                Date data = rs.getTimestamp("dt_hr_atendimento");
                LocalDateTime d = data.toInstant().atZone(ZoneId.systemDefault()).toLocalDateTime();
                atendimento.setDataHoraAtendimento(d);
                atendimento.setDescricaoAtendimento(rs.getString("desc_atendimento"));
                id = rs.getInt("id_usuario");
                Usuario usuario = UsuarioFacade.buscarPorId(id, "cliente");
                atendimento.setUsuario(usuario);
                Produto produto = ProdutoFacade.buscarProdutoPorId(rs.getInt("id_produto"));
                atendimento.setProduto(produto);
                atendimento.setSituacao(rs.getString("res_atendimento"));
                atendimento.setUsuario(usuario);
                id = rs.getInt("id_tipo_atendimento");
                TipoAtendimento tipoAtendimento = TipoAtendimentoFacade.buscaTipoAtendimentoPorId(id);
                atendimento.setTipoAtendimento(tipoAtendimento);
                listaAtendimentos.add(atendimento);
            }
        } catch (Exception e) {
            
    
        } finally {
            if (conn != null) {
                conn.close();
            }
            return listaAtendimentos;
        
        }
    }
}
