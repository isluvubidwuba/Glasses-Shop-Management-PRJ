<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html lang="en">

    <head>
        <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Home Page</title>
                <script src="https://cdn.tailwindcss.com"></script>

                <style>
                    .nav-link {
                        transition: all 0.3s ease;
                    }

                    .nav-link:hover {
                        transform: translateY(-5px);
                        text-align: center;
                    }

                    .banner-image {
                        background-image: url('https://images.pexels.com/photos/131018/pexels-photo-131018.jpeg?auto=compress&cs=tinysrgb&w=1600');
                        background-size: cover;
                        background-position: center;
                        height: 24rem;
                        /* h-96 */
                    }

                    @keyframes fadeRight {
                        from {
                            opacity: 0;
                            transform: translateX(-50px);
                        }

                        to {
                            opacity: 1;
                            transform: translateX(0);
                        }
                    }

                    @keyframes flip-up {
                        0% {
                            transform: rotateX(-90deg);
                            opacity: 0;
                        }

                        100% {
                            transform: rotateX(0);
                            opacity: 1;
                        }
                    }

                    .animate-flip-up {
                        animation: flip-up 1s ease-out;
                    }

                    .animate-fade-right {
                        animation: fadeRight 1s ease-in-out forwards;
                    }

                    .animate-once {
                        animation-iteration-count: 1;
                    }
                </style>
                </head>

                <body class="bg-gray-100">

                    <jsp:include page="header3.jsp"></jsp:include>

                        </header>

                        <!-- Banner -->
                        <section class="banner-image flex items-center justify-center animate-fade-right animate-once">
                        </section>




                        <!-- Collections -->
                        <section class="py-12 bg-white">
                            <div class="container mx-auto px-6">
                                <div class="grid grid-cols-1 md:grid-cols-3 gap-8">
                                    <div class="relative group">
                                        <a href="MainController?action=searchCategory&&search=Women">
                                            <img src="https://thetintedstory.com/cdn/shop/products/0B0A7172_1.jpg?v=1661516213"
                                                 alt="Women Glasses" class="w-full h-80 object-cover">
                                                <div
                                                    class="absolute bottom-0 left-0 w-full bg-gradient-to-t from-black to-transparent text-white p-4">
                                                    <h3 class="text-lg font-semibold">Women Glasses</h3>
                                                    <p class="text-sm">COLLECTIONS</p>
                                                </div>
                                        </a>
                                    </div>
                                    <div class="relative group">
                                        <a href="MainController?action=searchCategory&&search=Sun Glasses">
                                            <img src="https://images.pexels.com/photos/704241/pexels-photo-704241.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"
                                                 alt="Sun Glasses" class="w-full h-80 object-cover">
                                                <div
                                                    class="absolute bottom-0 left-0 w-full bg-gradient-to-t from-black to-transparent text-white p-4">
                                                    <h3 class="text-lg font-semibold">Sun Glasses</h3>
                                                    <p class="text-sm">COLLECTIONS</p>
                                                </div>
                                        </a>
                                    </div>
                                    <div class="relative group">
                                        <a href="MainController?action=searchCategory&&search=Men">
                                            <img src="https://images.pexels.com/photos/1627639/pexels-photo-1627639.jpeg?auto=compress&cs=tinysrgb&w=1600"
                                                 alt="Men Glasses" class="w-full h-80 object-cover">
                                                <div
                                                    class="absolute bottom-0 left-0 w-full bg-gradient-to-t from-black to-transparent text-white p-4">
                                                    <h3 class="text-lg font-semibold">Men Glasses</h3>
                                                    <p class="text-sm">COLLECTIONS</p>
                                                </div>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </section>
                </body>

                </html>