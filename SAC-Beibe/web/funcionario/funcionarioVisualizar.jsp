<%@ page errorPage="erro.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<!DOCTYPE html>
<html>
    <head><jsp:include page="../templates/head.jsp"/></head>
    <body>
    
        <jsp:include page="../templates/nav.jsp"/>
           
        <div class='container col-md-6'>
            <div class='align-self-center m-5'>
               <h2 class='text-center col-12-md' style='color:#000'>Portal Servlet</h2>
            </div>
        </div>
        
        <div class='text-center m-5'> 
            <h4>Dados do funcionario</h4>
        </div>
        
        <div class='container d-flex justify-content-center'>
            <table class="table w-50 mb-3">
                <tr>
                    <td><c:out value="Id :"/></td> 
                    <td><c:out value="${funcionario.idUsuario}"/></td> 
                </tr>
                <tr>
                    <td><c:out value="Nome :"/></td> 
                    <td><c:out value="${funcionario.nomeUsuario}"/></td> 
                </tr> 
                 <tr>
                    <td><c:out value="CPF :"/></td> 
                    <td><c:out value="${funcionario.cpf}"></c:out></td> 
                </tr>
                 <tr>
                    <td><c:out value="Email :"/></td> 
                    <td><c:out value="${funcionario.email}"/></td> 
                </tr>
                <tr>
                    <td><c:out value="Telefone do funcionário :"/></td> 
                    <td><c:out value="${funcionario.telefone}"/></td> 
                </tr>
                <tr>
                    <td><c:out value="Rua do Cliente :"/></td> 
                    <td><c:out value="${funcionario.nomeRua}"/></td> 
                </tr>
                <tr>
                    <td><c:out value="Número :"/></td> 
                    <td><c:out value="${funcionario.numeroRua}"/></td> 
                </tr>
                <tr>
                    <td><c:out value="Complemento :"/></td> 
                    <td><c:out value="${funcionario.complemento}"/></td> 
                </tr>
                <tr>
                    <td><c:out value="Bairro:"/></td> 
                    <td><c:out value="${funcionario.bairro}"/></td> 
                </tr>
                <tr>
                    <td><c:out value="CEP :"/></td> 
                    <td><c:out value="${funcionario.cep}"/></td> 
                </tr>
                <tr>
                    <td><c:out value="Cidade :"/></td> 
                    <td><c:out value="${funcionario.cidade.nomeCidade}"/></td> 
                </tr>
                 <tr>
                    <td><c:out value="UF :"/></td> 
                    <td><c:out value="${funcionario.cidade.estado.sigla}"/></td> 
                </tr> 
            </table>
        </div>
                    
         <div class="d-flex justify-content-center">
             <a href='FuncionarioServlet?action=list' class='btn btn-primary col-md-1 ml-2' style='float: right; '>Voltar</a>
         </div>
            <jsp:include page="../templates/footer.jsp"/>
    </body>
</html>