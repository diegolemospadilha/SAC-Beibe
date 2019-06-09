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

        <div class='container mt-5 d-flex justify-content-center'>
            <table class="table w-50">
                <tr>
                    <td><c:out value="Id :"/></td>
                    <td><c:out value="${atendimento.idAtendimento}"/></td>
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
                    <td><c:out value="Solução apresentada"/></td>
                    <td><c:out value="${atendimento.solucaoApresentada}"/></td>
                </tr>


            </table>
        </div>

        <div class="d-flex justify-content-center">
            <a href='AtendimentoServlet?action=list' class='btn btn-primary col-md-1 ml-2' style='float: right; '>Voltar</a>

            <c:if test="${atendimento.situacao == 'N'}">
                <a href="#" data-toggle="modal"data-target="#myModal" >
                    <button   class='btn btn-danger ml-2 ' id="idAtedimento" value="${atendimento.idAtendimento}"  >
                        Delete
                    </button></a>
                </c:if>
        </div>

        <jsp:include page="../templates/footer.jsp" />
        <jsp:include page="../cliente/delAtendimento.jsp" />

    </body>
</html>

<script>
    $("#save").click(function() {

        var idAtedimento = $("#idAtedimento").val();
        var id = "action=remove" + "&id=" + idAtedimento;

        $('#myModal').modal('hide');
        $.ajax({
            type: "GET",
            url: "AtendimentoServlet",
            data: id,
            success: function(result) {
                window.location.replace("/SAC-Beibe/AtendimentoServlet?action=list");
            },
            error: function(error) {
                console.log("error" + error);
            }
        });
    });</script>
