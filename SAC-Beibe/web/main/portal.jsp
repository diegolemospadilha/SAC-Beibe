<%@ page errorPage="erro.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="../templates/head.jsp"/>
    </head>
    <body>
        <jsp:include page="../templates/nav.jsp"/>

        <div class='container col-md-6 mb-5'>
            <div class='align-self-center m-5'>
                <h2 class='text-center col-12-md' style='color:#000'>Bem vindo ao Sistema de Atendimento SAC-BEIBE</h2>
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
        
        <c:if test="${loginBean.tipoUsuario = 'Gerente'}">
            <div class="d-flex justify-content-center m-5">
                   
            </div>
            
        </c:if>
        <
        <jsp:include page="../templates/footer.jsp"/>
    </body>
</html>