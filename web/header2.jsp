<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<header class="flex justify-between items-center p-4 border-b text-center">
    <div class="w-1/3 flex justify-start items-center space-x-4">
        <img src="https://storage.googleapis.com/jewelrystore-2ks1dotnet.appspot.com/Promotion/a1a78d2f-a47e-4217-a8af-89fcaf87d3dd_2024-06-13" alt="Product Image" class="w-12 h-12">
    </div>
    <div class="w-1/3 text-2xl font-bold flex justify-center">
        MY GLASSES
    </div>

    <c:if test="${sessionScope.USER != null}">
        <div class="w-1/3 flex justify-end items-center space-x-4">
            <a href="MainController?action=Logout" class="text-zinc-600">LOG OUT</a>
            <a href="MainController?action=Logout"><img
                    src="data:image/jpeg;base64,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"
                    alt="Cart" class="w-6 h-6"></a>
        </div>
    </c:if>
    <c:if test="${sessionScope.USER == null}">
        <div class="w-1/3 flex justify-end items-center space-x-4">
            <a href="Login.jsp" class="text-zinc-600">LOG IN</a>
            <a href="Login.jsp"><img
                    src="data:image/jpeg;base64,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"
                    alt="Cart" class="w-6 h-6"></a>
        </div>
    </c:if>
</header>

<nav class="flex justify-center space-x-8 py-4 border-b">
    <a href="HomePage.jsp" class="nav-link text-zinc-600">HOME</a>
    <a href="Shop.jsp" class="nav-link text-zinc-600">SHOP</a>

    <c:choose>
        <c:when test="${sessionScope.USER.roleID == 'AD'}">
            <a href="addProduct.jsp" class="nav-link text-zinc-600">ADD PRODUCT</a>
            <a href="viewInvoice.jsp" class="nav-link text-zinc-600">VIEW INVOICE</a>
            <a href="manageUser.jsp" class="nav-link text-zinc-600">VIEW USER</a>
        </c:when>
        <c:otherwise>
            <a href="CartOrderDetail.jsp" class="nav-link text-zinc-600">CART</a>
        </c:otherwise>
    </c:choose>

    <c:choose>
        <c:when test="${sessionScope.USER != null}">
            <a href="UpdateAccount.jsp" class="nav-link text-zinc-600">ACCOUNT</a>
        </c:when>
        <c:otherwise>
            <a href="Login.jsp" class="nav-link text-zinc-600">ACCOUNT</a>
        </c:otherwise>
    </c:choose>

</nav>