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
import static java.time.LocalDateTime.now;
import java.time.ZoneId;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import sun.awt.X11.XConstants;

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
                Date data = rs.getTimestamp("data_atendimento");
                LocalDateTime d = data.toInstant().atZone(ZoneId.systemDefault()).toLocalDateTime();
                atendimento.setDataHoraAtendimento(d);
                Produto produto = ProdutoFacade.buscarPorId(rs.getInt("id_produto"));
                atendimento.setDescricaoAtendimento(rs.getString("descricao_atendimento"));
                id = rs.getInt("id_cliente");
                Usuario usuario = UsuarioFacade.buscarPorId(id, "Cliente");
                atendimento.setUsuario(usuario);
                atendimento.setProduto(produto);
                atendimento.setSolucaoApresentada(rs.getString("solucao_apresentada"));
                atendimento.setSituacao(rs.getString("situacao_atendimento"));
                atendimento.setUsuario(usuario);
                id = rs.getInt("id_tipo_atendimento");
                TipoAtendimento tipoAtendimento = TipoAtendimentoFacade.buscaTipoAtendimentoPorId(id);
                atendimento.setTipoAtendimento(tipoAtendimento);
                int weeks = (int) d.until(now(), ChronoUnit.WEEKS);
                if (weeks > 1) {
                    atendimento.setPrioridade(1);
                }

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

    public List<Atendimento> Abertos() throws SQLException {
        List<Atendimento> listaAtendimentos = new ArrayList<Atendimento>();
        int id;
        try {
            conn = ConnectionFactory.getConnection();
            ResultSet rs = ConnectionFactory.getResultSet(conn, "SELECT * FROM tb_atendimento");

            while (rs.next()) {
                Atendimento atendimento = new Atendimento();
                atendimento.setIdAtendimento(rs.getInt("id_atendimento"));
                Date data = rs.getTimestamp("data_atendimento");
                LocalDateTime d = data.toInstant().atZone(ZoneId.systemDefault()).toLocalDateTime();
                atendimento.setDataHoraAtendimento(d);
                atendimento.setDescricaoAtendimento(rs.getString("descricao_atendimento"));
                id = rs.getInt("id_cliente");
                Usuario usuario = UsuarioFacade.buscarPorId(id, "Cliente");
                atendimento.setUsuario(usuario);
                Produto produto = ProdutoFacade.buscarPorId(rs.getInt("id_produto"));
                atendimento.setProduto(produto);
                atendimento.setSolucaoApresentada(rs.getString("solucao_apresentada"));
                atendimento.setSituacao(rs.getString("situacao_atendimento"));
                atendimento.setUsuario(usuario);
                id = rs.getInt("id_tipo_atendimento");
                TipoAtendimento tipoAtendimento = TipoAtendimentoFacade.buscaTipoAtendimentoPorId(id);
                int weeks = (int) d.until(now(), ChronoUnit.WEEKS);

                if (weeks > 1) {
                    atendimento.setPrioridade(1);
                }
                atendimento.setTipoAtendimento(tipoAtendimento);
                if (rs.getString("situacao_atendimento").equalsIgnoreCase("N")) {
                    listaAtendimentos.add(atendimento);
                }
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
                    "INSERT INTO tb_atendimento (data_atendimento, "
                    + "descricao_atendimento, situacao_atendimento, "
                    + "solucao_apresentada, id_cliente, id_produto, "
                    + "id_tipo_atendimento)"
                    + " values (?,?,?,?,?,?,?) ");

            statement.setObject(1, atendimento.getDataHoraAtendimento());
            statement.setString(2, atendimento.getDescricaoAtendimento());
            statement.setString(3, "N");
            statement.setString(4, "não respondida");
            statement.setInt(5, atendimento.getUsuario().getIdUsuario());
            statement.setInt(6, atendimento.getProduto().getIdProduto());
            statement.setInt(7, atendimento.getTipoAtendimento().getIdTipoAtendimento());

            System.out.println(statement);

            statement.execute();

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
                Date data = rs.getTimestamp("data_atendimento");
                LocalDateTime d = data.toInstant().atZone(ZoneId.systemDefault()).toLocalDateTime();
                atendimento.setDataHoraAtendimento(d);
                atendimento.setDescricaoAtendimento(rs.getString("descricao_atendimento"));
                id = rs.getInt("id_cliente");
                Usuario usuario = UsuarioFacade.buscarPorId(id, "Cliente");
                atendimento.setUsuario(usuario);
                Produto produto = ProdutoFacade.buscarPorId(rs.getInt("id_produto"));
                atendimento.setProduto(produto);
                atendimento.setSolucaoApresentada(rs.getString("solucao_apresentada"));
                atendimento.setSituacao(rs.getString("situacao_atendimento"));
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
                    "SELECT * FROM tb_atendimento WHERE id_cliente = ? ORDER BY data_atendimento DESC");
            statement.setInt(1, id);
            statement.execute();
            ResultSet rs = statement.executeQuery();

            while (rs.next()) {
                Atendimento atendimento = new Atendimento();
                atendimento.setIdAtendimento(rs.getInt("id_atendimento"));
                Date data = rs.getTimestamp("data_atendimento");
                LocalDateTime d = data.toInstant().atZone(ZoneId.systemDefault()).toLocalDateTime();
                atendimento.setDataHoraAtendimento(d);

                atendimento.setDescricaoAtendimento(rs.getString("descricao_atendimento"));
                id = rs.getInt("id_cliente");
                System.out.println("id cliente " + id);
                Usuario usuario = UsuarioFacade.buscarPorId(id, "Cliente");
                atendimento.setUsuario(usuario);
                Produto produto = ProdutoFacade.buscarPorId(rs.getInt("id_produto"));
                atendimento.setProduto(produto);
                atendimento.setSolucaoApresentada(rs.getString("solucao_apresentada"));
                atendimento.setSituacao(rs.getString("situacao_atendimento"));
                atendimento.setUsuario(usuario);
                id = rs.getInt("id_tipo_atendimento");

                System.out.println("usuario" + usuario.getNomeUsuario());
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

    public int responder(int idAtendimento, String solucao) {
        try {
            conn = ConnectionFactory.getConnection();
            PreparedStatement statement = ConnectionFactory.getPreparedStatement(conn,
                    "UPDATE beibe.tb_atendimento SET solucao_apresentada = ?, situacao_atendimento =  ? WHERE id_atendimento = ?");
            statement.setString(1, solucao);
            statement.setString(2, "S");
            statement.setInt(3, idAtendimento);

            statement.executeUpdate();
            System.out.println("Atendimento " + idAtendimento + " fechado");
            return 0;

        } catch (Exception e) {
            e.printStackTrace();
            return 1;
            //throw new RuntimeException("Erro ao atualizar cliente." + e.getMessage());

        } finally {
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException ex) {
                    throw new RuntimeException("Erro ao fechar conexão.");
                }
            }

        }
    }

    public void delete(int idAtendimento) {
        try {
            conn = ConnectionFactory.getConnection();
            PreparedStatement statement = ConnectionFactory.getPreparedStatement(conn,
                    "DELETE FROM tb_atendimento WHERE id_atendimento = ?");
            statement.setInt(1, idAtendimento);
            statement.execute();
            System.out.println("Cliente " + idAtendimento + "removido com sucesso");

        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException("Erro ao deletar cliente.");

        } finally {
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException ex) {
                    throw new RuntimeException("Erro ao fechar conexão.");
                }
            }

        }
    }
}
