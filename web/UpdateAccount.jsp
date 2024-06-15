<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

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

                <!-- Header -->
            <jsp:include page="header2.jsp"></jsp:include>
                <div class="flex justify-center items-center max-h-screen bg-zinc-100 pt-10">
                    <div class="bg-white p-8 rounded-lg shadow-md w-full max-w-md">
                        <h2 class="text-center text-2xl font-semibold mb-6">Account Information</h2>
                        <form method="POST" action="MainController?action=UpdateAccount">
                            <div class="grid grid-cols-1 gap-6">
                                <div class="grid grid-cols-2 gap-4">
                                    <div>
                                        <label for="user-id" class="block text-sm font-medium text-zinc-700">User ID</label>
                                        <input type="text" id="user-id" name="userID"
                                               class="mt-1 block w-full p-2 border border-zinc-300 rounded-md" value="${USER.userID}" readonly>
                                </div>
                                <div>
                                    <label for="full-name" class="block text-sm font-medium text-zinc-700">Full Name</label>
                                    <input type="text" id="full-name" name="fullName"
                                           class="mt-1 block w-full p-2 border border-zinc-300 rounded-md" value="${USER.fullName}">
                                </div>
                            </div>
                            <div>
                                <label for="email" class="block text-sm font-medium text-zinc-700">E Mail</label>
                                <input type="email" id="email" name="email"
                                       class="mt-1 block w-full p-2 border border-zinc-300 rounded-md" value="${USER.gmail}">
                            </div>
                            <div>
                                <label for="address" class="block text-sm font-medium text-zinc-700">Address</label>
                                <input type="text" id="address" name="address"
                                       class="mt-1 block w-full p-2 border border-zinc-300 rounded-md" value="${USER.address}">
                            </div>
                            <div>
                                <label for="old-password" class="block text-sm font-medium text-zinc-700">Old Password</label>
                                <input type="password" id="old-password" name="oldPassword"
                                       class="mt-1 block w-full p-2 border border-zinc-300 rounded-md">
                            </div>
                            <div>
                                <label for="new-password" class="block text-sm font-medium text-zinc-700">New Password</label>
                                <input type="password" id="new-password" name="newPassword"
                                       class="mt-1 block w-full p-2 border border-zinc-300 rounded-md">
                            </div>
                            <div>
                                <label for="confirm-password" class="block text-sm font-medium text-zinc-700">Confirm New Password</label>
                                <input type="password" id="confirm-password" name="confirmPassword"
                                       class="mt-1 block w-full p-2 border border-zinc-300 rounded-md">
                            </div>
                            <div>
                                <button type="submit"
                                        class="w-full py-2 px-4 bg-purple-500 text-white font-semibold rounded-md hover:bg-purple-600">UPDATE
                                    USER</button>
                            </div>
                        </div>
                    </form>
                    <!-- Hiển thị thông báo lỗi nếu có -->
                    <div class="text-red-500 text-sm mt-2 text-center">
                        <c:if test="${not empty ERROR}">
                            ${ERROR}
                        </c:if>
                    </div>
                    <div class="text-green-500 text-sm mt-2 text-center">
                        <c:if test="${not empty SUCCESS}">
                            ${SUCCESS}
                        </c:if>
                    </div>
                </div>
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