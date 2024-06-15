<%@page import="dto.tblUsers"%>
<%@page import="dto.tblGlasses"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.GlassesDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Cart Page</title>
        <script src="https://cdn.tailwindcss.com"></script>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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

                <!--header-->
            <jsp:include page="header2.jsp"></jsp:include>

                <div class="container mx-auto px-4 py-8">
                    <div class="flex">

                        <aside class="w-1/4 p-4">
                            <div class="mb-8">
                                <h2 class="font-bold mb-4">CATEGORIES</h2>
                                <ul>
                                    <li><a href="MainController?action=searchCategory&&search=Men" class="text-blue-600">Men</a></li>
                                    <li><a href="MainController?action=searchCategory&&search=Women" class="text-blue-600">Women</a></li>
                                    <li><a href="MainController?action=searchCategory&&search=Sun Glasses" class="text-blue-600">Sun Glasses</a></li>
                                    <li><a href="MainController?action=searchCategory&&search=" class="text-blue-600">All</a></li>
                                </ul>
                            </div>
                            <div>
                                <h2 class="font-bold mb-4">FILTER BY PRICE</h2>
                                <form method="GET" action="MainController">
                                    <input type="hidden" name="action" value="SearchPrice">
                                    <div class="mb-4">
                                        <label for="min-price" class="block">Min Price:</label>
                                        <input type="text" id="min-price" name="minPrice" class="border p-2 w-full">
                                    </div>
                                    <div class="mb-4">
                                        <label for="max-price" class="block">Max Price:</label>
                                        <input type="text" id="max-price" name="maxPrice" class="border p-2 w-full">
                                    </div>
                                    <button type="submit" class="bg-zinc-800 text-white p-2 w-full">Filter</button>
                                </form>
                            </div>

                        </aside>
                    <c:if test="${empty requestScope.listGlasses}">
                        <%
                            ArrayList<tblGlasses> glassesList;
                            GlassesDAO glassesDAO = new GlassesDAO();

                            try {
                                tblUsers user = (tblUsers) session.getAttribute("USER");
                                if (user.getRoleID().equals("AD")) {
                                    glassesList = glassesDAO.listGlasses();
                                } else {
                                    glassesList = glassesDAO.listGlassesForUs();
                                }
                            } catch (Exception e) {
                                glassesList = glassesDAO.listGlassesForUs();
                            }
                            request.setAttribute("listGlasses", glassesList);
                        %>
                    </c:if>

                    <div class="w-3/4">
                        <h2 class="text-2xl font-bold mb-8">Shop All</h2>
                        <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">

                            <c:forEach var="glasses" items="${listGlasses}">
                                <div class="border p-4">
                                    <img src="${pageContext.request.contextPath}/${glasses.image}" alt="Glasses" class="w-full mb-4">
                                    <div class="flex items-center justify-between mb-2">
                                        <h3 class="text-blue-600">${glasses.name}</h3>
                                        <c:if test="${sessionScope.USER.roleID == 'AD'}">
                                            <div class="flex items-center justify-between mb-2">
                                                <div class="flex space-x-2">
                                                    <button
                                                        class="open-modal-btn"
                                                        data-id="${glasses.idGlasses}"
                                                        data-name="${glasses.name}"
                                                        data-description="${glasses.description}"
                                                        data-type="${glasses.type}"
                                                        data-image="${glasses.image}"
                                                        data-price="${glasses.price}"
                                                        data-status="${glasses.status}">
                                                        <svg class="h-6 w-6 text-sky-900" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
                                                        <path stroke="none" d="M0 0h24v24H0z" />
                                                        <path d="M10.325 4.317c.426-1.756 2.924-1.756 3.35 0a1.724 1.724 0 0 0 2.573 1.066c1.543-.94 3.31.826 2.37 2.37a1.724 1.724 0 0 0 1.065 2.572c1.756.426 1.756 2.924 0 3.35a1.724 1.724 0 0 0 -1.066 2.573c.94 1.543-.826 3.31-2.37 2.37a1.724 1.724 0 0 0 -2.572 1.065c-.426 1.756-2.924 1.756-3.35 0a1.724 1.724 0 0 0 -2.573 -1.066c-1.543.94-3.31-.826-2.37-2.37a1.724 1.724 0 0 0 -1.065 -2.572c-1.756-.426-1.756-2.924 0-3.35a1.724 1.724 0 0 0 1.066 -2.573c-.94-1.543.826-3.31 2.37-2.37.996.608 2.296.07 2.572-1.065z" />
                                                        <circle cx="12" cy="12" r="3" />
                                                        </svg>
                                                    </button>
                                                    <a href="MainController?action=deleteGlasses&id=${glasses.idGlasses}">
                                                        <svg class="h-6 w-6 text-red-600" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                                        <polyline points="3 6 5 6 21 6" />
                                                        <path d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6m3 0V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2" />
                                                        <line x1="10" y1="11" x2="10" y2="17" />
                                                        <line x1="14" y1="11" x2="14" y2="17" />
                                                        </svg>
                                                    </a>
                                                </div>
                                            </div>
                                        </c:if>
                                    </div>

                                    <h3 class="text-zinc-600 mb-2">For: ${glasses.type}</h3>
                                    <p class="text-zinc-600 mb-2">${glasses.description}</p>
                                    <p class="text-zinc-900 mb-2">$${glasses.price}</p>


                                    <c:if test="${sessionScope.USER.roleID == 'AD'}">
                                        <p class="text-zinc-900 mb-2 ">Trạng thái: ${glasses.status == true ? 'Đang bán' : 'Không bán'}</p>
                                    </c:if>
                                    <c:if test="${sessionScope.USER.roleID != 'AD'}">
                                        <a href="MainController?action=addToCart&txtItemId=${glasses.idGlasses}" class="bg-blue-600 text-white p-2 w-full text-center block">ADD TO CART</a>
                                    </c:if>

                                </div>
                            </c:forEach>

                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Modal -->
        <div class="fixed left-0 top-0 z-[1055] hidden h-full w-full overflow-y-auto overflow-x-hidden outline-none bg-gray-900 bg-opacity-50" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="relative w-auto pointer-events-none mx-auto mt-7 max-w-[500px] ">
                <div class="relative flex flex-col w-full bg-white rounded-md pointer-events-auto shadow-4 outline-none">
                    <div class="flex items-center justify-between p-4 border-b-2 border-neutral-100 rounded-t-md">
                        <h5 class="text-xl font-medium leading-normal text-surface" id="exampleModalLabel">Modal title</h5>
                        <button type="button" class="box-content border-none rounded-none text-neutral-500 hover:text-neutral-800 hover:no-underline focus:text-neutral-800 focus:opacity-100 focus:shadow-none focus:outline-none" data-twe-modal-dismiss aria-label="Close">
                            <span class="[&>svg]:h-6 [&>svg]:w-6">
                                <svg xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor">
                                <path stroke-linecap="round" stroke-linejoin="round" d="M6 18L18 6M6 6l12 12" />
                                </svg>
                            </span>
                        </button>
                    </div>

                    <!-- Modal body -->
                    <div class="relative flex-auto p-4" data-twe-modal-body-ref>
                        <form id="glassesForm" action="MainController?action=updateProduct" method="POST">
                            <input type="hidden" id="glassesId" name="id">
                            <div class="mb-4">
                                <label for="glassesName" class="block text-sm font-medium text-gray-700">Name</label>
                                <input type="text" id="glassesName" name="name" class="block w-full p-2 mt-1 border rounded" required>
                            </div>
                            <div class="mb-4">
                                <label for="glassesDescription" class="block text-sm font-medium text-gray-700">Description</label>
                                <input type="text" id="glassesDescription" name="description" class="block w-full p-2 mt-1 border rounded" required>
                            </div>
                            <div class="mb-4">
                                <label for="glassesType" class="block text-sm font-medium text-gray-700">Type</label>
                                <select id="glassesType" name="type" class="block w-full p-2 mt-1 border rounded" required>
                                    <option value="">Select Type</option>
                                    <option value="Men">Men</option>
                                    <option value="Women">Women</option>
                                    <option value="Sun Glasses">Sun Glasses</option>
                                </select>
                            </div>
                            <div class="mb-4">
                                <label for="glassesStatus" class="block text-sm font-medium text-gray-700">Status</label>
                                <select id="glassesStatus" name="status" class="block w-full p-2 mt-1 border rounded" required>
                                    <option value="">Select Type</option>
                                    <option value="1">Hoạt động</option>
                                    <option value="0">Không hoạt động</option>
                                </select>
                            </div>
                            <div class="mb-4">
                                <label for="glassesPrice" class="block text-sm font-medium text-gray-700">Price</label>
                                <input type="number" id="glassesPrice" name="price" class="block w-full p-2 mt-1 border rounded" min="1" required>
                            </div>
                            <input type="submit" class="bg-zinc-800 text-white p-2 w-full" value="Update changes">
                        </form>
                    </div>

                    <!-- Modal footer -->
                    <div class="flex flex-wrap items-center justify-end p-4 border-t-2 border-neutral-100 rounded-b-md">
                        <button type="button" class="inline-block px-6 pb-2.5 pt-2 text-xs font-medium uppercase leading-normal text-primary-700 bg-primary-100 rounded transition duration-150 ease-in-out hover:bg-primary-accent-200 focus:bg-primary-accent-200 focus:outline-none focus:ring-0 active:bg-primary-accent-200 dark:bg-primary-300 dark:hover:bg-primary-400 dark:focus:bg-primary-400 dark:active:bg-primary-400" data-twe-modal-dismiss data-twe-ripple-init data-twe-ripple-color="light">Close</button>
                    </div>
                </div>
            </div>
        </div>

        <script>
            $(document).ready(function () {
                $(".open-modal-btn").click(function () {
                    var id = $(this).data("id");
                    var name = $(this).data("name");
                    var description = $(this).data("description");
                    var type = $(this).data("type");
                    var status = $(this).data("status");
                    var price = $(this).data("price");

                    $("#exampleModalLabel").text(name);
                    $("#glassesId").val(id);
                    $("#glassesName").val(name);
                    $("#glassesDescription").val(description);
                    $("#glassesType").val(type);
                    $("#glassesStatus").val(status ? 1 : 0);
                    $("#glassesPrice").val(price);

                    $("#exampleModal").removeClass("hidden").addClass("block");
                });

                $("[data-twe-modal-dismiss]").click(function () {
                    $("#exampleModal").removeClass("block").addClass("hidden");
                });
            });
        </script>

    </body>

</html>
