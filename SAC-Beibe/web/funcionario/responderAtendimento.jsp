<%@ page errorPage="erro.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
    <head><jsp:include page="../templates/head.jsp"/></head>
    <body>
        <jsp:include page="../templates/nav.jsp" />

        <jsp:useBean id="loginBean" class="com.beibe.sac.beans.LoginBean" scope="session"/>

        <div class='container col-md-6'>
            <div class='align-self-center m-5'>
                <h2 class='text-center col-12-md' style='color:#000'>Portal Servlet</h2>
            </div>
        </div>

        <div class='text-center'>
            <h4>Dados do atendimento</h4>
        </div>

        <div class=' row d-flex justify-content-center'>
            <form action="AtendimentoServlet?action=resp&id=${atendimento.idAtendimento}" method="Post">

                <table class="table ">
                    <tr>
                        <td><c:out value="Id :"/></td>
                        <td ><c:out value="${atendimento.idAtendimento}"/></td>
                    </tr>
                    <tr>
                        <td><c:out value="Data de atendimento :"/></td>
                        <td>cliente
                            <fmt:parseDate value="${ atendimento.dataHoraAtendimento }" pattern="yyyy-MM-dd'T'HH:mm" var="parsedDateTime" type="both" />
                            <fmt:formatDate pattern="dd.MM.yyyy HH:mm" value="${ parsedDateTime }" />

                        </td>
                    </tr>
                    <tr>
                        <td><c:out value="Status Atendimento :"/></td>
                        <td><c:out value="${atendimento.situacao}"></c:out></td>
                        </tr>
                        <tr>
                            <td><c:out value="Descrição :"/></td>
                        <td><c:out value="${atendimento.descricaoAtendimento}"/></td>
                    </tr>
                    <tr>
                        <td><c:out value="Tipo de atendimento :"/></td>
                        <td><c:out value="${atendimento.tipoAtendimento.nomeTipoAtendimento}"/></td>
                    </tr>
                    <tr>
                        <td><c:out value="Produto :"/></td>
                        <td><c:out value="${atendimento.produto.nomeProduto}"/></td>
                    </tr>
                    <tr>
                        <td><c:out value="Nome do cliente"/></td>
                        <td><c:out value="${atendimento.usuario.nomeUsuario}"/></td>
                    </tr>
                    <tr>
                        <c:if test="${loginBean.tipoUsuario == 'Funcionario'}">
                            <td><c:out value="Responder Cliente"/></td>
                            <td>  <textarea class="form-control" id="exampleTextarea" name="solucao"  rows="3"></textarea></td>
                            </c:if>
                            <c:if test="${loginBean.tipoUsuario == 'Gerente'}">
                            <td><c:out value="Responder Cliente"/></td>
                            <td> <c:out value="${atendimento.solucaoApresentada}"/> </td>
                        </c:if>

                    </tr>


                </table>

                <div class="d-flex justify-content-center">
                    <a href='AtendimentoServlet?action=listAberto' class='btn btn-primary col-md-4 ml-2' style='float: right; '>Voltar</a>

                    <c:if test="${atendimento.situacao == 'N'}">
                        <c:if test="${atendimento.usuario.tipoUsuario == 'Funcionario'}">

                            <input  type="submit" class='btn btn-secondary ml-2 ' id="idAtedimento"  value=" Enviar"  >
                        </c:if>
                    </c:if>


                </div>
            </form>
        </div>

        <jsp:include page="../templates/footer.jsp" />

    </body>
</html>
