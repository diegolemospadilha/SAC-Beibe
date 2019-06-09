<%@ page errorPage="erro.jsp" %>
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
                        <h4>Atendimentos em Aberto</h4>
                        <h2 class='text-center' style='color:#000'>Portal Servlet</h2>
                        <c:if test="${empty atendimentosEmAberto}">
                            <h2>Nâo há atendimentos</h2>
                        </c:if>
                    </div>
                </div>



                <div class="col-md-12 col-md-offset-2">

                    <div class='d-flex justify-content-center m-5'>
                        <c:if test="${!empty atendimentosEmAberto}">
                            <table class=' table  text-center'>
                                <tr>
                                    <th>Data/hora</th>
                                    <th>Produto</th>
                                    <th>Nome</th>
                                    <th>Detalhes Atendimento</th>
                                </tr>
                                <c:forEach items="${atendimentosEmAberto}" var="atendimento">
                                    <tr style="${atendimento.prioridade eq 1 ? 'background-color:#ff3b3b' : 'background-color :#ffff73  '}"  >
                                        <td><fmt:parseDate value="${ atendimento.dataHoraAtendimento }" pattern="yyyy-MM-dd'T'HH:mm" var="parsedDateTime" type="both" />
                                            <fmt:formatDate pattern="dd.MM.yyyy HH:mm" value="${ parsedDateTime }" />
                                        </td>
                                        <td><c:out value="${atendimento.produto.nomeProduto}" /></td>
                                        <td><c:out value="${atendimento.usuario.nomeUsuario}"/></td>
                                        <td>
                                            <a  class="mr-3" href="AtendimentoServlet?action=showFunc&id=${atendimento.idAtendimento}"><button><i class="fas fa-comment-dots fa-2x"></i></button></a>
                                        </td>
                                    </tr>

                                </c:forEach>
                            </table>
                        </c:if>

                    </div>
                </div>
            </div>
        </div>
        <div>
            <jsp:include page="../templates/footer.jsp" />
        </div>

    </body

</html>
