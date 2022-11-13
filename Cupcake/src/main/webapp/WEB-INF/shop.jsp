<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<t:cupcaketemplate>
    <jsp:attribute name="header">
        Cupcake Shopping
    </jsp:attribute>

    <jsp:body>

        <p>Create your own cupcake from a selection of Cupcake Tops and Bottoms:</p>

        <form action="addtocart" method="post">
            <select name="bottom">
                <option value="1">Chocolate (5 kr)</option>
                <option value="2">Vanilla (6 kr)</option>
            </select>

            <select name="top">
                <option value="1">Chocolate (5 kr)</option>
                <option value="2">Vanilla (6 kr)</option>
            </select>

            <select name="quantity">
                <option value="1">1</option>
                <option value="2">2</option>
                <option value="3">3</option>
                <option value="4">4</option>
            </select>

            <button name="addtocart">Add to Cart</button>
        </form>

        <h2> Amount of Cupcakes in Cart: ${requestScope.sCartSize}</h2>

        <h2> Contents of Shopping Cart: </h2>
        <c:forEach var="item" items="${sessionScope.sCart.cupcakeList}">
            TopId: ${item.topId} BottomId: ${item.bottomId} Quantity: ${item.quantity}<br/>
            <%-- After adding the objects, use:    TopId: ${item.top.name}<br/>--%>
        </c:forEach>

    </jsp:body>

</t:cupcaketemplate>