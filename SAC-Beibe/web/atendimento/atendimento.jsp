<%@ page errorPage="erro.jsp" %>
<%@include file="../templates/validationLoginBean.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="../templates/head.jsp"/>
    </head>
    <body>

        <jsp:include page="../templates/nav.jsp" />

        <div class="container mt-5">
            <div class="container mt-5">
                <div class="d-flex justify-content-center m-5">
                    <h4>Cadastro de Atendimento</h4>
                </div>
            </div>

            <div class="col-12 m-5">
                <form action="AtendimentoServlet?action=new" method="POST">
                    <i class="fas fa-user p-2"></i><label for="tipoAtendimento"> Selecione o tipo de atendimento:</label>
                    <select id="tipoAtendimento" name="tipoAtendimento" class="form-control">
                        <option selected="selected">Selecione o tipo de Atendimento</option>
                        <c:forEach var="tipoAtendimento" items="${listaTiposAtendimentos}">
                            <option value="${tipoAtendimento.idTipoAtendimento }">${tipoAtendimento.nomeTipoAtendimento}</option>
                        </c:forEach>
                    </select></br>

                    <i class="fas fa-tag p-2"></i><label for="produto"> Selecione o tipo de produto:</label>
                    <select id="produto" name="produto" class="form-control">
                        <option selected="selected">Selecione o tipo de Produto</option>
                        <c:forEach var="produto" items="${listaProdutos}">
                            <option value="${produto.idProduto}">${produto.nomeProduto}</option>
                        </c:forEach>
                    </select></br>


                    <i class="fas fa-user p-2"></i><label for="descricao"> Informe a descrição do atendimento:</label>
                    <textarea class="form-control mb-3" name="descricao" rows="4" cols="50" required minlength="10" maxlength="255"></textarea>


                    <jsp:useBean id="data" class="java.util.Date"/>
                    <i class="far fa-clock p-2"></i><label for="dataAtendimento"> Hora do atendimento: </label>
                    <input type="datetime" name="dataAtendimento" readonly="true" class="form-control" value="<fmt:formatDate value="${data}" pattern="dd/MM/yyyy HH:mm"/>"/>

                    <div class="d-flex justify-content-center mt-5" style="margin-bottom: 150px;">
                        <a href="/SAC-Beibe/main/index.jsp" class="btn btn-danger w-25 mr-3"  value="Cancelar"> Cancelar</a>
                        <input class="btn btn-primary w-25 mr-3" type="submit" value="Salvar"></a>
                    </div>
                </form>
            </div>

        </div>
        <jsp:include page="../templates/footer.jsp" />
    </body>
</html>
