<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- Hiển thị thông báo -->
<c:if test="${not empty requestScope.updateStatus}">
    <div class="bg-green-100 border border-green-400 text-green-700 px-4 py-3 rounded relative" role="alert">
        <strong class="font-bold">Thông báo:</strong>
        <span class="block sm:inline">${requestScope.updateStatus}</span>
        <button type="button" class="absolute top-0 bottom-0 right-0 px-4 py-3" onclick="this.parentElement.style.display = 'none';">
            <svg class="fill-current h-6 w-6 text-green-500" role="button" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20"><path d="M14.348 5.652a1 1 0 011.415 0c.39.391.39 1.024 0 1.415L11.414 11l4.349 4.348a1 1 0 01-1.415 1.415L10 12.414l-4.348 4.349a1 1 0 01-1.415-1.415L8.586 11 4.236 6.652a1 1 0 011.415-1.415L10 9.586l4.348-4.349z"/></svg>
        </button>
    </div>
</c:if>
<c:remove var="updateStatus" scope="request"/>