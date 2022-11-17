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
            <select name="top">
                <c:forEach var="topItem" items="${sessionScope.topList}">
                    <option value="${topItem.id}">${topItem.name} (${topItem.price} kr)</option>
                </c:forEach>
            </select>
            <select name="bottom">
                <c:forEach var="bottomItem" items="${sessionScope.bottomList}">
                    <option value="${bottomItem.id}">${bottomItem.name} (${bottomItem.price} kr)</option>
                </c:forEach>
            </select>
            <select name="quantity">
                <option value="1">1</option>
                <option value="2">2</option>
                <option value="3">3</option>
                <option value="4">4</option>
            </select>
            <button class="btn btn-primary" name="addToCart">Add to cart</button>
        </form>

        <h2> Amount of Cupcakes in Cart: ${requestScope.sCartSize}</h2>

        <h2> Contents of Shopping Cart: </h2>
        <c:forEach var="item" items="${sessionScope.sCart.cupcakeList}">
            TopId: ${item.topId} BottomId: ${item.bottomId} Quantity: ${item.quantity}<br/>
            <%-- After adding the objects, use:    TopId: ${item.top.name}<br/>--%>
        </c:forEach>

        <p class="mt-4"><a class="btn btn-primary" href="order">Complete Order</a></p>

    </jsp:body>

</t:cupcaketemplate>