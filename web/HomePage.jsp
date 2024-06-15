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
                <jsp:include page="notification.jsp"></jsp:include>

                    <body class="bg-gray-100">

                    <jsp:include page="header3.jsp"></jsp:include>

                        </header>

                        <!-- Banner -->
                        <section class="banner-image flex items-center justify-center animate-fade-right animate-once">
                        </section>

                        <!-- Features -->
                        <section class="py-12 bg-gray-100">
                            <div class="container mx-auto px-6">
                                <div class="flex flex-col md:flex-row justify-between items-center space-y-8 md:space-y-0 md:space-x-8">
                                    <div
                                        class="text-center md:text-left mb-8 md:mb-0 p-6 border-2 border-gray-300 rounded-lg animate-flip-up animate-once">
                                        <svg xmlns="http://www.w3.org/2000/svg" class="h-16 w-16 text-blue-500 mx-auto md:mx-0" fill="none"
                                             viewBox="0 0 24 24" stroke="currentColor">
                                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                                  d="M9 12h6m2 4h.01M15 12H9m4 8H5a2 2 0 01-2-2V5a2 2 0 012-2h14a2 2 0 012 2v14a2 2 0 01-2 2h-5m0 0v-4m0 4v-4" />
                                        </svg>
                                        <h3 class="text-xl font-semibold text-gray-800 mt-4">MIỄN PHÍ GIAO HÀNG</h3>
                                        <p class="text-gray-600 mt-2">Tận hưởng dịch vụ giao hàng miễn phí của chúng tôi để đảm bảo kính của
                                            bạn đến nơi an toàn, dù bạn ở đâu. Chúng tôi xử lý tất cả chi phí vận chuyển, giúp trải nghiệm
                                            mua sắm của bạn không phiền hà và thú vị.</p>
                                    </div>
                                    <div
                                        class="text-center md:text-left mb-8 md:mb-0 p-6 border-2 border-gray-300 rounded-lg animate-flip-up animate-once">
                                        <svg xmlns="http://www.w3.org/2000/svg" class="h-16 w-16 text-blue-500 mx-auto md:mx-0" fill="none"
                                             viewBox="0 0 24 24" stroke="currentColor">
                                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                                  d="M19 7H5m14 0a2 2 0 00-2-2h-3.28a2 2 0 00-1.72.78l-1.06 1.42a2 2 0 01-1.72.78H8.78a2 2 0 00-1.72.78l-1.06 1.42a2 2 0 01-1.72.78H5a2 2 0 00-2 2v7a2 2 0 002 2h14a2 2 0 002-2V9a2 2 0 00-2-2z" />
                                        </svg>
                                        <h3 class="text-xl font-semibold text-gray-800 mt-4">ĐỔI TRẢ MIỄN PHÍ</h3>
                                        <p class="text-gray-600 mt-2">Chúng tôi cam kết với chất lượng sản phẩm của mình. Nếu bạn không hoàn
                                            toàn hài lòng với mua hàng của mình, hãy trả lại miễn phí. Chúng tôi tin vào việc làm cho trải
                                            nghiệm của bạn với chúng tôi trở nên mượt mà nhất có thể.</p>
                                    </div>
                                    <div
                                        class="text-center md:text-left p-6 border-2 border-gray-300 rounded-lg animate-flip-up animate-once">
                                        <svg xmlns="http://www.w3.org/2000/svg" class="h-16 w-16 text-blue-500 mx-auto md:mx-0" fill="none"
                                             viewBox="0 0 24 24" stroke="currentColor">
                                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                                  d="M8 10h.01M12 10h.01M16 10h.01M9 16h6M21 12h.01M4 12h.01M21 6h.01M4 6h.01M12 20h.01M12 4h.01M16 16h.01M8 16h.01" />
                                        </svg>
                                        <h3 class="text-xl font-semibold text-gray-800 mt-4">HỖ TRỢ KHÁCH HÀNG</h3>
                                        <p class="text-gray-600 mt-2">Đội ngũ Hỗ Trợ Khách Hàng tận tâm của chúng tôi luôn sẵn sàng giúp bạn
                                            từng bước một. Cho dù bạn có câu hỏi về sản phẩm, cần giúp đỡ với đơn hàng của mình, hay muốn
                                            được tư vấn về việc chọn kính hoàn hảo, chúng tôi luôn sẵn sàng hỗ trợ bạn.</p>
                                    </div>
                                </div>
                            </div>
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


                    <jsp:include page="AboutUs.jsp"></jsp:include>
                    <jsp:include page="reachUs.jsp"></jsp:include>
                    <jsp:include page="footer.jsp"></jsp:include>

                </body>

                </html>