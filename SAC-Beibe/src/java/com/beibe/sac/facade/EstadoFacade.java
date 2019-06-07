package com.beibe.sac.facade;

import com.beibe.sac.DAO.EstadoDAO;
import com.beibe.sac.model.Estado;
import java.sql.SQLException;
import java.util.List;

public class EstadoFacade {
    private static final EstadoDAO estadoDAO = new EstadoDAO();
     
     public static List<Estado> buscarTodos() throws SQLException{
         List<Estado> listaEstados = estadoDAO.all();
         return listaEstados;
     }
    
    public static Estado buscarEstadoCliente(int idEstado) throws SQLException {
      Estado estado = estadoDAO.buscarPorId(idEstado);
      return estado;
    }
}
