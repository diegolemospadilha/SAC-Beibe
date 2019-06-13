<%@ page errorPage="erro.jsp" %>
<%@include file="../templates/validationLoginBean.jsp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="../templates/head.jsp"/>
        <c:choose>
            <c:when test="${categoria.idCategoria == null}">
                <c:set var="ac" value="new" />
            </c:when>   
            <c:otherwise>
                <c:set var="ac" value="update" />
            </c:otherwise>
        </c:choose>
    </head>
    <body>
        <jsp:include page="../templates/nav.jsp"/>

        <div class='container col-md-6'>
            <div class='align-self-center m-5'>
                <h2 class='text-center col-12-md' style='color:#000'>Portal Servlet</h2>
            </div>
        </div>

        <div class="row">


            <div class="col-sm-6">
                <div class='text-center'> 
                    <h4>Categorias cadastradas no sistema</h4>
                </div></br>

                <c:choose>
                    <c:when test="${empty listaCategorias}" >
                        <div class="text-center">
                            <p class="m-5">O sistema não possui categorias cadastrados no momento. Se desejar cadastre um novo cliente agora mesmo!</p>  
                        </div>    
                    </c:when>
                    <c:otherwise>

                        <table class='table text-center'>    
                            <tr>
                                <th>id Categoria</th>
                                <th>Nome da categoria</th>
                                <th>Editar/Excluir</th>
                            </tr>

                            <c:forEach items="${requestScope.listaCategorias}" var="c">
                                <tr>
                                    <td><c:out value="${c.idCategoria}"/></td>
                                    <td><c:out value="${c.nomeCategoria}"/></td>
                                    <td>                                                
                                        <a class="button" href="CategoriaServlet?action=formUpdate&id=${c.idCategoria}" class="mr-3"><button><i class="far fa-edit fa-2x"></button></i></a>
                                        <a href="#" data-toggle="modal" data-target="#myModal"><button onclick="deleteId(${c.idCategoria})"><i class="far fa-trash-alt fa-2x"></i></button></a>          
                                    </td>
                                </tr>
                            </c:forEach>
                        </table>

                    </c:otherwise> 
                </c:choose>

                <div class="d-flex justify-content-center">
                    <a href='CategoriaServlet?action=formNew' class='btn btn-primary'>Cadastrar Categoria</a>
                </div>
            </div>
            <c:if test="${showDiv== 'new' || showDiv== 'update' }">
                <div class="ml-5 col-sm-4">
                    <div class="text-center">
                        <p><c:out value="${(ac == \"update\") ? \"Atualize sua categoria\" : \"Insira aqui uma nova categoria\"}"/></p>
                    </div> 

                    <form action="CategoriaServlet?action=${ac}" method="POST">
                        <i class="far fa-calendar-alt p-2"></i> <label>Nome da categoria : </label>
                        <input  class="form-control mb-3" type="text" name="nomeCategoria" required value="${categoria.nomeCategoria}">
                        <input type="text" name="id" value="${categoria.idCategoria}" hidden>
                        <div class="d-flex justify-content-center mt-5">
                            <a href="CategoriaServlet?action=list" class="btn btn-danger w-25 mr-3" type="submit">Cancelar</a>
                            <input class="btn btn-primary w-25 ml-3" type="submit" value="<c:out value="${(ac == \"update\") ? \"Update\" : \"Cadastrar\"}"/>"> 
                        </div> 
                    </form>
                </div>
            </c:if>
        </div>

        <c:if test="${!empty msg}">
            <div style="margin-left: 37%" class=" w-25 d-flex justify-content-center alert alert-success alert-dismissible fade show" role="alert">
                <strong><c:out value="${msg}"/> </strong>
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>

        </c:if>

        <jsp:include page="../templates/modalRemove.jsp"/>

        <jsp:include page="../templates/footer.jsp"/>
    </body>
</html>
<script>
    function deleteId(numero)
    {
        $("#save").click(function () {
            var idCategoria = numero;

            var id = "action=remove" + "&id=" + idCategoria;
            $('#myModal').modal('hide');
            $.ajax({
                type: "GET",
                url: "CategoriaServlet",
                data: id,
                success: function (result) {
                    location.reload();

                },
                error: function (error) {
                    console.log("error" + error);
                }
            });
        });
    }
</script>
