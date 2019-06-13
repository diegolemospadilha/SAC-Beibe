<%@ page errorPage="erro.jsp" %>
<%@include file="../templates/validationLoginBean.jsp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="../templates/head.jsp"/>
        <c:choose>
            <c:when test="${produto.idProduto == null}">
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
                <h4>Produtos cadastradas no sistema</h4>
             </div></br>

            <c:choose>
                    <c:when test="${empty listaProdutos}" >
                        <div class="text-center">
                             <p class="m-5">O sistema não possui produtos cadastrados no momento. Se desejar cadastre um novo cliente agora mesmo!</p>  
                        </div>    
                    </c:when>
            <c:otherwise>
                        
                            <table class='table text-center'>    
                                <tr>
                                    <th>id Produto</th>
                                    <th>Nome do produto</th>
                                    <th>Peso em kg/litro</th>
                                    <th>Categoria</th>
                                    <th>Editar/Excluir</th>
                                </tr>

                                <c:forEach items="${requestScope.listaProdutos}" var="p">
                                    <tr>
                                        <td><c:out value="${p.idProduto}"/></td>
                                        <td><c:out value="${p.nomeProduto}"/></td>
                                        <td><c:out value="${p.pesoProduto}"/></td>
                                        <td><c:out value="${p.categoria.nomeCategoria}"/></td>
                                        <td>
                                            <a class="button" href="ProdutoServlet?action=formUpdate&id=${p.idProduto}" class="mr-3"><button><i class="far fa-edit fa-2x"></button></i></a>
                                            <a href="#" data-toggle="modal" data-target="#myModal" ><button onclick="deleteId(${p.idProduto})"><i class="far fa-trash-alt fa-2x"></i></button></a> 
                                        </td>
                                    </tr>
                                </c:forEach>
                            </table>
                      
                </c:otherwise> 
            </c:choose>

            <div class="d-flex justify-content-center">
                <a href='ProdutoServlet?action=formNew' class='btn btn-primary'>Cadastrar Produto</a>
            </div>
        </div>
        <c:if test="${showDiv== 'new' || showDiv== 'update' }">
            <div class="ml-5 col-sm-4">
                <div class="text-center">
                    <p><c:out value="${(ac == \"update\") ? \"Atualize seu produto\" : \"Insira aqui um novo produto\"}"/></p>
                </div> 
                   
                <form action="ProdutoServlet?action=${ac}" method="POST">
                    <i class="far fa-calendar-alt p-2"></i> <label>Nome do produto : </label>
                    <input  class="form-control mb-3" type="text" name="nome_produto" required value="${produto.nomeProduto}">
                    <i class="far fa-calendar-alt p-2"></i> <label>Peso do produto : </label>
                    <input  class="form-control mb-3" type="text" name="peso_produto" required value="${produto.pesoProduto}">
                    <select id="estado" name="categoria_produto" class="form-control">
                        <option selected="selected">Selecione uma categoria</option>
                        <c:forEach var="c" items="${listaCategorias}">
                             <option <c:out value="${(produto.categoria.idCategoria == c.idCategoria) ? \"selected\" : \"\" }"/> value="<c:out value="${c.idCategoria}"/>"><c:out value="${c.nomeCategoria}"/></option>
                         </c:forEach>
                    </select></br>
                    <input type="text" name="id" value="${produto.idProduto}" hidden>
                    <div class="d-flex justify-content-center mt-5">
                        <a href="ProdutoServlet?action=list" class="btn btn-danger w-25 mr-3" type="submit">Cancelar</a>
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

        $("#save").click(function() {
            var idProduto = numero;

            var id = "action=remove" + "&id=" + idProduto;
            $('#myModal').modal('hide');
            $.ajax({
                type: "GET",
                url: "ProdutoServlet",
                data: id,
                success: function(result) {
                    location.reload();

                },
                error: function(error) {
                    console.log("error" + error);
                }
            });
        });
    }
</script>

