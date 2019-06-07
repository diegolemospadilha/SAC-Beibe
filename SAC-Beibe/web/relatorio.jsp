<%@ page errorPage="erro.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
    <head>
        <c:import  url="templates/head.jsp"/>
    </head>
    <body>
        <c:import  url="templates/nav.jsp"/>
        <div class='container col-md-6'>
            <div class='align-self-center m-5'>
                <h2 class='text-center col-12-md' style='color:#000'>Página de geração de relatórios</h2>
            </div>
        </div>
        <div class='text-center '> 
            <h4>Escolha uma das opções abaixo</h4>
        </div>
        <div class="d-flex justify-content-center mt-3">
            <ul class="list-group list-group-horizontal-sm">
                <li class="list-group-item">
                    <a href="GeradorRelatorioServlet?action=listarClientes" class="m-5 btn btn-link">Listar todos os clientes</a>
                </li>
                <li class="list-group-item">
                    <a href="GeradorRelatorioServlet?action=listarPorPeriodo" class="m-5 btn btn-link">Listar atendimentos por período</a>
                </li>
                <li class="list-group-item">
                    <a href="GeradorRelatorioServlet?action=listarAtendimentosResolvidos" class="m-5 btn btn-link">Listar todos os atendimentos resolvidos</a>
                </li>
                <li class="list-group-item">
                    <a href="GeradorRelatorioServlet?action=tipoAtendimento" class="m-5 btn btn-link">Listar Atendimentos por tipo de atendimento</a>
                </li>
            </ul>
        </div></br>

        <c:if test="${showDiv== 'tipoAtendimento'}">
            <div style="padding-left: 25%" class="mt-3 w-75 d-flex justify-content-center">
                <form action="GeradorRelatorioServlet?action=gerarPdfTipoAtendimento" method="POST">
                    <i class="fas fa-user p-2"></i><label for="tipoAtendimento"> Selecione o tipo de atendimento:</label>
                    <select id="tipoAtendimento" name="tipoAtendimento" class="form-control">
                        <option selected="selected">Selecione o tipo de Atendimento</option>
                        <c:forEach var="tipoAtendimento" items="${listaTiposAtendimentos}">
                            <option value="${tipoAtendimento.idTipoAtendimento }">${tipoAtendimento.nomeTipoAtendimento}</option>
                        </c:forEach>
                    </select></br>

                    <div style="padding-left: 25%">
                        <input class="btn btn-primary" type="submit" value="Gerar Relatório"></a>
                    </div>
                </form> 
            </div>
        </c:if>

        <c:if test="${showDiv== 'periodo'}">
            <div style="padding-left: 25%" class="mt-3 w-75 d-flex justify-content-center">
                <form action="GeradorRelatorioServlet?action=gerarRelatorioPorData" method="POST">
                    <i class="far fa-calendar-alt p-2"></i> <label>De : </label>
                    <input  class="form-control mb-3" type="date" name="dataInicio" required value="" pattern="yyyy-MM-dd">
                    <label>Até: </label>
                    <input  class="form-control mb-3" type="date" name="dataFim" required value="" pattern="yyyy-MM-dd">
                    <div style="padding-left: 15%">
                        <input class="btn btn-primary" type="submit" value="Gerar Relatório"></a>
                    </div>
                </form> 
            </div>
        </c:if>
        <c:import  url="templates/footer.jsp"/>
    </body>
</html>
