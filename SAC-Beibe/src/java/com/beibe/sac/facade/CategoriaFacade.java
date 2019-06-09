/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.beibe.sac.facade;

import com.beibe.sac.DAO.CategoriaDAO;
import com.beibe.sac.model.Categoria;
import java.sql.SQLException;
import java.util.List;

/**
 *
 * @author dev
 */
public class CategoriaFacade {

    public static final CategoriaDAO categoriaDao = new CategoriaDAO();

    public static List<Categoria> allCategoria() throws SQLException {
        List<Categoria> listaCategorias = categoriaDao.all();
        return listaCategorias;
    }

    public static Categoria buscaCategoriaPorId(int idCategoria) throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException {
        Categoria categoria = categoriaDao.findById(idCategoria);
        return categoria;
    }

}
