package com.beibe.sac.facade;

import com.beibe.sac.utils.ConnectionFactory;
import java.io.IOException;
import java.net.MalformedURLException;
import java.net.URL;
import java.sql.Connection;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperRunManager;

public class GeradorRelatorioFacade {
    public static Connection conn = null;

    public static void gerarRelatorio(HttpServletRequest request, HttpServletResponse response, String arquivoJasper) throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException, MalformedURLException, JRException, IOException, ServletException {
        try {
            conn = ConnectionFactory.getConnection();
            ServletOutputStream sout;
            String jasper = request.getContextPath() + arquivoJasper;
            // Host onde o servlet esta executando
            String host = "http://" + request.getServerName()
                    + ":" + request.getServerPort();
            // URL para acesso ao relatório
            URL jasperURL = new URL(host + jasper);
            // Parâmetros do relatório
            HashMap params = new HashMap();
            // Geração do relatório
            byte[] bytes = JasperRunManager.runReportToPdf(
                    jasperURL.openStream(), params, conn);

            if (bytes != null) {
                // A página será mostrada em PDF
                response.setContentType("application/pdf");
                // Envia o PDF para o Cliente
                sout = response.getOutputStream();
                sout.write(bytes);
                sout.flush();
            }
        }catch (ClassNotFoundException e) {
            request.setAttribute("mensagem", "Driver BD não encontrado : "  + e.getMessage());
            request.getRequestDispatcher("/erro.jsp").forward(request, response);
        } catch (SQLException e) {
            request.setAttribute("mensagem", "Erro de conexão ou query: "
                    + e.getMessage());
            request.getRequestDispatcher("/erro.jsp").forward(request, response);
        } catch (JRException e) {
            request.setAttribute("mensagem", "Erro no Jasper : " + e.getMessage());
            request.getRequestDispatcher("/erro.jsp").forward(request, response);
        } finally {
            if (conn != null) {
                try {
                    conn.close();
                } catch (Exception e) {
                }
            }
        }

    }

    public static void gerarRelatorio(HttpServletRequest request, HttpServletResponse response, String arquivoJasper, List<String> listaParams) throws InstantiationException, IllegalAccessException, MalformedURLException, IOException, ServletException {
       try {
            conn = ConnectionFactory.getConnection();
            ServletOutputStream sout;
            String jasper = request.getContextPath() + arquivoJasper;
            // Host onde o servlet esta executando
            String host = "http://" + request.getServerName()
                    + ":" + request.getServerPort();
            // URL para acesso ao relatório
            URL jasperURL = new URL(host + jasper);
            // Parâmetros do relatório
            HashMap params = new HashMap();
            params.put("listaParams", listaParams);
            // Geração do relatório
            byte[] bytes = JasperRunManager.runReportToPdf(
                    jasperURL.openStream(), params, conn);

            if (bytes != null) {
                // A página será mostrada em PDF
                response.setContentType("application/pdf");
                // Envia o PDF para o Cliente
                sout = response.getOutputStream();
                sout.write(bytes);
                sout.flush();
            }
        }catch (ClassNotFoundException e) {
            request.setAttribute("mensagem", "Driver BD não encontrado : "  + e.getMessage());
            request.getRequestDispatcher("/erro.jsp").forward(request, response);
        } catch (SQLException e) {
            request.setAttribute("mensagem", "Erro de conexão ou query: "
                    + e.getMessage());
            request.getRequestDispatcher("/erro.jsp").forward(request, response);
        } catch (JRException e) {
            request.setAttribute("mensagem", "Erro no Jasper : " + e.getMessage());
            request.getRequestDispatcher("/erro.jsp").forward(request, response);
        } finally {
            if (conn != null) {
                try {
                    conn.close();
                } catch (Exception e) {
                }
            }
        }
    }

    public static void gerarRelatorio(HttpServletRequest request, HttpServletResponse response, String arquivoJasper,Date dataInicio,Date dataFim) throws MalformedURLException, InstantiationException, IOException, ServletException, IllegalAccessException {
      try {
            conn = ConnectionFactory.getConnection();
            ServletOutputStream sout;
            String jasper = request.getContextPath() + arquivoJasper;
            // Host onde o servlet esta executando
            String host = "http://" + request.getServerName()
                    + ":" + request.getServerPort();
            // URL para acesso ao relatório
            URL jasperURL = new URL(host + jasper);
            // Parâmetros do relatório
            HashMap params = new HashMap();
            params.put("dataBegin", dataInicio);
            params.put("dataEnd", dataFim);
            // Geração do relatório
            byte[] bytes = JasperRunManager.runReportToPdf(jasperURL.openStream(), params, conn);

            if (bytes != null) {
                // A página será mostrada em PDF
                response.setContentType("application/pdf");
                // Envia o PDF para o Cliente
                sout = response.getOutputStream();
                sout.write(bytes);
                sout.flush();
            }
        }catch (ClassNotFoundException e) {
            request.setAttribute("mensagem", "Driver BD não encontrado : "  + e.getMessage());
            request.getRequestDispatcher("/erro.jsp").forward(request, response);
        } catch (SQLException e) {
            request.setAttribute("mensagem", "Erro de conexão ou query: "
                    + e.getMessage());
            request.getRequestDispatcher("/erro.jsp").forward(request, response);
        } catch (JRException e) {
            request.setAttribute("mensagem", "Erro no Jasper : " + e.getMessage());
            request.getRequestDispatcher("/erro.jsp").forward(request, response);
        } finally {
            if (conn != null) {
                try {
                    conn.close();
                } catch (Exception e) {
                }
            }
        }
    }

    public static Date converterData(String dataString) throws ParseException {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        return sdf.parse(dataString);
    }
}
