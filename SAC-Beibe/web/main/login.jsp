<%@ page errorPage="erro.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home - Beibe Salão de Beleza</title>
        <link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.7.2/css/all.css' integrity='sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr' crossorigin='anonymous'>
        <link rel='stylesheet' href='https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css' >
        <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,900" rel="stylesheet">

        <link rel="stylesheet" href="../css/bootstrap.css">
        <link rel="stylesheet" href="../css/animate.css">
        <link rel="stylesheet" href="../css/owl.carousel.min.css">

        <link rel="stylesheet" href="web/../fonts/ionicons/css/ionicons.min.css">
        <link rel="stylesheet" href="web/../fonts/fontawesome/css/font-awesome.min.css">
        <link rel="stylesheet" href="web/../fonts/flaticon/font/flaticon.css">

        <!-- Theme Style -->
        <link rel="stylesheet" href="../css/style.css">
    </head>
    <body class="bg-white">
        <jsp:include page="../templates/nav.jsp"/>
        <section class="site-hero site-hero-innerpage overlay" data-stellar-background-ratio="0.5" style="background-image: url(../images/big_image_1.jpg);">
            <div class="container">
                <div class="row align-items-center site-hero-inner justify-content-center">
                    <div class="col-md-8 text-center">
                        <div class="mb-5 element-animate">
                            <h1>Login</h1>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <section class="site-section bg-light">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-md-5 box">
                        <h2 class="mb-5 text-center">Acesse nosso sistema com sua conta</h2>
                        <form action="  LoginServlet" method="POST">
                            <div class="row">
                                <div class="col-md-12 form-group">
                                    <i class="fas fa-user p-2"></i><label for="login">Username</label>
                                    <input type="text" id="name" name="login" class="form-control ">
                                </div>
                            </div>
                            <div class="row mb-5">
                                <div class="col-md-12 form-group">
                                    <i class="fas fa-unlock p-2"></i><label for="name">Password</label>
                                    <input type="password" id="passwd" name="passwd" class="form-control ">
                                </div>
                            </div>

                            <div class="pl-1 d-flex justify-content-center mb-2">
                                <div class="form-group w-50">
                                    <input type="submit" value="Entrar" class="btn btn-primary w-100">
                                </div>
                            </div>
                            <h2 class="text-danger text-center"><c:out value="${requestScope.msg}"/></h2>
                        </form>
                    </div>
                </div>
            </div>
        </section>

        <jsp:include  page="../templates/footer.jsp"/>
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