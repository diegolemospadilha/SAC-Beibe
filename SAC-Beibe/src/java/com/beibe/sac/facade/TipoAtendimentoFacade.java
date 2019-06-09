package com.beibe.sac.facade;

import com.beibe.sac.DAO.TipoAtendimentoDAO;
import com.beibe.sac.model.TipoAtendimento;
import java.sql.SQLException;
import java.util.List;

public class TipoAtendimentoFacade {

    public static final TipoAtendimentoDAO atendimentoDao = new TipoAtendimentoDAO();

    public static List<TipoAtendimento> buscarTodosTiposAtendimentos() throws SQLException {
        List<TipoAtendimento> listaTiposAtendimentos = atendimentoDao.all();
        return listaTiposAtendimentos;
    }

    public static TipoAtendimento buscaTipoAtendimentoPorId(int id) throws SQLException {
        TipoAtendimento tpAtendimento = atendimentoDao.buscarTipoAtendimentoPorId(id);
        return tpAtendimento;

    }
}
