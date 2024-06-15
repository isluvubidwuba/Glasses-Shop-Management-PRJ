<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About us</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
        .nav-link {
            transition: all 0.3s ease;
        }

        .nav-link:hover {
            transform: translateY(-5px);
            text-align: center;
        }

        @keyframes fadeUp {
            from {
                opacity: 0;
                transform: translateY(20px);
            }

            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .animate-fade-up {
            animation: fadeUp 0.5s ease-out;
        }
    </style>

</head>

<body>
    <div class="bg-white text-zinc-900" id="aboutUs">

        <div class="flex flex-col md:flex-row items-center bg-white p-6 mt-10 animate-fade-up">
            <div class="flex justify-center md:w-1/2">
                <img src="https://images.pexels.com/photos/839586/pexels-photo-839586.jpeg?auto=compress&cs=tinysrgb&w=600" alt="glasses" class="rounded-lg shadow-lg">
            </div>
            <div class="md:w-1/2 md:pl-6 mt-4 md:mt-0">
                <h2 class="text-2xl font-bold text-zinc-800">How We Started</h2>
                <p class="text-zinc-600 mt-4">
                    Starting from a small store, My Glasses quickly gained popularity due to its commitment to quality,
                    customer service, and variety in designs. Each pair of glasses was crafted with meticulous attention
                    to
                    detail, ensuring comfort and durability. Despite the challenges faced in the early stages, My
                    Glasses
                    persevered, driven by the belief that good vision should be accessible to all.
                </p>
                <p class="text-zinc-600 mt-4">
                    Our journey is a testament to our dedication and passion for what we do. As we continue to grow, we
                    remain committed to our mission of providing high-quality, stylish glasses for everyone.
                </p>
            </div>
        </div>


    </div>
</body>

</html>