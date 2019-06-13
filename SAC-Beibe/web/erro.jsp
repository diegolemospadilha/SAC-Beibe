<%@ page isErrorPage="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head><jsp:include page="templates/head.jsp"/></head>
    <body>
        <jsp:include page="templates/nav.jsp"/>
        <div class='container col-md-3 mt-5'>
            <div class='d-flex justify-content-center'>
               <h1 class='pt-3'>Página de Erro</h1>
            </div>
            <div class='d-flex justify-content-center'>
                <h1 class='pt-3 text-danger'><c:out value="${param.msg}"/></h1> 
            </div>
            
            <div class='d-flex justify-content-center'>
                <a class='btn btn-primary btn-sm' href='http://localhost:8081/SAC-Beibe/main/index.jsp'>Voltar para index </a>
            </div>
         </div>          
    </body>
</html>
