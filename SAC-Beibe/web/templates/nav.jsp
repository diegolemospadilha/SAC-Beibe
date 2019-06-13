<%@ page errorPage="erro.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <a class="navbar-brand" href="http://localhost:8081/SAC-Beibe/main/index.jsp">Beibe Salão de Beleza</a>
    <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
        <ul class="navbar-nav">
            <c:choose>
                <c:when test="${loginBean.tipoUsuario == 'Cliente'}">
                    <div class="navbar-nav">
                        <a class="nav-item nav-link active" href="ClienteServlet?action=formUpdate&id=${loginBean.id}"> Alterar Dados <span class="sr-only">(current)</span></a>
                    </div>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Atendimentos
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                            <a class="dropdown-item" href="AtendimentoServlet?action=create">Criar atendimento</a>
                            <a class="dropdown-item" href="AtendimentoServlet?action=list">Meus atendimentos</a>
                        </div>
                    </li>
                </c:when>

                <c:when test="${loginBean.tipoUsuario == 'Funcionario'}">
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Atendimentos
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                            <a class="dropdown-item" href="AtendimentoServlet?action=listarAbertos">Listar todos os atendimentos em aberto</a>
                            <a class="dropdown-item" href="AtendimentoServlet?action=listarTodosAtendimentos">Listar todos os atendimentos</a>
                        </div>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="courses.html" id="dropdown04" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Cadastrar</a>
                        <div class="dropdown-menu" aria-labelledby="dropdown04">
                            <a class="dropdown-item" href="ProdutoServlet?action=formNew">Cadastrar Produtos</a>
                            <a class="dropdown-item" href="CategoriaServlet?action=formNew"">Cadastrar Categorias</a>
                        </div>
                    </li>
                </c:when>

                <c:when test="${loginBean.tipoUsuario == 'Gerente'}">
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="courses.html" id="dropdown04" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Funcionários</a>
                        <div class="dropdown-menu" aria-labelledby="dropdown04">
                            <a class="dropdown-item" href="FuncionarioServlet?action=formNew">Cadastrar Funcionário/Gerente</a>
                            <a class="dropdown-item" href="FuncionarioServlet?action=list">Listar Funcionários</a>
                        </div>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="courses.html" id="dropdown04" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Atendimentos</a>
                        <div class="dropdown-menu" aria-labelledby="dropdown04">
                            <a class="dropdown-item" href="AtendimentoServlet?action=listarAbertos">Listar todos os atendimentos em aberto</a>
                            <a class="dropdown-item" href="AtendimentoServlet?action=listarTodosAtendimentos">Listar todos os atendimentos</a>
                        </div>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="relatorio.jsp" aria-haspopup="true" aria-expanded="false">Gerar Relatórios</a>
                    </li>
                </c:when>
            </c:choose>
        </ul>
    </div>
    <div class="d-flex flex-row-reverse text-white">
        <c:if test="${!empty loginBean}">
            <a href='LogoutServlet' class='btn btn-primary btn-sm  mt-3 mr-3 h-50'>SAIR</a>
            <span class="m  r-3 m-3"> <c:out value="${loginBean.nomeUsuario}"/> </span>
            <i class="far fa-user-circle fa-2x mt-3"></i>
        </c:if>
        <c:if test="${empty loginBean}">
            <a class="nav-item nav-link active text-white" href="http://localhost:8081/SAC-Beibe/main/login.jsp">Login <span class="sr-only"></span></a>
            <a class="nav-item nav-link active text-white" href="http://localhost:8081/SAC-Beibe//ClienteServlet?action=formNew">Cadastre-se agora!<span class="sr-only"></span></a>
        </c:if>
    </div>
</nav>
