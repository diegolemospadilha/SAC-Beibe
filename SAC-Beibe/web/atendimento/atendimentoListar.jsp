<%@ page errorPage="erro.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
    <head><jsp:include page="../templates/head.jsp"/></head>
    <body>
        <jsp:include page="../templates/nav.jsp" />

        <div class='container col-md-6'>
            <div class='align-self-center m-5'>
                <h2 class='text-center col-md-12' style='color:#000'>Portal Servlet</h2>
            </div>
        </div>

        <div class='text-center'> 
            <h4>Atendimentos cadastrados</h4>
        </div>

        <div class='d-flex justify-content-center m-5'>
            
            <c:choose>
                <c:when test="${empty listaAtendimentos}" >
                    <div class="">
                         <p class="m-5">Você não possui atendimentos cadastrados no momento. Se desejar cadastre um novo atendimento agora mesmo!</p>
                         <a style="margin-left: 40%" class="btn btn-primary" href="AtendimentoServlet?action=create">Cadastrar Atendimento</a>
                     </div>    
                </c:when>
                <c:otherwise>
                   <table class=' table w-50 text-center'>    
                        <tr>
                            <th>Data/hora</th>
                            <th>Produto</th>
                            <th>Nome</th>
                            <th>Detalhes Atendimento</th>
                        </tr>

                        <c:forEach items="${requestScope.listaAtendimentos}" var="atendimento">
                            <tr id="listCliente">
                                <td><fmt:formatDate value="${atendimento.dataConvertida}" pattern="dd/MM/yyyy"/></td>
                                <td><c:out value="${atendimento.produto.nomeProduto}" /></td>
                                <td><c:out value="${atendimento.cliente.nome}"/></td>
                                <td>    
                                    <a  class="mr-3" href="AtendimentoServlet?action=show&id=${atendimento.idAtendimento}"><button><i class="far fa-eye fa-2x"></i></button></a>
                                </td>
                            </tr>
                        </c:forEach>
                    </table>       
                </c:otherwise>
            </c:choose>
   
        </div>

        <jsp:include page="../templates/footer.jsp" />
    </body>
</html>
