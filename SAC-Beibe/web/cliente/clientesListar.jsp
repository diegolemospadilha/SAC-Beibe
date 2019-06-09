<%@ page errorPage="erro.jsp" %>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="../templates/head.jsp"/>
    </head>
    <body>
        <jsp:include page="../templates/nav.jsp"/>

        <div class='container col-md-6'>
            <div class='align-self-center m-5'>
                <h2 class='text-center col-12-md' style='color:#000'>Portal Servlet</h2>
            </div>
        </div>

        <div class='text-center'> 
            <h4>Clientes cadastrados no sistema</h4>
        </div>
        
        <c:choose>
                <c:when test="${empty listaClientes}" >
                    <div class="text-center">
                         <p class="m-5">O sistema não possui clientes cadastrados no momento. Se desejar cadastre um novo cliente agora mesmo!</p>  
                    </div>    
                </c:when>
            <c:otherwise>
                    <div class='d-flex justify-content-center m-5'>
                        <table class='table w-50 text-center'>    
                            <tr>
                                <th>id Cliente</th>
                                <th>Nome do cliente</th>
                                <th>CPF</th>
                                <th>Email</th>
                                <th>Ver/Editar/Excluir</th>
                            </tr>

                            <c:forEach items="${requestScope.listaClientes}" var="cliente">
                                <tr>
                                    <td><c:out value="${cliente.idCliente}"/></td>
                                    <td><c:out value="${cliente.nome}"/></td>
                                    <td><c:out value="${cliente.cpf}"/></td>
                                    <td><c:out value="${cliente.email}"/></td>

                                    <td> 
                                        <a class="button" href="ClienteServlet?action=show&id=${cliente.idCliente}" class="mr-3"><button><i class="far fa-eye fa-2x"></i></button></a>
                                        <a class="button" href="ClienteServlet?action=formUpdate&id=${cliente.idCliente}" class="mr-3"><button><i class="far fa-edit fa-2x"></button></i></a>
                                        <a href="#" data-toggle="modal" data-target="#myModal" ><button id="idCliente" value="${cliente.idCliente}"  ><i class="far fa-trash-alt fa-2x"></i></button></a> 
                                    </td>
                                </tr>
                            </c:forEach>
                        </table>
                    </div>
            </c:otherwise> 
        </c:choose>
        
        <div class="d-flex justify-content-center">
            <a href='ClienteServlet?action=formNew' class='btn btn-primary col-md-1 ml-2' style='float: right; '>Cadastrar User</a>
        </div>

        <jsp:include page="../templates/modalRemove.jsp"/>
        
        <jsp:include page="../templates/footer.jsp"/>
    </body>
</html>
<script>
$("#save").click(function () {
    var idCliente = $("#idCliente").val();
    var id = "action=remove" + "&id=" + idCliente;
    console.log(id);
    $('#myModal').modal('hide');
    $.ajax({
        type: "GET",
        url: "ClienteServlet",
        data: id,
        success: function (result) {
            location.reload();

        },
        error: function (error) {
            console.log("error" + error);
        }
    });
});</script>