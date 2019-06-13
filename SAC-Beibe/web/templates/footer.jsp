<%@ page errorPage="erro.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>

<script src="http://localhost:8081/SAC-Beibe/js/lib.js" type="text/javascript"></script>
<script src="http://localhost:8081/SAC-Beibe/js/jquery-3.2.1.min.js"></script>
<script src="http://localhost:8081/SAC-Beibe/js/jquery-migrate-3.0.0.js"></script>
<script src="http://localhost:8081/SAC-Beibe/js/popper.min.js"></script>
<script src="http://localhost:8081/SAC-Beibe/js/bootstrap.min.js"></script>
<script src="http://localhost:8081/SAC-Beibe/js/owl.carousel.min.js"></script>
<script src="http://localhost:8081/SAC-Beibe/js/jquery.waypoints.min.js"></script>
<script src="http://localhost:8081/SAC-Beibe/js/jquery.stellar.min.js"></script>
<script src="http://localhost:8081/SAC-Beibe/js/main.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.15/jquery.mask.min.js"></script>

<div class="container-fluid ">
    <footer class="site-footer" style=" background-image: url(http://www4.uma.pt/cierl/wp-content/uploads/2015/02/rodape.png);"> 
        <div class="d-flex justify-content-center">
            <p class="mt-4 text-black">Em caso de problemas contactar o administrador:
                <c:out value="${configuracao.email}"/>
            </p>
        </div>
    </footer>
</div>

