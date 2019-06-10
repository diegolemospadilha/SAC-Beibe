package com.beibe.sac.DAO;

import com.beibe.sac.facade.CidadeFacade;
import com.beibe.sac.model.Cidade;
import com.beibe.sac.model.Usuario;
import com.beibe.sac.utils.ConnectionFactory;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author lemospadilha
 */
public class UsuarioDAO {

    List<Usuario> listaUsuarios = new ArrayList<Usuario>();
    Connection conn = null;

    public List<Usuario> all() throws SQLException {

        try {

            conn = ConnectionFactory.getConnection();
            ResultSet rs = ConnectionFactory.getResultSet(conn, "SELECT * FROM tb_usuario");
            while (rs.next()) {
                Usuario user = new Usuario();
                user.setIdUsuario(rs.getInt("id_usuario"));
                user.setNomeUsuario(rs.getString("nome"));
                user.setCpf(rs.getString("cpf"));
                user.setEmail(rs.getString("email"));
                user.setTelefone(rs.getString("telefone"));
                user.setNomeRua(rs.getString("nome_rua"));
                user.setNumeroRua(rs.getInt("numero_rua"));
                user.setComplemento(rs.getString("complemento"));
                user.setBairro(rs.getString("complemento"));
                user.setCep(rs.getString("cep"));
                int idCidade = rs.getInt("id_cidade");

                Cidade cidade = CidadeFacade.buscarCidadeCliente(idCidade);
                if (cidade != null) {
                    user.setCidade(cidade);
                }

                listaUsuarios.add(user);
            }
        } catch (Exception e) {
            System.out.println("Erro: " + e.getMessage());

        } finally {
            if (conn != null) {
                conn.close();
            }

        }
        return listaUsuarios;
    }

    public Usuario findByLogin(String login, String passwd) throws SQLException {
        Usuario user = new Usuario();
        try {
            conn = ConnectionFactory.getConnection();
            PreparedStatement statement = ConnectionFactory.getPreparedStatement(conn,
                    "SELECT * FROM tb_usuario WHERE email = ? AND senha=?");
            statement.setString(1, login);
            statement.setString(2, passwd);
            statement.execute();
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                user = new Usuario();
                user.setIdUsuario(rs.getInt("id_usuario"));
                user.setNomeUsuario(rs.getString("nome"));
                user.setEmail(rs.getString("email"));
                user.setPassword(rs.getString("senha"));
                user.setTipoUsuario(rs.getString("tipo_usuario"));
            } else {
                user = null;
            }
        } catch (Exception e) {
            System.out.println("Erro: " + e.getMessage());

        } finally {
            if (conn != null) {
                conn.close();
            }

            return user;
        }

    }

    public Usuario findById(int idUser) throws SQLException {
        Usuario user = new Usuario();
        try {
            conn = ConnectionFactory.getConnection();
            PreparedStatement statement = ConnectionFactory.getPreparedStatement(conn,
                    "SELECT * FROM tb_usuario WHERE id_usuario = ? ");
            statement.setInt(1, idUser);
            statement.execute();
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                user.setIdUsuario(rs.getInt("id_usuario"));
                user.setNomeUsuario(rs.getString("nome"));
                user.setCpf(rs.getString("cpf"));
                user.setEmail(rs.getString("email"));
                user.setTelefone(rs.getString("telefone"));
                user.setNomeRua(rs.getString("nome_rua"));
                user.setNumeroRua(rs.getInt("numero_rua"));
                user.setComplemento(rs.getString("complemento"));
                user.setBairro(rs.getString("bairro"));
                user.setCep(rs.getString("cep"));
                user.setTipoUsuario(rs.getString("tipo_usuario"));
                int idCidade = rs.getInt("id_cidade");
                Cidade cidade = CidadeFacade.buscarCidadeCliente(idCidade);
                if (cidade != null) {
                    user.setCidade(cidade);
                }
            } else {
                user = null;
            }
        } catch (Exception e) {
            System.out.println("Erro: " + e.getMessage());

        } finally {
            if (conn != null) {
                conn.close();
            }
            return user;
        }

    }

    public void insert(Usuario user, String tipoUsuario) throws InstantiationException, IllegalAccessException, ClassNotFoundException, SQLException {

        try {
            conn = ConnectionFactory.getConnection();
            PreparedStatement statement = ConnectionFactory.getPreparedStatement(conn,
                    "INSERT INTO tb_usuario (nome, cpf ,email , senha, telefone, nome_rua, numero_rua, complemento, bairro, cep, tipo_usuario, id_cidade)"
                    + " values (?,?,?,?,?,?,?,?,?,?,?,?) ");
            statement.setString(1, user.getNomeUsuario());
            statement.setString(2, user.getCpf().replaceAll("\\D", ""));
            statement.setString(3, user.getEmail());
            statement.setString(4, user.getPassword());
            statement.setString(5, user.getTelefone());
            statement.setString(6, user.getNomeRua());
            statement.setInt(7, user.getNumeroRua());
            statement.setString(8, user.getComplemento());
            statement.setString(9, user.getBairro());
            statement.setString(10, user.getCep());
            statement.setString(11, tipoUsuario);
            statement.setInt(12, user.getCidade().getIdCidade());
            statement.execute();
        } catch (Exception e) {
            System.out.println("Erro " + e.getMessage());
        } finally {
            if (conn != null) {
                conn.close();
            }

        }
    }

    public Usuario findById(int id, String tipoUsuario) throws SQLException {
        conn = null;
        Usuario user = new Usuario();
        try {
            conn = ConnectionFactory.getConnection();
            PreparedStatement statement = ConnectionFactory.getPreparedStatement(conn,
                    "SELECT * FROM tb_usuario WHERE id_usuario = ? AND tipo_usuario = ?");
            statement.setInt(1, id);
            statement.setString(2, tipoUsuario);
            statement.execute();
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                user.setIdUsuario(rs.getInt("id_usuario"));
                user.setNomeUsuario(rs.getString("nome"));
                user.setCpf(rs.getString("cpf"));
                user.setEmail(rs.getString("email"));
                user.setTelefone(rs.getString("telefone"));
                user.setNomeRua(rs.getString("nome_rua"));
                user.setNumeroRua(rs.getInt("numero_rua"));
                user.setComplemento(rs.getString("complemento"));
                user.setBairro(rs.getString("bairro"));
                user.setCep(rs.getString("cep"));
                user.setTipoUsuario(rs.getString("tipo_usuario"));
                int idCidade = rs.getInt("id_cidade");
                Cidade cidade = CidadeFacade.buscarCidadeCliente(idCidade);
                if (cidade != null) {
                    user.setCidade(cidade);
                }

            } else {
                //ClienteNaoExisteException ex = new ClienteNaoExisteException(id);

            }
        } catch (Exception e) {
            System.out.println("Erro: " + e.getMessage());

        } finally {
            if (conn != null) {
                conn.close();
            }

            return user;
        }
    }

    public int alterar(Usuario user, String tipoUsuario) {
        try {
            conn = ConnectionFactory.getConnection();
            PreparedStatement statement = ConnectionFactory.getPreparedStatement(conn,
                    "UPDATE tb_usuario SET nome=? , cpf =? , email=? , senha=?, telefone =?, nome_rua=?, numero_rua=?, complemento=?, bairro=?, cep=?, tipo_usuario=?,id_cidade=? WHERE id_usuario=?");
            statement.setString(1, user.getNomeUsuario());
            statement.setString(2, user.getCpf().replaceAll("\\D", ""));
            statement.setString(3, user.getEmail());
            statement.setString(4, user.getPassword());
            statement.setString(5, user.getTelefone());
            statement.setString(6, user.getNomeRua());
            statement.setInt(7,user.getNumeroRua());
            statement.setString(8,user.getComplemento());
            statement.setString(9,user.getBairro());
            statement.setString(10,user.getCep().replaceAll("\\D", ""));
            statement.setString(11,tipoUsuario);
            statement.setInt(12, user.getCidade().getIdCidade());
            statement.setInt(13, user.getIdUsuario());
            statement.executeUpdate();
            System.out.println(tipoUsuario + " " + user.getNomeUsuario() + "alterado com sucesso");
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
    
    public void remove(int id) {
        try {
            conn = ConnectionFactory.getConnection();
            PreparedStatement statement = ConnectionFactory.getPreparedStatement(conn,
                    "DELETE FROM tb_usuario WHERE id_usuario=?");
            statement.setInt(1, id);
            statement.execute();
        } catch(Exception e){
            e.printStackTrace();
             throw new RuntimeException("Erro ao deletar usuário.");
            
        }finally {
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException ex) {
                   throw new RuntimeException("Erro ao fechar conexão.");
                }
            }
        }
    }
  
    public List<Usuario> allFuncionarios() {
        try {
            listaUsuarios = new ArrayList<Usuario>();
            conn = ConnectionFactory.getConnection();
            ResultSet rs = ConnectionFactory.getResultSet(conn, "SELECT * FROM tb_usuario WHERE tipo_usuario='Funcionario' OR tipo_usuario='Gerente'");
            while (rs.next()) {
                Usuario user = new Usuario();
                user.setIdUsuario(rs.getInt("id_usuario"));
                user.setNomeUsuario(rs.getString("nome"));
                user.setCpf(rs.getString("cpf"));
                user.setEmail(rs.getString("email"));
                user.setTelefone(rs.getString("telefone"));
                user.setNomeRua(rs.getString("nome_rua"));
                user.setNumeroRua(rs.getInt("numero_rua"));
                user.setComplemento(rs.getString("complemento"));
                user.setBairro(rs.getString("bairro"));
                user.setCep(rs.getString("cep"));
                user.setTipoUsuario(rs.getString("tipo_usuario"));
                int idCidade = rs.getInt("id_cidade");
                Cidade cidade = CidadeFacade.buscarCidadeCliente(idCidade);
                if (cidade != null) {
                    user.setCidade(cidade);
                }

                listaUsuarios.add(user);
            }
        } catch (Exception e) {
            System.out.println("Erro: " + e.getMessage());

        } finally {
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException ex) {
                    Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }

        }
        return listaUsuarios;
    }
}
