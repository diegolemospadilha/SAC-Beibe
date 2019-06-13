<%@ page errorPage="erro.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<c:if test="${empty loginBean}">
    <jsp:forward page="../erro.jsp">
        <jsp:param name="msg" value="Acesso Inválido"/>
    </jsp:forward>
</c:if>
