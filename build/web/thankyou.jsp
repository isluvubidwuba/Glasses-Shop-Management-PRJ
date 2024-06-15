<%@page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                <div class="min-h-screen flex flex-col items-center justify-center bg-white text-zinc-800">
                <c:choose>
                    <c:when test="${requestScope.message == 'success'}">
                        <div class="text-center">
                            <img aria-hidden="true" alt="check" src="https://img.freepik.com/premium-vector/hand-drawn-vintage-vector-text-thank-you-heart-calligraphy-lettering-illustration-wedding-thanksgiving_81863-5226.jpg?w=300" class="mx-auto" />
                            <p class="text-zinc-600 mb-6">Your order was successfully completed.</p>
                            <a href="Shop.jsp" class="bg-purple-500 text-white px-4 py-2 rounded-lg">Back to Shop</a>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <div class="text-center">
                            <img aria-hidden="true" alt="error" src="https://images.vexels.com/content/128332/preview/oops-bubble-svg-8e65f2.png" class="mx-auto" />
                            <p class="text-zinc-600 mb-6">There was an issue with your order. Please try again.</p>
                            <a href="Shop.jsp" class="bg-purple-500 text-white px-4 py-2 rounded-lg">Back to Shop</a>
                        </div>
                    </c:otherwise>
                </c:choose>
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
            </div>
        </div>
    </body>

</html>
