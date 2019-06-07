<%@ page errorPage="erro.jsp" %>
<%@page import="java.util.List"%>
<%@page import="com.ufpr.tads.web2.beans.Cliente"%>
<%@page import="com.ufpr.tads.web2.beans.User"%>
<%@page import="com.ufpr.tads.web2.DAO.ClienteDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="container-fluid ">
    <footer>
        <div class="d-flex justify-content-center">
            <p class="mt-4 text-white">Em caso de problemas contactar o administrador:
                <c:out value="${configuracao.email}"/>
            </p>
        </div>
    </footer>
</div>

