<%@ page errorPage="erro.jsp" %>
<%@include file="../templates/validationLoginBean.jsp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
    <head><jsp:include page="../templates/head.jsp"/></head>
    <body>
        <jsp:include page="../templates/nav.jsp" />
        <div class="container">
            <div class="row">

                <div class='container col-md-6 text-center'>
                    <div class='align-self-center m-5'>
                        <h4>Todos os atendimentos realizados até o momento</h4>
                        <c:if test="${empty todosAtendimentos}">
                            <h2>Não há atendimentos</h2>
                        </c:if>
                    </div>
                </div>

                <div class="col-md-12 col-md-offset-2">
                    <div class='d-flex justify-content-center m-5'>
                        <c:if test="${!empty todosAtendimentos}">
                            <table class=' table  text-center'>
                                <tr>
                                    <th>Data/hora</th>
                                    <th>Produto</th>
                                    <th>Nome do cliente</th>
                                    <th>Descrição</th>
                                     <c:if test="${loginBean.tipoUsuario == 'Funcionario'}">
                                       <th>Detalhes Atendimento</th>
                                     </c:if>
                                </tr>
                                <c:forEach items="${todosAtendimentos}" var="atendimento">
                                    <tr style="${atendimento.prioridade eq 1 and atendimento.situacao eq 'N' ? 'background-color:#ff3b3b' : 'background-color :#ffff73  '}" >
                                        <td id="dataAbertura"><fmt:parseDate value="${ atendimento.dataHoraAtendimento }" pattern="yyyy-MM-dd'T'HH:mm" var="parsedDateTime" type="both" />
                                            <fmt:formatDate pattern="dd.MM.yyyy HH:mm" value="${ parsedDateTime }" />
                                        </td>
                                        <td><c:out value="${atendimento.produto.nomeProduto}" /></td>
                                        <td><c:out value="${atendimento.usuario.nomeUsuario}"/></td>
                                        <td><c:out value="${atendimento.descricaoAtendimento}"/></td>
                                        <td>
                                            <c:if test="${loginBean.tipoUsuario == 'Funcionario'}">
                                                <a class="mr-3" href="AtendimentoServlet?action=showFunc&id=${atendimento.idAtendimento}"><button><i class="fas fa-comment-dots fa-2x"></i></button></a>
                                            </c:if>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </table>
                        </c:if>
                    </div>
                </div>
            </div>
        </div>
        <c:if test="${!empty msg}">
            <div style="margin-left: 37%" class=" w-25 d-flex justify-content-center alert alert-success alert-dismissible fade show" role="alert">
                <strong><c:out value="${msg}"/> </strong>
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>

        </c:if>
        <div>
            <jsp:include page="../templates/footer.jsp" />
        </div>
    </body
</html>

