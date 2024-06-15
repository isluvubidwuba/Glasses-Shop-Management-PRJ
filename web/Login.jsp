<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Login Page</title>
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

    <body class="bg-gray-100">
        <jsp:include page="notification.jsp"></jsp:include>

            <!-- Header -->
        <jsp:include page="header.jsp"></jsp:include>
        <c:set var="cookie" value="${pageContext.request.cookies}"/>

        <!-- Login Form -->
        <div class="flex items-center justify-center max-h-screen mt-10">
            <div class="w-full max-w-sm bg-white p-8 border border-gray-300 rounded-lg shadow-lg">
                <h2 class="text-center text-2xl font-bold text-gray-800">Login</h2>
                <form class="mt-8 space-y-6" method="POST" action="MainController">
                    <input type="hidden" name="action" value="Login">
                    <div>
                        <label for="identifier" class="block text-sm font-medium text-gray-700">UserID or Email <span class="text-red-500">*</span></label>
                        <input id="identifier" name="identifier" type="text" value="${cookie.cuser.value}" autocomplete="identifier" required
                               class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm placeholder-gray-400 focus:outline-none focus:ring-purple-500 focus:border-purple-500 sm:text-sm">
                    </div>
                    <div>
                        <label for="password" class="block text-sm font-medium text-gray-700">Password <span class="text-red-500">*</span></label>
                        <input id="password" value="${cookie.cpass.value}" name="password" type="password" autocomplete="current-password" required
                               class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm placeholder-gray-400 focus:outline-none focus:ring-purple-500 focus:border-purple-500 sm:text-sm">
                    </div>
                    <div class="flex items-center">
                        <input id="remember_me" name="remember_me" type="checkbox" ${(cookie.crem != null ?'checked':'')}
                               class="h-4 w-4 text-purple-600 focus:ring-purple-500 border-gray-300 rounded">
                        <label for="remember_me" class="ml-2 block text-sm text-gray-900">Remember me</label>
                    </div>
                    <div>
                        <button type="submit" id="loginButton"
                                class="w-full flex justify-center py-2 px-4 border border-transparent rounded-md shadow-sm text-sm font-medium text-white bg-purple-600 hover:bg-purple-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-purple-500">Login</button>
                    </div>
                    <!-- Hiển thị thông báo lỗi nếu có -->
                    <div class="text-red-500 text-sm mt-2 text-center">
                        <c:if test="${not empty ERROR}">
                            ${ERROR}
                        </c:if>
                    </div>
                </form>
                <p class="mt-4 text-center text-gray-600">Chưa có tài khoản? <a href="Register.jsp"
                                                                                class="text-purple-600 hover:underline">Đăng ký ngay</a></p>
            </div>
        </div>




    </body>

</html>