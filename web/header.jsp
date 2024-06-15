<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<header class="w-full bg-white shadow">
    <div class="container mx-auto px-6 py-3 flex justify-between items-center">
        <div class="flex items-center space-x-4">
            <a href="#" class="text-black text-lg font-semibold">MY GLASSES</a>
            <a href="HomePage.jsp" class="nav-link text-black text-lg font-semibold px-4 py-2">HOME</a>
            <a href="Shop.jsp" class="nav-link text-black text-lg font-semibold px-4 py-2">SHOP</a>
            <a href="#aboutUs" class="nav-link text-black text-lg font-semibold px-4 py-2">ABOUT</a>
            <c:if test="${sessionScope.USER != null}">
                <a href="UpdateAccount.jsp" class="nav-link text-black text-lg font-semibold px-4 py-2">ACCOUNT</a>
            </c:if>
            <c:if test="${sessionScope.USER == null}">
                <a href="Login.jsp" class="nav-link text-black text-lg font-semibold px-4 py-2">ACCOUNT</a>
            </c:if>
        </div>
    </div>
</header>