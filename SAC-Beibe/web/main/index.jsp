<%@ page errorPage="erro.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="../templates/head.jsp"/>
    </head>
    <body>
        <jsp:include page="../templates/nav.jsp"/>

        <section class="site-hero overlay" data-stellar-background-ratio="0.5" style="background-image: url(../images/big_image_1.jpg);">
            <div class="container">
                <div class="row align-items-center site-hero-inner justify-content-center">
                    <div class="col-md-8 text-center">
                        <div class="mb-5 element-animate">
                            <h1>Bem vindo a BEIBE</h1>
                            <p class="lead">A Embuste é a marca de beleza preferida dos brasileiros</p>.</p>
                            <h5 class="lead">Fonte: Embuste Estatística, 2018</h5>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <section class="school-features d-flex" style="padding-left: 7em;background-image: url(images/big_image_3.jpg);">

            <div class="inner" align="center">
                <div class="media d-block feature">
                    <div class="icon"><span class="flaticon-video-call"></span></div>
                    <div class="media-body">
                        <h3 class="mt-0">Estética Facial</h3>
                        <img src="http://fabianascaranzi.com.br/wp-content/uploads/2016/05/16374967.jpg"  class="img-responsive" alt="Cinque Terre" style="width:15em ;height: 220px">

                    </div>
                </div>

                <div class="media d-block feature">
                    <div class="icon"><span class="flaticon-video-call"></span></div>
                    <div class="media-body">
                        <h3 class="mt-0">Estética corporal</h3>
                        <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTq48mSg3Y8-w0FQbJ1zLNdLrIU6suBfC6MJ_USuA9rQj2NlkpqsA"  class="img-responsive" alt="Cinque Terre" style="width:15em;height: 220px">

                    </div>

                </div>

                <div class="media d-block feature">
                    <div class="icon"><span class="flaticon-video-call"></span></div>
                    <div class="media-body">
                        <h3 class="mt-0">Estética dos olhos</h3>
                        <img src="http://art180.com.br/upload_clientes/81030/userfiles/images/olhar1.jpg"  class="img-responsive" alt="Cinque Terre" style="width:15em ; height: 220px">

                    </div>

                </div>


                <div class="media d-block feature">
                    <div class="icon"><span class="flaticon-video-call"></span></div>
                    <div class="media-body">
                        <h3 class="mt-0">Bem estar</h3>
                        <img src="https://pbs.twimg.com/profile_images/2365394012/estetica_400x400.jpg "  class="img-responsive" alt="Cinque Terre" style="width:15em ;height: 220px">

                    </div>

                </div>
            </div>
        </section>
        <jsp:include  page="../templates/footer.jsp"/>
    </body>
</html>