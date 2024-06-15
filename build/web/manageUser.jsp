<%@page import="dao.UserDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dto.tblUsers"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Cart Page</title>
        <script src="https://cdn.tailwindcss.com"></script>
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

            <%
                ArrayList<tblUsers> listUser = (ArrayList<tblUsers>) request.getAttribute("listUser");
                if (listUser == null) {
                    UserDAO userDao = new UserDAO();
                    listUser = userDao.listUsers();
                    request.setAttribute("listUser", listUser);
                }
            %>


            <div class="bg-white p-4">
                <div class="mb-4">
                    <form action="MainController?action=searchAccount" method="get">
                        <input type="text" name="fullName" placeholder="Search by fullname" class="w-full p-2 border border-zinc-300 rounded">
                        <button type="submit" class="mt-2 bg-blue-500 text-white p-2 rounded">Search</button>
                    </form>
                </div>

                <table class="w-full border-collapse">
                    <thead>
                        <tr class="bg-zinc-800 text-white">
                            <th class="p-2 border border-zinc-300">User ID</th>
                            <th class="p-2 border border-zinc-300">Full Name</th>
                            <th class="p-2 border border-zinc-300">Role ID</th>
                            <th class="p-2 border border-zinc-300">Email</th>
                            <th class="p-2 border border-zinc-300">Address</th>
                            <th class="p-2 border border-zinc-300">Delete</th>
                            <th class="p-2 border border-zinc-300">Update</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="user" items="${listUser}">
                            <tr class="bg-zinc-100">
                        <form action="MainController" method="post">
                            <td class="p-2 border border-zinc-300">
                                <input type="text" name="userID" value="${user.userID}" class="w-full p-1 border border-zinc-300 rounded" readonly>
                            </td>
                            <td class="p-2 border border-zinc-300">
                                <input type="text" name="fullName" value="${user.fullName}" class="w-full p-1 border border-zinc-300 rounded">
                            </td>
                            <td class="p-2 border border-zinc-300">
                                <select name="roleID" class="w-full p-1 border border-zinc-300 rounded">
                                    <option value="US" ${user.roleID == 'US' ? 'selected' : ''}>US</option>
                                    <option value="AD" ${user.roleID == 'AD' ? 'selected' : ''}>AD</option>
                                </select>
                            </td>
                            <td class="p-2 border border-zinc-300">
                                <input type="text" name="gmail" value="${user.gmail}" class="w-full p-1 border border-zinc-300 rounded">
                            </td>
                            <td class="p-2 border border-zinc-300">
                                <input type="text" name="address" value="${user.address}" class="w-full p-1 border border-zinc-300 rounded">
                            </td>
                            <td class="p-2 border border-zinc-300">
                                <c:if test="${sessionScope.USER.roleID == 'AD' && user.roleID == 'US'}">
                                    <button type="submit" name="action" value="deleteAccount" class="bg-red-500 text-white p-2 rounded">DELETE</button>
                                </c:if>
                            </td>
                            <td class="p-2 border border-zinc-300">
                                <c:if test="${user.userID == sessionScope.USER.userID || user.roleID == 'US'}">
                                    <button type="submit" name="action" value="updateAccount" class="bg-purple-500 text-white p-2 rounded">UPDATE</button>
                                </c:if>
                            </td>

                        </form>
                        </tr>
                    </c:forEach>
                    </tbody>




                </table>

            </div>
        </div>
        <div class="w-full h-full mt-12 flex justify-around border-t pt-8">
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
        </div>
    </body>

</html>