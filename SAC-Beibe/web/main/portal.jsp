<%@ page errorPage="erro.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Portal Servlet</title>
        <link rel="stylesheet" href="../css/bootstrap.css">
        <link rel="stylesheet" href="../css/animate.css">
        <link rel="stylesheet" href="../css/owl.carousel.min.css">

        <link rel="stylesheet" href="web/../fonts/ionicons/css/ionicons.min.css">
        <link rel="stylesheet" href="web/../fonts/fontawesome/css/font-awesome.min.css">
        <link rel="stylesheet" href="web/../fonts/flaticon/font/flaticon.css">
        <link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.7.2/css/all.css' integrity='sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr' crossorigin='anonymous'>        <link rel='stylesheet' href='https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css' >
        
        <link rel="stylesheet" href="../css/style.css">
        <c:if test="${empty loginBean}">
            <jsp:forward page="index.jsp">
                <jsp:param name="msg" value="Acesso Inválido"/>
            </jsp:forward>
        </c:if>
 
    </head>
    <body>
         <jsp:include page="../templates/nav.jsp"/>
         
        <div class='container col-md-6 mb-5'>
            <div class='align-self-center m-5'>
               <h2 class='text-center col-12-md' style='color:#000'>Bem vindo ao Portal Servlet</h2>
            </div>
        </div>
                 
         <jsp:include page="../templates/footer.jsp"/>
    </body>
</html>
<script src="../js/jquery-3.2.1.min.js"></script>
<script src="../js/jquery-migrate-3.0.0.js"></script>
<script src="../js/popper.min.js"></script>
<script src="../js/bootstrap.min.js"></script>
<script src="../js/owl.carousel.min.js"></script>
<script src="../js/jquery.waypoints.min.js"></script>
<script src="../js/jquery.stellar.min.js"></script>
<script src="../js/main.js"></script>

