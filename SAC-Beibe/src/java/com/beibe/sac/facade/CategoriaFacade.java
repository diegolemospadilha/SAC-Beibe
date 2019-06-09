package com.beibe.sac.facade;

import com.beibe.sac.DAO.CategoriaDAO;
import com.beibe.sac.model.Categoria;
import java.sql.SQLException;
import java.util.List;

public class CategoriaFacade {

    private static final CategoriaDAO categoriaDAO = new CategoriaDAO();

    public static List<Categoria> buscarTodos() throws SQLException {
        List<Categoria> categorias = categoriaDAO.all();
        return categorias;
    }

    public static Categoria buscarPorId(int id) throws SQLException {
        Categoria categoria = categoriaDAO.findById(id);
        return categoria;
    }

    public static void remover(int id) {
        categoriaDAO.remove(id);
    }

    public static int alterar(Categoria categoria) {
        return categoriaDAO.alterar(categoria);
    }

    public static void inserir(Categoria categoria) throws IllegalAccessException, InstantiationException, ClassNotFoundException, SQLException {
        categoriaDAO.insert(categoria);
    }
}
