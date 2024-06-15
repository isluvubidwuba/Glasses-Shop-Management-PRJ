<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>

    <head>
        <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Trang Giỏ Hàng</title>
                <script src="https://cdn.tailwindcss.com"></script>
                <style>
                    .nav-link {
                        transition: all 0.3s ease;
                    }

                    .nav-link:hover {
                        transform: translateY(-5px);
                        text-align: center;
                    }

                    .file-input-container {
                        display: flex;
                        flex-direction: column;
                        align-items: center;
                        justify-content: center;
                        width: 100%;
                    }

                    .file-input {
                        width: 100%;
                        height: 150px;
                        border: 2px dashed #ccc;
                        border-radius: 8px;
                        display: flex;
                        align-items: center;
                        justify-content: center;
                        background-color: #f8f8f8;
                        cursor: pointer;
                        margin-top: 10px;
                    }

                    .file-input.small {
                        width: auto;
                        height: auto;
                        padding: 10px;
                        border: 2px solid #ccc;
                        background-color: transparent;
                        margin-top: 10px;
                    }

                    .file-input input[type="file"] {
                        display: none;
                    }

                    .file-input-label {
                        text-align: center;
                        font-size: 14px;
                        color: #999;
                    }

                    .image-preview {
                        width: 100%;
                        height: auto;
                        margin-bottom: 10px;
                        border-radius: 8px;
                    }
                </style>
                <script>
                    function previewImage(event) {
                        const reader = new FileReader();
                        reader.onload = function () {
                            const output = document.getElementById('imagePreview');
                            output.src = reader.result;
                            output.style.display = 'block';

                            const fileInput = document.querySelector('.file-input');
                            fileInput.classList.add('small');
                            fileInput.querySelector('.file-input-label').innerText = 'Đổi ảnh';
                        };
                        reader.readAsDataURL(event.target.files[0]);
                    }

                    function validateForm() {
                        const fileInput = document.getElementById('dropzone-file');
                        if (fileInput.files.length === 0) {
                            alert('Vui lòng chọn một tệp để tải lên.');
                            return false;
                        }
                        return true;
                    }
                </script>
                </head>

                <body>
                    <div class="bg-white text-zinc-900">
                        <jsp:include page="notification.jsp"></jsp:include>

                        <jsp:include page="header2.jsp"></jsp:include>

                        <div class="bg-white p-6 rounded-lg shadow-md max-w-6xl mx-auto">
                            <h2 class="text-2xl font-semibold mb-6">Tạo Kính</h2>
                            <form action="MainController?action=createGlasses" method="POST" enctype="multipart/form-data" onsubmit="return validateForm()">
                                <div class="grid grid-cols-1 md:grid-cols-12 gap-6">
                                    <div class="md:col-span-4 flex items-center justify-center w-full file-input-container">
                                        <img id="imagePreview" class="image-preview" style="display: none;" />
                                        <label for="dropzone-file" class="file-input">
                                            <div class="file-input-label">
                                                <svg class="w-6 h-6 mb-2 text-gray-500 dark:text-gray-400" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 20 16">
                                                    <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M13 13h3a3 3 0 0 0 0-6h-.025A5.56 5.56 0 0 0 16 6.5 5.5 5.5 0 0 0 5.207 5.021C5.137 5.017 5.071 5 5 5a4 4 0 0 0 0 8h2.167M10 15V6m0 0L8 8m2-2 2 2" />
                                                </svg>
                                                <span>Click để tải lên</span>
                                            </div>
                                            <input id="dropzone-file" type="file" name="image" onchange="previewImage(event)" required />
                                        </label>
                                    </div>
                                    <div class="md:col-span-8">
                                        <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                                            <div>
                                                <label class="block text-sm font-medium text-gray-700 mb-1">ID <span class="text-red-500">*</span></label>
                                                <input type="text" name="idGlasses" class="w-full border border-gray-300 p-2 rounded-md" required />
                                            </div>
                                            <div>
                                                <label class="block text-sm font-medium text-gray-700 mb-1">Tên <span class="text-red-500">*</span></label>
                                                <input type="text" name="name" class="w-full border border-gray-300 p-2 rounded-md" required />
                                            </div>
                                            <div>
                                                <label class="block text-sm font-medium text-gray-700 mb-1">Mô tả</label>
                                                <input type="text" name="description" class="w-full border border-gray-300 p-2 rounded-md" />
                                            </div>
                                            <div>
                                                <label class="block text-sm font-medium text-gray-700 mb-1">Loại</label>
                                                <select name="type" class="w-full border border-gray-300 p-2 rounded-md" required>
                                                    <option value="Men">Men</option>
                                                    <option value="Women">Women</option>
                                                    <option value="Sun Glasses">Sun Glasses</option>
                                                </select>
                                            </div>
                                            <div>
                                                <label class="block text-sm font-medium text-gray-700 mb-1">Giá <span class="text-red-500">*</span></label>
                                                <input type="number" name="price" class="w-full border border-gray-300 p-2 rounded-md" min="1" required />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="mt-6">
                                    <button type="submit" class="bg-purple-500 text-white py-2 px-4 rounded-md w-full md:w-auto">TẠO</button>
                                </div>
                            </form>
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
