package com.beibe.sac.facade;

import com.beibe.sac.DAO.ProdutoDAO;
import com.beibe.sac.model.Produto;
import java.sql.SQLException;
import java.util.List;

public class ProdutoFacade {

    public static final ProdutoDAO produtoDao = new ProdutoDAO();

    public static List<Produto> buscarTodos() throws SQLException {
        List<Produto> listaProdutos = produtoDao.all();
        return listaProdutos;
    }

    public static Produto buscarPorId(int idProduto) throws SQLException {
        Produto produto = produtoDao.findById(idProduto);
        return produto;
    }

    public static void remover(int id) {
        produtoDao.remove(id);
    }

    public static int alterar(Produto produto) {
        return produtoDao.alterar(produto);
    }

    public static void inserir(Produto produto) throws InstantiationException, IllegalAccessException, ClassNotFoundException, SQLException {
        produtoDao.insert(produto);
    }
}
