package com.beibe.sac.DAO;

import com.beibe.sac.facade.CategoriaFacade;
import com.beibe.sac.model.Categoria;
import com.beibe.sac.model.Produto;
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
public class ProdutoDAO {

    Connection conn = null;

    public List<Produto> all() throws SQLException {
        List<Produto> listaProdutos = new ArrayList<Produto>();
        try {
            conn = ConnectionFactory.getConnection();
            ResultSet rs = ConnectionFactory.getResultSet(conn, "SELECT * FROM tb_produto");

            while (rs.next()) {
                Produto produto = new Produto();
                produto.setIdProduto(rs.getInt("id_produto"));
                produto.setNomeProduto(rs.getString("nome_produto"));

                produto.setPesoProduto(rs.getInt("peso_produto"));
                Categoria c = CategoriaFacade.buscarPorId(rs.getInt("id_categoria"));
                produto.setCategoria(c);

                listaProdutos.add(produto);
            }

        } catch (Exception e) {
            System.out.println("Erro: " + e.getMessage());

        } finally {
            if (conn != null) {
                conn.close();
            }

        }
        return listaProdutos;

    }

    public Produto findProdutoById(int idProduto) throws SQLException {
        conn = null;
        Produto produto = new Produto();

        try {
            conn = ConnectionFactory.getConnection();
            PreparedStatement statement = ConnectionFactory.getPreparedStatement(conn,
                    "SELECT * FROM tb_produto WHERE id_produto = ?");
            statement.setInt(1, idProduto);
            statement.execute();
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                produto.setIdProduto(rs.getInt("id_produto"));
                produto.setNomeProduto(rs.getString("nome_produto"));

                produto.setPesoProduto(rs.getDouble("peso_produto"));
                int id = rs.getInt("id_categoria");
                Categoria cat = CategoriaFacade.buscarPorId(id);
                produto.setCategoria(cat);

            } else {
                produto = null;
            }
        } catch (Exception e) {
            System.out.println("Erro: " + e.getMessage());

        } finally {
            if (conn != null) {
                conn.close();
            }
            return produto;
        }
    }

    public void insert(Produto produto) throws InstantiationException, IllegalAccessException, ClassNotFoundException, SQLException {

        try {
            conn = ConnectionFactory.getConnection();
            PreparedStatement statement = ConnectionFactory.getPreparedStatement(conn,
                    "INSERT INTO tb_produto values (null,?,?,?)");
            statement.setString(1, produto.getNomeProduto());
            statement.setDouble(2, produto.getPesoProduto());
            statement.setInt(3, produto.getCategoria().getIdCategoria());
            statement.execute();
        } catch (Exception e) {
            System.out.println("Erro " + e.getMessage());
        } finally {
            if (conn != null) {
                conn.close();
            }

        }
    }

    public int alterar(Produto produto) {
        try {
            conn = ConnectionFactory.getConnection();
            PreparedStatement statement = ConnectionFactory.getPreparedStatement(conn,
                    "UPDATE tb_produto SET nome_produto= ?, peso_produto =?, id_categoria=? WHERE id_produto=?");
            statement.setString(1, produto.getNomeProduto());
            statement.setDouble(2, produto.getPesoProduto());
            statement.setInt(3, produto.getCategoria().getIdCategoria());
            statement.setInt(4, produto.getIdProduto());
            statement.executeUpdate();
            System.out.println("Categoria de id: " + produto.getIdProduto() + " alterado com sucesso");
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
                    "DELETE FROM tb_produto WHERE id_produto= ?");
            statement.setInt(1, id);
            statement.execute();
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException("Erro ao deletar produto.");

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
