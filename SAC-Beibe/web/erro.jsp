<%@ page isErrorPage="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head><jsp:include page="../templates/head.jsp"/></head>
    <body>
        <div class='container col-md-3 mt-5'>
            <div class='d-flex justify-content-center'>
               <h1 class='pt-3'>Página de Erro</h1>
            </div>
            
            <div class='text-center col-md-12'>
                <p>Erro:  <c:out value="${msg}"/> </p>
                <p>Mensagem de erro:  <c:out value="${pageContext.exception.message}"/> </p>
                <p>PrintStackTrace do erro:  <c:out value="${pageContext.exception.printStackTrace(pageContext.response.writer)}"/> </p>
            </div>
            
            <div class='d-flex justify-content-center'>
               <a class='btn btn-primary btn-sm' href='index.jsp'>Voltar para index </a>
            </div>
         </div>          
    </body>
</html>
