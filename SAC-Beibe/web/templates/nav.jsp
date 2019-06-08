<%@ page errorPage="erro.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <a class="navbar-brand" href="#">Beibe Salão de Beleza</a>
    <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
        <ul class="navbar-nav">
        <c:choose>
            <c:when test="${loginBean.tipoUsuario == 'C'}">
                <div class="navbar-nav">
                    <a class="nav-item nav-link active" href="ClienteServlet?action=list">Alterar Dados <span class="sr-only">(current)</span></a>
                </div>
                 <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                      Atendimentos
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                      <a class="dropdown-item" href="#">Criar atendimento</a>
                      <a class="dropdown-item" href="#">Meus atendimentos</a>
                    </div>
                </li>
                
            </c:when>
            <c:when test="${loginBean.tipoUsuario == 'F'}">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                      Atendimentos
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                      <a class="dropdown-item" href="#">Listar todos os atendimentos em aberto</a>
                      <a class="dropdown-item" href="#">Listar todos os atendimentos</a>
                    </div>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="courses.html" id="dropdown04" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Cadastrar</a>
                    <div class="dropdown-menu" aria-labelledby="dropdown04">
                        <a class="dropdown-item" href="courses.html">Cadastrar Produtos</a>
                        <a class="dropdown-item" href="courses.html">Cadastrar Categorias</a>
                    </div>
                </li>
            </c:when>
                
            <c:when test="${loginBean.tipoUsuario == 'G'}">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="courses.html" id="dropdown04" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Funcionários</a>
                    <div class="dropdown-menu" aria-labelledby="dropdown04">
                        <a class="dropdown-item" href="courses.html">Cadastrar Funcionário/Gerente</a>
                        <a class="dropdown-item" href="courses.html">Listar Funcionários</a>
                    </div>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="courses.html" id="dropdown04" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Atendimentos</a>
                    <div class="dropdown-menu" aria-labelledby="dropdown04">
                        <a class="dropdown-item" href="courses.html">Listar Atendimentos em aberto</a>
                        <a class="dropdown-item" href="courses.html">Listar todos os atendimentos</a>
                    </div>
                </li>
                <li class="nav-item">
                    <a class="nav-link dropdown-toggle" href="courses.html" id="dropdown04" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Gerar Relatórios</a>
                </li>
            </c:when>

        </c:choose>
        
                
        </ul>
    </div>
    <div class="d-flex flex-row-reverse mt-4 text-white">
        <c:if test="${!empty loginBean}">
            <a href='../LogoutServlet' class='btn btn-primary btn-sm  mt-3 mr-3 h-50'>SAIR</a>
            <span class="m  r-3 m-3"> <c:out value="${loginBean.nomeUsuario}"/> </span>
            <i class="far fa-user-circle fa-2x mt-3"></i>
        </c:if>
        <c:if test="${empty loginBean}">
            <a class="nav-item nav-link active text-white" href="../main/login.jsp">Log in <span class="sr-only"></span></a>
            <a class="nav-item nav-link active text-white" href="AtendimentoServlet?action=list">Cadastre-se agora!<span class="sr-only"></span></a>
        </c:if>

    </div>
</nav>