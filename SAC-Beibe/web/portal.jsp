<%@ page errorPage="erro.jsp" %>
<%@page import="com.ufpr.tads.web2.beans.Cliente"%>
<%@page import="java.util.List"%>
<%@page import="com.ufpr.tads.web2.beans.User"%>
<%@page import="com.ufpr.tads.web2.beans.User"%>
<%@page import="com.ufpr.tads.web2.DAO.UserDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Portal Servlet</title>
        <link rel='stylesheet' href='css/style.css'>
        <link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.7.2/css/all.css' integrity='sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr' crossorigin='anonymous'>
        <link rel='stylesheet' href='https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css' >
   
        <c:if test="${empty loginBean}">
            <jsp:forward page="index.jsp">
                <jsp:param name="msg" value="Acesso Inválido"/>
            </jsp:forward>
        </c:if>
 
    </head>
    <body>
         <c:import  url="templates/nav.jsp"/>
         
        <div class='container col-md-6 mb-5'>
            <div class='align-self-center m-5'>
               <h2 class='text-center col-12-md' style='color:#000'>Bem vindo ao Portal Servlet</h2>
            </div>
        </div>
                 
         <c:import  url="templates/footer.jsp"/>
    </body>
</html>
