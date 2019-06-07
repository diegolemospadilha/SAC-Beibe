<%@ page errorPage="erro.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
    <head><jsp:include page="../templates/head.jsp"/></head>
    <body>
        <jsp:include page="../templates/nav.jsp" />

        <jsp:useBean id="loginBean" class="com.ufpr.tads.web2.beans.LoginBean" scope="session"/>

        <div class='container col-md-6'>
            <div class='align-self-center m-5'>
                <h2 class='text-center col-12-md' style='color:#000'>Portal Servlet</h2>
            </div>
        </div>

        <div class='text-center'> 
            <h4>Dados do atendimento</h4>
        </div>

        <div class='container mt-5 d-flex justify-content-center'>
            <table class="table w-50">
                <tr>
                    <td><c:out value="Id :"/></td> 
                    <td><c:out value="${atendimento.idAtendimento}"/></td> 
                </tr>
                <tr>
                    <td><c:out value="Data de atendimento :"/></td> 
                    <td><fmt:formatDate value="${atendimento.dataConvertida}" pattern="dd/MM/yyyy HH:mm"/></td> 
                </tr> 
                <tr>
                    <td><c:out value="Status Atendimento :"/></td> 
                    <td><c:out value="${atendimento.respAtendimento}"></c:out></td> 
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
                    <td><c:out value="Nome do Atendente:"/></td> 
                    <td><c:out value="${atendimento.usuario.name}"/></td> 
                </tr>
                <tr>
                    <td><c:out value="Nome do cliente:"/></td> 
                    <td><c:out value="${atendimento.cliente.nome}"/></td> 
                </tr>
            </table>
        </div>

        <div class="d-flex justify-content-center">
            <a href='AtendimentoServlet?action=list' class='btn btn-primary col-md-1 ml-2' style='float: right; '>Voltar</a>
        </div>

        <jsp:include page="../templates/footer.jsp" />

    </body>
</html>