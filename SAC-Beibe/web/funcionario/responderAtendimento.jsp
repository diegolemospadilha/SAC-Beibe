<%@ page errorPage="erro.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
    <head><jsp:include page="../templates/head.jsp"/></head>
    <body>
        <jsp:include page="../templates/nav.jsp" />

        <div class='container'>
            <div class='text-center m-5'>
                <h4>Dados do atendimento</h4>
            </div>
        </div>


        <div class=' row d-flex justify-content-center'>
            <form action="AtendimentoServlet?action=resp&id=${atendimento.idAtendimento}" method="Post">
                <table class="table ">
                    <tr>
                       <td><c:out value="Id do atendimento:"/></td>
                       <td ><c:out value="${atendimento.idAtendimento}"/></td>
                    </tr>
                    <tr>
                        <td><c:out value="Data de atendimento :"/></td>
                        <td>
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
                        <td><c:out value="Nome do cliente:"/></td>
                        <td><c:out value="${atendimento.usuario.nomeUsuario}"/></td>
                    </tr>
                    <tr>
                        <c:if test="${loginBean.tipoUsuario == 'Funcionario'}">
                            <td><c:out value="${(atendimento.situacao == \"S\") ? \"Solução Apresentada\" : \"Responder Cliente\"}"/></td>
                            <c:if test="${atendimento.situacao == 'N'}">
                                <td><textarea class="form-control" id="exampleTextarea" name="solucao" rows="3"></textarea></td>
                            </c:if>
                            <c:if test="${atendimento.situacao == 'S'}">
                                 <td> <c:out value="${atendimento.solucaoApresentada}"/> </td> 
                            </c:if>
                            
                        </c:if>
                        <c:if test="${loginBean.tipoUsuario == 'Gerente'}">
                            <td><c:out value="Solução Apresentada p/ atendimento"/></td>
                            <td> <c:out value="${atendimento.solucaoApresentada}"/> </td>
                        </c:if>
                    </tr>
                </table>

                <div class="d-flex justify-content-center">
                    <a href='AtendimentoServlet?action=listarAbertos' class='btn btn-danger col-md-4 ml-2'>Voltar</a>
                    <c:if test="${atendimento.situacao == 'N'}">
                        <c:if test="${loginBean.tipoUsuario == 'Funcionario'}">
                            <input type="submit" class='btn btn-primary col-md-4 ml-2' id="idAtendimento"  value=" Enviar">
                        </c:if>
                    </c:if>
                </div>
            </form>
        </div>
        <jsp:include page="../templates/footer.jsp" />
    </body>
</html>
