<%@page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<html>

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Check out page</title>
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

            <%
                String invoiceId = (String) session.getAttribute("invoiceId");
                if (invoiceId == null) {
                    invoiceId = "INV-" + System.currentTimeMillis(); // Tạo ID hóa đơn mới
                    session.setAttribute("invoiceId", invoiceId);
                }

                // Lấy ngày hiện tại
                java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd");
                String currentDate = formatter.format(new java.util.Date());
            %>
            <jsp:include page="header2.jsp"></jsp:include>

                <div class="flex flex-col lg:flex-row justify-between p-4 bg-white space-y-4 lg:space-y-0 lg:gap-4">
                    <div class="w-full lg:w-1/3 p-4 border rounded-lg flex-grow">
                        <h2 class="text-xl font-semibold mb-4">Billing Details</h2>
                        <form action="MainController" method="POST">
                            <input type="hidden" name="action" value="CreateInvoice">
                            <div class="mb-4">
                                <label class="block text-zinc-700">Invoice ID</label>
                                <input type="text" class="w-full p-2 border rounded" name="invoiceId" value="<%= invoiceId%>" readonly>
                        </div>
                        <div class="mb-4">
                            <label class="block text-zinc-700">User ID</label>
                            <input type="text" class="w-full p-2 border rounded" value="${sessionScope.USER.userID}" readonly>
                        </div>
                        <div class="mb-4">
                            <label class="block text-zinc-700">Date of Purchase <span class="text-red-500">*</span></label>
                            <input type="date" class="w-full p-2 border rounded" value="<%= currentDate%>" readonly>
                        </div>
                        <div class="mb-4">
                            <label class="block text-zinc-700">Email <span class="text-red-500">*</span></label>
                            <input type="email" class="w-full p-2 border rounded" value="${sessionScope.USER.gmail}" readonly>
                        </div>
                        <div class="mb-4">
                            <label class="block text-zinc-700">Address <span class="text-red-500">*</span></label>
                            <input type="text" class="w-full p-2 border rounded" value="${sessionScope.USER.address}" readonly>
                        </div>
                    </form>
                </div>

                <div class="w-full lg:w-1/3 p-4 border rounded-lg flex-grow">
                    <h2 class="text-xl font-semibold mb-4">Your Order</h2>
                    <table class="w-full mb-4 table-auto">
                        <thead>
                            <tr>
                                <th class="text-left p-2 border-b">Product</th>
                                <th class="text-right p-2 border-b">Total</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:set var="cartTotal" value="0" />
                            <c:forEach var="entry" items="${sessionScope.cart}">
                                <c:set var="item" value="${entry.key}" />
                                <c:set var="quantity" value="${entry.value}" />
                                <c:set var="totalPrice" value="${item.price * quantity}" />
                                <c:set var="cartTotal" value="${cartTotal + totalPrice}" />
                                <tr class="border-b">
                                    <td class="p-2">${item.name} x ${quantity}</td>
                                    <td class="text-right p-2">
                                        <fmt:formatNumber value="${totalPrice}" type="currency" currencySymbol="$" />
                                    </td>
                                </tr>
                            </c:forEach>
                            <tr class="font-semibold">
                                <td class="p-2">Order Total</td>
                                <td class="text-right p-2">
                                    <fmt:formatNumber value="${cartTotal}" type="currency" currencySymbol="$" />
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <form action="MainController?action=CreateInvoice" method="POST">
                        <button type="submit" class="w-full border border-purple-500 text-purple-500 p-2 rounded hover:bg-purple-500 hover:text-white mt-10">
                            PLACE ORDER
                        </button></form>
                </div>
            </div>
        </div>
    </body>

</html>
