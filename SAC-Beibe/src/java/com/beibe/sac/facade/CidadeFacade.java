package com.beibe.sac.facade;

import com.beibe.sac.DAO.CidadeDAO;
import com.beibe.sac.model.Cidade;
import java.sql.SQLException;
import java.util.List;

public class CidadeFacade {
    private static final CidadeDAO cidadeDAO = new CidadeDAO();
     
    public static List<Cidade> buscarCidadesPorEstado(int idEstado) throws SQLException {
       List<Cidade> listaCidades = cidadeDAO.buscarCidadesPorEstado(idEstado);
       return listaCidades;
    } 
    
    public static Cidade buscarCidadeCliente(int idCidade) throws SQLException {
      Cidade cidade = cidadeDAO.buscarPorId(idCidade);
      return cidade;
    }
}
