<%@ page errorPage="erro.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="../templates/head.jsp"/>
        <script src="js/getCidades.js" type="text/javascript"></script>
      
        <c:if test="${empty loginBean}">
            <jsp:forward page="../index.jsp">
                <jsp:param name="msg" value="${'erro'}" />
            </jsp:forward>

        </c:if>
        <c:choose>
            <c:when test="${cliente.idCliente == null}">
                <c:set var="ac" value="new" />
            </c:when>   
            <c:otherwise>
                <c:set var="ac" value="update" />
            </c:otherwise>
        </c:choose>
    </head> 
    <body>
         <jsp:include page="../templates/nav.jsp"/>
         
        <div class="container mt-5">
            <div class="d-flex justify-content-center">
              <h4><c:out value="${(ac == \"update\") ? \"Formulário de Edição de Cliente\" : \"Formulário de Cadastro de novo Cliente\"}"/></h4>
            </div>

            <div class="col-12 d-flex justify-content-center">
                <div class="col-12">

                    <form class="w-100" action="ClienteServlet?action=${ac}" method="POST">

                        <i class="fas fa-user p-2"></i><label > Nome do cliente: </label>
                        <input class="form-control mb-3" type="text" name="name" required value="${cliente.nome}"/>

                        <i class="fas fa-passport p-2"></i><label> CPF do cliente : </label>
                        <input  class="form-control mb-3 cpf" type="text" name="cpf" required value="${cliente.cpf}"/>

                        <i class="fas fa-envelope p-2"></i> <label> Email do cliente : </label>
                        <input  class="form-control mb-3 email" type="text" name="email" required value="${cliente.email}"/>

                        <i class="fas fa-envelope p-2"></i> <label> Senha : </label>
                        <input  class="form-control mb-3 email" type="password" name="passwd" required  minlength="8" maxlength="8" value="${cliente.passwd}"/>

                        <i class="fas fa-envelope p-2"></i> <label> Confirme a senha : </label>
                        <input  class="form-control mb-3 email" type="password" name="conf_passwd" minlength="8" maxlength="8" required value="${cliente.confPasswd}"/>

                        <i class="fas fa-birthday-cake p-2"></i> <label>Data de nascimento : </label>
                        <input  class="form-control mb-3" type="date" name="dataNasc" required  value="${cliente.dataNascimento}" pattern="dd/MM/yyyy">

                        <i class="fas fa-road p-2"></i> <label> Endereço : </label>
                        <input  class="form-control mb-3" type="text" name="endereco" required value="${cliente.rua}">

                        <i class="fas fa-unlock p-2"></i> <label> Número : </label>
                        <input  class="form-control mb-3" type="text" name="nrua" required value="${cliente.numeroRua}">

                        <i class="fas fa-map-marker-alt p-2"></i> <label> CEP : </label>
                        <input  class="form-control mb-3 cep" type="text" name="cep" required value="${cliente.cep}">

                        <i class="fas fa-flag p-2"></i> <label> UF : </label>

                        <select id="estado" name="estado" class="form-control">
                            <option selected="selected">Selecione um estado</option>
                            <c:forEach var="estado" items="${estados}">
                                <option <c:out value="${(cliente.cidade.estado.idEstado == estado.idEstado) ? \"selected\" : \"\" }"/> value="<c:out value="${estado.idEstado}"/>"><c:out value="${estado.nomeEstado}"/></option>
                            </c:forEach>
                        </select></br>


                        <i class="fas fa-city p-2"></i> <label> Cidade : </label>
                        <select  class="form-control mb-3" type="text" id="cidade" name="cidade">
                            <option selected value="<c:out value="${cliente.cidade.idCidade}"/>"><c:out value="${cliente.cidade.nomeCidade}"/></option
                        </select></br>
                        <input type="text" name="id" value="${cliente.idCliente}" hidden>

                        <div class="d-flex justify-content-center" style="margin-bottom: 150px;">
                            <a href="ClienteServlet" class="btn btn-danger w-25 mr-3" type="submit">Cancelar</a>
                            <c:if test="${cliente.idCliente==null}">
                                <c:set var="valueButton" value="Save" />

                            </c:if>
                            <c:if test="${cliente.idCliente!=null}">
                                <c:set var="valueButton" value="Update" />
                            </c:if>

                            <input class="btn btn-primary w-25 ml-3" type="submit" value="${valueButton}"> 

                        </div>             
                    </form>
                </div> 
            </div> 
        </div>

        <jsp:include page="../templates/footer.jsp"/>
    </body>
</html>
