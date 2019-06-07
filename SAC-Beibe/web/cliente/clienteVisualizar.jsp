<%@ page errorPage="erro.jsp" %>
<%@page import="java.util.List"%>
<%@page import="com.ufpr.tads.web2.beans.Cliente"%>
<%@page import="com.ufpr.tads.web2.beans.User"%>
<%@page import="com.ufpr.tads.web2.DAO.ClienteDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head><jsp:include page="../templates/head.jsp"/></head>
    <body>
    
        <jsp:include page="../templates/nav.jsp"/>
           
        <jsp:useBean id="loginBean" class="com.ufpr.tads.web2.beans.LoginBean" scope="session"/>
        <div class='container col-md-6'>
            <div class='align-self-center m-5'>
               <h2 class='text-center col-12-md' style='color:#000'>Portal Servlet</h2>
            </div>
        </div>
        
        <div class='text-center m-5'> 
            <h4>Dados do cliente</h4>
        </div>
        
        <div class='container d-flex justify-content-center'>
            <table class="table w-50 mb-3">
                <tr>
                    <td><c:out value="Id :"/></td> 
                    <td><c:out value="${cliente.idCliente}"/></td> 
                </tr>
                <tr>
                    <td><c:out value="Nome :"/></td> 
                    <td><c:out value="${cliente.nome}"/></td> 
                </tr> 
                 <tr>
                    <td><c:out value="CPF :"/></td> 
                    <td><c:out value="${cliente.cpf}"></c:out></td> 
                </tr>
                 <tr>
                    <td><c:out value="Email :"/></td> 
                    <td><c:out value="${cliente.email}"/></td> 
                </tr>
                <tr>
                    <td><c:out value="Data de Nascimento do Cliente :"/></td> 
                    <td><fmt:formatDate value="${cliente.dataConvertida}" pattern="dd/MM/yyyy"/></td> 
                </tr>
                <tr>
                    <td><c:out value="Rua do Cliente :"/></td> 
                    <td><c:out value="${cliente.rua}"/></td> 
                </tr>
                <tr>
                    <td><c:out value="NÃºmero :"/></td> 
                    <td><c:out value="${cliente.numeroRua}"/></td> 
                </tr>
                <tr>
                    <td><c:out value="CEP :"/></td> 
                    <td><c:out value="${cliente.cep}"/></td> 
                </tr>
                <tr>
                    <td><c:out value="Cidade :"/></td> 
                    <td><c:out value="${cliente.cidade.nomeCidade}"/></td> 
                </tr>
                 <tr>
                    <td><c:out value="UF :"/></td> 
                    <td><c:out value="${cliente.cidade.estado.sigla}"/></td> 
                </tr> 
            </table>
        </div>
                    
         <div class="d-flex justify-content-center">
             <a href='ClienteServlet?action=list' class='btn btn-primary col-md-1 ml-2' style='float: right; '>Voltar</a>
         </div>
            <jsp:include page="../templates/footer.jsp"/>
    </body>
</html>