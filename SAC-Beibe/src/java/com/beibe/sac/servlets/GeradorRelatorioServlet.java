package com.beibe.sac.servlets;

import com.beibe.sac.beans.LoginBean;
import com.beibe.sac.facade.GeradorRelatorioFacade;
import com.beibe.sac.facade.TipoAtendimentoFacade;
import com.beibe.sac.model.TipoAtendimento;
import java.io.IOException;
import java.net.MalformedURLException;
import java.sql.Connection;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import net.sf.jasperreports.engine.JRException;

/**
 *
 * @author lemospadilha
 */
@WebServlet(name = "GeradorRelatorioServlet", urlPatterns = {"/GeradorRelatorioServlet"})
public class GeradorRelatorioServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException, MalformedURLException, JRException, ParseException {
        response.setContentType("text/html;charset=UTF-8");
        
            Connection conn = null;
         
            HttpSession session = request.getSession();
            RequestDispatcher rd;
            LoginBean loginBean = (LoginBean) session.getAttribute("loginBean");
            if (loginBean == null) {
                request.setAttribute("msg", "Acesso Inválido.");
                rd = getServletContext().getRequestDispatcher("/index.jsp");
                rd.forward(request, response);
            } else {
                String action = request.getParameter("action");
                ServletOutputStream sout;
                String strId;
                int id;
                switch (action) {

                    case "list":
                        rd = getServletContext().getRequestDispatcher("/relatorio.jsp");
                        rd.forward(request, response);
                        break;
                    case "listarTodosFuncionarios":   
                        GeradorRelatorioFacade.gerarRelatorio(request, response, "/relatorios/relatorioFuncionarios.jasper");
                    break;
                        
                    case "listarAtendimentosResolvidos":
                        GeradorRelatorioFacade.gerarRelatorio(request, response, "/relatorios/relatorioAtendimentosResolvidos.jasper");
                    break;
                    
                    case "tipoAtendimento":
                        List<TipoAtendimento> listaTiposAtendimentos = TipoAtendimentoFacade.buscarTodosTiposAtendimentos();
                        request.setAttribute("listaTiposAtendimentos", listaTiposAtendimentos);
                        request.setAttribute("showDiv", "tipoAtendimento");
                        rd = getServletContext().getRequestDispatcher("/relatorio.jsp");
                        rd.forward(request, response);
                    break;
                    case "gerarPdfTipoAtendimento": 
                        int idTipoAtendimento = Integer.parseInt(request.getParameter("tipoAtendimento"));
                        GeradorRelatorioFacade.gerarRelatorio(request, response, "/relatorios/relatorioTipoAtendimento.jasper", idTipoAtendimento);
                    break;
                    case "listarPorPeriodo": 
                        request.setAttribute("showDiv", "periodo");
                        rd = getServletContext().getRequestDispatcher("/relatorio.jsp");
                        rd.forward(request, response);                        
                    break;
                    case "gerarRelatorioPorData": 
                         String dt1 = request.getParameter("dataInicio");
                         Date dataInicio = GeradorRelatorioFacade.converterData(dt1);
                         
                         String dt2 = request.getParameter("dataFim");
                         Date dataFim = GeradorRelatorioFacade.converterData(dt2);
                         GeradorRelatorioFacade.gerarRelatorio(request, response, "/relatorios/relatorioPorPeriodo.jasper", dataInicio, dataFim);   
                    break;
                }
        }
   }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, MalformedURLException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(GeradorRelatorioServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(GeradorRelatorioServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            Logger.getLogger(GeradorRelatorioServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            Logger.getLogger(GeradorRelatorioServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (JRException ex) {
            Logger.getLogger(GeradorRelatorioServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ParseException ex) {
            Logger.getLogger(GeradorRelatorioServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, MalformedURLException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(GeradorRelatorioServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(GeradorRelatorioServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            Logger.getLogger(GeradorRelatorioServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            Logger.getLogger(GeradorRelatorioServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (JRException ex) {
            Logger.getLogger(GeradorRelatorioServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ParseException ex) {
            Logger.getLogger(GeradorRelatorioServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
