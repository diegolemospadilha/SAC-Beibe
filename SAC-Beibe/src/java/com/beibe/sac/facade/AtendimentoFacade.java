
package com.beibe.sac.facade;

import com.beibe.sac.DAO.AtendimentoDAO;
import com.beibe.sac.model.Atendimento;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

public class AtendimentoFacade {
    public static final AtendimentoDAO atendimentoDAO = new AtendimentoDAO();
    
     public static List<Atendimento> buscarTodosAtendimentos() throws SQLException{
        List<Atendimento> listaAtendimento  = atendimentoDAO.all();
        return listaAtendimento;
    }
     
     public static Atendimento buscarAtendimentoPorId(int id) throws SQLException {
         Atendimento atendimento = atendimentoDAO.findById(id);
         return atendimento;
     }
     
    public static void inserirAtendimento(Atendimento atendimento) throws InstantiationException, IllegalAccessException, ClassNotFoundException, SQLException {
        atendimentoDAO.insert(atendimento);
    }

    public static LocalDateTime converterStrToLocalDate(String data) {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm");
        LocalDateTime date = LocalDateTime.parse(data,formatter);
        return date;
    }

    public static List<Atendimento> buscarTodosAtendimentosUser(int id) throws SQLException {
         List<Atendimento> listaAtendimento  = atendimentoDAO.allByUser(id);
        return listaAtendimento;
    }
}
