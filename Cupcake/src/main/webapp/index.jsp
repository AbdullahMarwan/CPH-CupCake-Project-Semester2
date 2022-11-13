<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page errorPage="error.jsp" isErrorPage="false" %>

<t:cupcaketemplate>
    <jsp:attribute name="header">
         Welcome to Olsker's Cupcakes
    </jsp:attribute>

    <jsp:body>

        <c:if test="${sessionScope.user != null}">
            <p>You are now logged in. Enter the shop here:</p>

            <a class="btn btn-primary" href=shop.jsp" role="button">Enter Shop</a>

        </c:if>

        <c:if test="${sessionScope.user == null}">
            <p>You are not logged in yet. You can do it here:</p>

            <a class="btn btn-primary" href="login.jsp" role="button">Login</a>

            <p>Don't have an account? Sign up here:</p>

            <a class="btn btn-primary" href="signup.jsp" role="button">Sign Up</a>

        </c:if>

    </jsp:body>

</t:cupcaketemplate>