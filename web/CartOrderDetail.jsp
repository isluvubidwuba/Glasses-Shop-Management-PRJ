<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Cart Page</title>
        <script src="https://cdn.tailwindcss.com"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

        <style>
            .nav-link {
                transition: all 0.3s ease;
            }

            .nav-link:hover {
                transform: translateY(-5px);
                text-align: center;
            }
        </style>

    </head>

    <body>
        <div class="bg-white text-zinc-900">
            <jsp:include page="notification.jsp"></jsp:include>

            <jsp:include page="header2.jsp"></jsp:include>






                <div class="bg-white p-4 mt-10">
                    <table class="w-full text-left border-collapse">
                        <thead>
                            <tr>
                                <th class="border p-2">Image</th>
                                <th class="border p-2">Product</th>
                                <th class="border p-2">Price</th>
                                <th class="border p-2">Quantity</th>
                                <th class="border p-2">Total</th>
                                <th class="border p-2">Remove</th>
                            </tr>
                        </thead>
                        <tbody>
                        <c:set var="cartTotal" value="0" />
                        <c:forEach var="entry" items="${sessionScope.cart}">
                            <c:set var="item" value="${entry.key}" />
                            <c:set var="quantity" value="${entry.value}" />
                            <c:set var="totalPrice" value="${item.price * quantity}" />
                            <c:set var="cartTotal" value="${cartTotal + totalPrice}" />
                            <tr>
                                <td class="border p-2"><img src="${item.image}" alt="Product Image" width="100" height="100"></td>
                                <td class="border p-2">${item.name}</td>
                                <td class="border p-2">${item.price}</td>
                                <td class="border p-2">
                                    <form action="MainController?action=UpdateQuantity" method="post">
                                        <input type="hidden" name="itemId" value="${item.idGlasses}">
                                        <input type="number" name="quantity" class="border p-1 w-16" value="${quantity}" min="0">
                                        <button type="submit" class="bg-purple-500 text-white p-1 rounded hover:bg-purple-700">Update</button>
                                    </form>
                                </td>
                                <td class="border p-2">
                                    <fmt:formatNumber value="${totalPrice}" type="currency" currencySymbol="$" />
                                </td>
                                <td class="border p-2">
                                    <form action="MainController?action=RemoveFromCart" method="post">
                                        <input type="hidden" name="itemId" value="${item.idGlasses}">
                                        <button type="submit" class="bg-purple-500 text-white p-1 rounded hover:bg-purple-700">
                                            <i class="fas fa-trash"></i>
                                        </button>
                                    </form>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
                <div class="flex justify-between items-center mt-4">
                    <a href="Shop.jsp" class="border border-purple-500 text-purple-500 p-2 rounded hover:bg-purple-500 hover:text-white">
                        Continue Shopping
                    </a>
                    <div class="text-right w-1/3 text-lg">
                        <div class="font-bold text-xl">CART TOTALS</div>
                        <div class="border-t my-4"></div>
                        <div class="my-4 text-xl">
                            Total: 
                            <span class="font-bold">
                                <fmt:formatNumber value="${cartTotal}" type="currency" currencySymbol="$" />
                            </span>
                        </div>

                        <c:if test="${sessionScope.USER != null}">
                            <a href="invoice.jsp" class="border border-purple-500 text-purple-500 p-2 rounded hover:bg-purple-500 hover:text-white mt-2">
                                Go to Checkout
                            </a>

                        </c:if>
                        <c:if test="${sessionScope.USER == null}">
                            <a href="Login.jsp" class="border border-purple-500 text-purple-500 p-2 rounded hover:bg-purple-500 hover:text-white mt-2">
                                Go to Checkout
                            </a>

                        </c:if>
                    </div>
                </div>
            </div>
            <script>
                document.addEventListener('DOMContentLoaded', () => {
                    const numberInputs = document.querySelectorAll('input[type="number"]');

                    numberInputs.forEach(input => {
                        input.addEventListener('input', () => {
                            if (input.value < 0) {
                                input.value = 0;
                            }
                        });
                    });
                });
            </script>

        </div>
    </body>

</html>