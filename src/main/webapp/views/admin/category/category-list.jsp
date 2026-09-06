<%@ page language="java"
         contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>

<title>Quản lý danh mục</title>

<div class="category-page">

    <div class="category-card">

        <div class="category-card-header">

            <div class="category-title-group">

                <div class="category-title-icon">
                    <i class="bi bi-tags-fill"></i>
                </div>

                <div>
                    <h1 class="category-title">
                        Quản lý danh mục
                    </h1>

                    <p class="category-subtitle">
                        Quản lý, thêm, sửa, xóa các danh mục sản phẩm trong hệ thống.
                    </p>
                </div>

            </div>

            <div class="category-header-actions">

                <div class="category-search">

                    <i class="bi bi-search"></i>

                    <input
                            type="text"
                            id="categorySearch"
                            placeholder="Tìm kiếm danh mục...">

                </div>

                <a class="btn-add-category"
                   href="${pageContext.request.contextPath}/admin/category/add">

                    <i class="bi bi-plus-lg"></i>
                    <span>Add Category</span>

                </a>

            </div>

        </div>

        <c:choose>

            <c:when test="${empty listcate}">

                <div class="category-empty">
                    <i class="bi bi-inbox"></i>
                    <p>Hiện chưa có danh mục nào.</p>
                </div>

            </c:when>

            <c:otherwise>

                <div class="category-table-wrapper">

                    <table class="category-table"
                           id="categoryTable"
                           data-page-size="10">

                        <thead>
                        <tr>
                            <th>STT</th>
                            <th>Images</th>
                            <th>Category name</th>
                            <th>Status</th>
                            <th>Action</th>
                        </tr>
                        </thead>

                        <tbody>

                        <c:forEach
                                items="${listcate}"
                                var="cate"
                                varStatus="STT">

                            <tr>

                                <td class="category-stt">
                                        ${STT.index + 1}
                                </td>

                                <td class="category-image-cell">

                                    <c:choose>

                                        <c:when test="${empty cate.images}">

                                            <div class="category-no-image">
                                                <i class="bi bi-image"></i>
                                                <span>Chưa có ảnh</span>
                                            </div>

                                        </c:when>

                                        <c:when test="${fn:startsWith(cate.images, 'http://')
                                                or fn:startsWith(cate.images, 'https://')}">

                                            <div class="category-image-box">
                                                <img
                                                        src="${cate.images}"
                                                        alt="${cate.categoryname}">
                                            </div>

                                        </c:when>

                                        <c:otherwise>

                                            <c:url
                                                    value="/image"
                                                    var="imageUrl">

                                                <c:param
                                                        name="fname"
                                                        value="${cate.images}"/>

                                            </c:url>

                                            <div class="category-image-box">
                                                <img
                                                        src="${imageUrl}"
                                                        alt="${cate.categoryname}">
                                            </div>

                                        </c:otherwise>

                                    </c:choose>

                                </td>

                                <td class="category-name">
                                        ${cate.categoryname}
                                </td>

                                <td>

                                    <c:choose>

                                        <c:when test="${cate.status == 1}">

                                            <span class="status-badge status-active">
                                                <span class="status-dot"></span>
                                                Hoạt động
                                            </span>

                                        </c:when>

                                        <c:otherwise>

                                            <span class="status-badge status-inactive">
                                                <span class="status-dot"></span>
                                                Khóa
                                            </span>

                                        </c:otherwise>

                                    </c:choose>

                                </td>

                                <td>

                                    <c:url
                                            value="/admin/category/edit"
                                            var="editUrl">

                                        <c:param
                                                name="id"
                                                value="${cate.categoryid}"/>

                                    </c:url>

                                    <div class="category-actions">

                                        <a class="action-edit"
                                           href="${editUrl}">
                                            <i class="bi bi-pencil-square"></i>
                                            <span>Sửa</span>
                                        </a>

                                        <span class="action-divider"></span>

                                        <form action="${pageContext.request.contextPath}/admin/category/delete"
                                              method="post"
                                              class="delete-inline-form">
                                            <input type="hidden"
                                                   name="id"
                                                   value="${cate.categoryid}">
                                            <button type="submit"
                                                    class="action-delete"
                                                    onclick="return confirm('Bạn có chắc muốn xóa danh mục này?');">
                                                <i class="bi bi-trash3"></i>
                                                <span>Xóa</span>
                                            </button>
                                        </form>

                                    </div>

                                </td>

                            </tr>

                        </c:forEach>

                        </tbody>

                    </table>

                </div>

                <div class="table-footer">

                    <div class="table-info"
                         id="categoryTableInfo">
                        Hiển thị danh mục
                    </div>

                    <div class="table-pagination"
                         id="categoryPagination"></div>

                </div>

            </c:otherwise>

        </c:choose>

    </div>

</div>
