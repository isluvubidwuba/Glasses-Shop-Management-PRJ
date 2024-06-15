<%@page import="dao.InvoiceDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dto.tblInvoice"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Invoice Page</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
        .nav-link {
            transition: all 0.3s ease;
        }

        .nav-link:hover {
            transform: translateY(-5px);
            text-align: center;
        }

        /* Add custom styles for fixed footer */
        html, body {
            height: 100%;
        }

        body {
            display: flex;
            flex-direction: column;
        }

        main {
            flex: 1;
            display: flex;
            flex-direction: column;
        }
    </style>
</head>
<body class="bg-white text-zinc-900">
    <jsp:include page="notification.jsp"></jsp:include>
    <jsp:include page="header2.jsp"></jsp:include>

    <main class="flex-grow p-4">
        <%
            ArrayList<tblInvoice> listInvoices = (ArrayList<tblInvoice>) request.getAttribute("listInvoices");
            if (listInvoices == null) {
                InvoiceDAO invoiceDao = new InvoiceDAO();
                listInvoices = invoiceDao.listInvoices();
                request.setAttribute("listInvoices", listInvoices);
            }
        %>

        <div class="bg-white p-4 flex-grow">
            <div class="mb-4">
                <form action="MainController?action=searchByUserId" method="post">
                    <input type="text" name="userID" placeholder="Search by user id" class="w-full p-2 border border-zinc-300 rounded">
                    <button type="submit" class="mt-2 bg-blue-500 text-white p-2 rounded">Search</button>
                </form>
            </div>

            <!-- Table -->
            <div class="bg-white overflow-auto flex-grow">
                <table class="min-w-full bg-white">
                    <thead class="bg-gray-800 text-white">
                        <tr>
                            <th class="text-left py-3 px-4 uppercase font-semibold text-sm">Invoice ID</th>
                            <th class="text-left py-3 px-4 uppercase font-semibold text-sm">User ID</th>
                            <th class="text-left py-3 px-4 uppercase font-semibold text-sm">Date</th>
                            <th class="text-left py-3 px-4 uppercase font-semibold text-sm">Email</th>
                            <th class="text-left py-3 px-4 uppercase font-semibold text-sm">Address</th>
                            <th class="text-left py-3 px-4 uppercase font-semibold text-sm">Total</th>
                        </tr>
                    </thead>
                    <tbody id="table-body" class="text-gray-700">
                        <c:forEach var="invoice" items="${listInvoices}" varStatus="status">
                            <tr class="${status.index % 2 == 0 ? 'bg-gray-100' : 'bg-white'}">
                                <td class="text-left py-3 px-4">${invoice.invId}</td>
                                <td class="text-left py-3 px-4">${invoice.userID}</td>
                                <td class="text-left py-3 px-4">${invoice.dateBuy}</td>
                                <td class="text-left py-3 px-4">${invoice.gmail}</td>
                                <td class="text-left py-3 px-4">${invoice.address}</td>
                                <td class="text-left py-3 px-4">${invoice.total}</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </main>

    <footer class="w-full h-full flex justify-around border-t pt-8 bg-gray-100 ">
        <div>
            <h2 class="font-semibold mb-2">Navigations</h2>
            <ul class="text-zinc-600 space-y-1">
                <li>Create new account</li>
                <li>Login</li>
                <li>Menu</li>
                <li>Shop</li>
                <li>About</li>
            </ul>
        </div>
        <div>
            <h2 class="font-semibold mb-2">Contact Info</h2>
            <ul class="text-zinc-600 space-y-1">
                <li>🏫 FPT university</li>
                <li>📞 +2 392 3929 210</li>
                <li>✉️ SE183025emailaddress@gmail.com</li>
            </ul>
        </div>
    </footer>
</body>
</html>
