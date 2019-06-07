<%@ page errorPage="erro.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<html>
    <head>
        <title>Home - Cadastro TADS</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel='stylesheet' href='css/style.css'>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" >
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">

    </head>
    <body class="bg-white">
        <div class="align-self-center"> 
            <h2 class="text-center mt-5 mb-5" style="color:#000">Cadastro TADS</h2>
        </div>
        <div class="container">
            <div class="row">
                <div class="border border-primary rounded col-md-4 offset-md-4" style="padding: 4em; padding-top: 4em;">
                    <div >
                        <form action="LoginServlet" method="POST">
                            <i class="fas fa-user p-2"></i><label >User : </label>
                            <input class="form-control" type="text" name="login" required="">
                            <i class="fas fa-unlock p-2"></i> <label> Password : </label>
                            <input  class="form-control" type="password" name="passwd" required="">
                            <br>
                            <br>
                            <input class="btn btn-primary w-100" type="submit" value="Log in">
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <div class="d-flex justify-content-center mt-5">
            
            <h2 class="text-danger"><c:out value="${requestScope.msg}"/></h2>
           
        </div>
        
        <c:import  url="templates/footer.jsp"/>
    </body>
</html>


