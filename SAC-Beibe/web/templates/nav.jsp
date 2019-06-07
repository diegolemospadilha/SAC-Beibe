<%@ page errorPage="erro.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.List"%>
<%@page import="com.ufpr.tads.web2.beans.Cliente"%>
<%@page import="com.ufpr.tads.web2.beans.User"%>
<%@page import="com.ufpr.tads.web2.DAO.UserDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <a class="navbar-brand" href="#">JAVAWEB 2</a>
    <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
        <div class="navbar-nav">
            <a class="nav-item nav-link active" href="ClienteServlet?action=list">Cadastrar Cliente <span class="sr-only">(current)</span></a>
        </div>
        <div class="navbar-nav">
            <a class="nav-item nav-link active" href="AtendimentoServlet?action=create">Cadastrar Atendimentos <span class="sr-only">(current)</span></a>
        </div>
        <div class="navbar-nav">
            <a class="nav-item nav-link active" href="AtendimentoServlet?action=list">Mostrar Atendimentos <span class="sr-only">(current)</span></a>
        </div>
         <div class="navbar-nav">
            <a class="nav-item nav-link active" href="GeradorRelatorioServlet?action=list">Emitir Relatórios <span class="sr-only">(current)</span></a>
        </div>
    </div>
    <div class="d-flex flex-row-reverse mt-4 text-white">
        <a href='LogoutServlet' class='btn btn-primary btn-sm  mt-3 mr-3 h-50'>SAIR</a>
        <span class="m  r-3 m-3"> <c:out value="${loginBean.nomeUsuario}"/> </span>
        <i class="far fa-user-circle fa-2x mt-3"></i>
    </div>
</nav>