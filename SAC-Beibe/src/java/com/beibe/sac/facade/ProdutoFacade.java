package com.beibe.sac.facade;

import com.beibe.sac.DAO.ProdutoDAO;
import com.beibe.sac.model.Produto;
import java.sql.SQLException;
import java.util.List;

public class ProdutoFacade {
    public static final ProdutoDAO produtoDao = new ProdutoDAO();
     
     public static List<Produto> allProdutos() throws SQLException{
        List<Produto> listaProdutos = produtoDao.all();
        return listaProdutos;
    }
    
    public static Produto buscarProdutoPorId(int idProduto) throws SQLException {
        Produto produto = produtoDao.findProdutoById(idProduto);
       
        return produto;
    }
}
