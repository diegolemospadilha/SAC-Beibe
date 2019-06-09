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
                Categoria c = CategoriaFacade.buscaCategoriaPorId(rs.getInt("id_categoria"));
                produto.setNomeCategoria(c);
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
}
