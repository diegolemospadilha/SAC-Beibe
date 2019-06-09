package com.beibe.sac.servlets;

import com.beibe.sac.facade.CategoriaFacade;
import com.beibe.sac.model.Categoria;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author lemospadilha
 */
@WebServlet(urlPatterns = {"/CategoriaServlet"})
public class CategoriaServlet extends HttpServlet {

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
            throws ServletException, IOException, SQLException, IllegalAccessException, InstantiationException, ClassNotFoundException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            HttpSession session = request.getSession();
            RequestDispatcher rd;
            String strId, strMessage;
            int id = 0;
            List<Categoria> listaCategorias = new ArrayList<Categoria>();
            String action = request.getParameter("action");
            Categoria categoria;
            switch (action) {
                case "list":
                    listaCategorias = new ArrayList<Categoria>();
                    listaCategorias = CategoriaFacade.buscarTodos();
                    request.setAttribute("listaCategorias", listaCategorias);
                    rd = getServletContext().getRequestDispatcher("/categoria/categoria.jsp");
                    rd.forward(request, response);

                    break;

                case "formUpdate":
                    
                    strId = request.getParameter("id");
                    id = Integer.parseInt(strId);
                    categoria = CategoriaFacade.buscarPorId(id);
                    request.setAttribute("categoria", categoria);
                    request.setAttribute("showDiv", "update");
                    listaCategorias = CategoriaFacade.buscarTodos();
                    request.setAttribute("listaCategorias", listaCategorias);
                    rd = getServletContext().getRequestDispatcher("/categoria/categoria.jsp");
                    rd.forward(request, response);
                    break;

                case "remove":
                    strId = request.getParameter("id");
                    id = Integer.parseInt(strId);
                    CategoriaFacade.remover(id);
                    rd = getServletContext().getRequestDispatcher("/categoria/categoria.jsp");
                    rd.forward(request, response);
                    break;

                case "update":
                    strId = request.getParameter("id");
                    id = Integer.parseInt(strId);
                    categoria = new Categoria();
                    categoria.setIdCategoria(id);
                    categoria.setNomeCategoria(request.getParameter("nomeCategoria"));

                    if (!categoria.getNomeCategoria().equals(null)) {

                        if (CategoriaFacade.alterar(categoria) == 0) {
                            strMessage = "Categoria com id " + categoria.getIdCategoria() + " atualizada com sucesso!";
                            request.setAttribute("msg", strMessage);
                            listaCategorias = CategoriaFacade.buscarTodos();
                            request.setAttribute("listaCategorias", listaCategorias);
                            rd = getServletContext().getRequestDispatcher("/categoria/categoria.jsp");
                            rd.forward(request, response);

                        } else {
                            request.setAttribute("msg", "Erro ao atualizar usuário. ");
                            rd = getServletContext().getRequestDispatcher("/erro.jsp");
                            rd.forward(request, response);
                        }
                    }
                    break;

                case "formNew":
                    request.setAttribute("showDiv", "new");
                    listaCategorias = CategoriaFacade.buscarTodos();
                    request.setAttribute("listaCategorias", listaCategorias);
                    rd = getServletContext().getRequestDispatcher("/categoria/categoria.jsp");
                    rd.forward(request, response);
                    break;

                case "new":
                    categoria = new Categoria();
                    categoria.setNomeCategoria(request.getParameter("nomeCategoria"));

                    if (!categoria.getNomeCategoria().equals(null)) {
                        CategoriaFacade.inserir(categoria);
                        strMessage = "Categoria " + categoria.getNomeCategoria() + " criada com sucesso";
                        request.setAttribute("msg", strMessage);
                        listaCategorias = CategoriaFacade.buscarTodos();
                        request.setAttribute("listaCategorias", listaCategorias);
                        rd = getServletContext().getRequestDispatcher("/categoria/categoria.jsp");
                        rd.forward(request, response);
                    } else {
                        request.setAttribute("msg", "Acesso Inválido  para cadastrar usuário. ");
                        rd = getServletContext().getRequestDispatcher("/erro.jsp");
                        rd.forward(request, response);

                    }
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
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(CategoriaServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            Logger.getLogger(CategoriaServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            Logger.getLogger(CategoriaServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(CategoriaServlet.class.getName()).log(Level.SEVERE, null, ex);
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
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(CategoriaServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            Logger.getLogger(CategoriaServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            Logger.getLogger(CategoriaServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(CategoriaServlet.class.getName()).log(Level.SEVERE, null, ex);
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
