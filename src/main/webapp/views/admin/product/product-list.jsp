<%@ page language="java"
         contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

<fmt:setLocale value="vi_VN" />

<title>Danh sách sản phẩm</title>

<div class="product-page">

    <div class="product-card">

        <div class="product-card-header">

            <div class="product-title-group">

                <div class="product-title-icon">
                    <i class="bi bi-box-seam-fill"></i>
                </div>

                <div>
                    <h1>Danh sách sản phẩm</h1>

                    <p>
                        Quản lý sản phẩm, giá bán, tồn kho và trạng thái trong hệ thống.
                    </p>
                </div>

            </div>

            <a href="${pageContext.request.contextPath}/admin/product/add"
               class="btn-add-product">

                <i class="bi bi-plus-lg"></i>
                Thêm sản phẩm

            </a>

        </div>

        <div class="product-toolbar">

            <div class="product-search">

                <i class="bi bi-search"></i>

                <input
                        type="text"
                        id="productSearch"
                        placeholder="Tìm kiếm sản phẩm...">

            </div>

            <div class="product-filter">

                <i class="bi bi-funnel"></i>

                <select id="productCategoryFilter">
                    <option value="">Lọc Category</option>

                    <c:forEach
                            items="${listCategory}"
                            var="category">

                        <option value="${category.categoryname}">
                                ${category.categoryname}
                        </option>

                    </c:forEach>
                </select>

            </div>

        </div>

        <c:choose>

            <c:when test="${empty listProduct}">

                <div class="product-empty">
                    <i class="bi bi-inbox"></i>
                    <p>Hiện chưa có sản phẩm nào.</p>
                </div>

            </c:when>

            <c:otherwise>

                <div class="product-table-wrapper">

                    <table
                            class="product-table"
                            id="productTable"
                            data-page-size="10">

                        <thead>
                        <tr>
                            <th>STT</th>
                            <th>Ảnh</th>
                            <th>Tên sản phẩm</th>
                            <th>Giá</th>
                            <th>SL</th>
                            <th>Mô tả</th>
                            <th>Category</th>
                            <th>Trạng thái</th>
                            <th>Ngày tạo</th>
                            <th>Action</th>
                        </tr>
                        </thead>

                        <tbody>

                        <c:forEach
                                items="${listProduct}"
                                var="product"
                                varStatus="stt">

                            <c:choose>
                                <c:when test="${not empty product.image}">
                                    <c:choose>
                                        <c:when test="${fn:startsWith(product.image, 'http://')
                                                or fn:startsWith(product.image, 'https://')}">
                                            <c:set var="productImageUrl"
                                                   value="${product.image}" />
                                        </c:when>
                                        <c:otherwise>
                                            <c:set var="productImageUrl"
                                                   value="${pageContext.request.contextPath}/image?fname=${product.image}" />
                                        </c:otherwise>
                                    </c:choose>
                                </c:when>
                                <c:otherwise>
                                    <c:set var="productImageUrl" value="" />
                                </c:otherwise>
                            </c:choose>

                            <tr data-category="${product.category.categoryname}">

                                <td class="product-stt">
                                        ${stt.index + 1}
                                </td>

                                <td>

                                    <c:choose>

                                        <c:when test="${not empty productImageUrl}">

                                            <div class="product-image-box">

                                                <img
                                                        src="${productImageUrl}"
                                                        alt="${product.productName}"
                                                        onerror="this.onerror=null; this.src='${pageContext.request.contextPath}/assets/frontend/images/product-default.svg';">

                                            </div>

                                        </c:when>

                                        <c:otherwise>

                                            <div class="product-no-image">
                                                <i class="bi bi-image"></i>
                                            </div>

                                        </c:otherwise>

                                    </c:choose>

                                </td>

                                <td>

                                    <div class="product-name-cell">
                                        <strong>
                                                ${product.productName}
                                        </strong>
                                    </div>

                                </td>

                                <td>

                                    <span class="product-price">
                                        <fmt:formatNumber
                                                value="${product.price}"
                                                type="number"
                                                groupingUsed="true"
                                                maxFractionDigits="0" /> đ
                                    </span>

                                </td>

                                <td>
                                    <span class="quantity-badge">
                                            ${product.quantity}
                                    </span>
                                </td>

                                <td>
                                    <div
                                            class="product-description"
                                            title="${product.description}">
                                            ${product.description}
                                    </div>
                                </td>

                                <td>

                                    <span class="category-pill">
                                            ${product.category.categoryname}
                                    </span>

                                </td>

                                <td>

                                    <c:choose>

                                        <c:when test="${product.status == 1}">

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
                                    <span class="product-date">
                                            ${product.createdDate}
                                    </span>
                                </td>

                                <td>

                                    <div class="product-actions">

                                        <a href="${pageContext.request.contextPath}/admin/product/edit?id=${product.productId}"
                                           class="action-edit">
                                            <i class="bi bi-pencil-square"></i>
                                            Sửa
                                        </a>

                                        <span class="action-divider"></span>

                                        <form action="${pageContext.request.contextPath}/admin/product/delete"
                                              method="post"
                                              class="delete-inline-form">
                                            <input type="hidden"
                                                   name="id"
                                                   value="${product.productId}">
                                            <button type="submit"
                                                    class="action-delete"
                                                    onclick="return confirm('Bạn có chắc muốn xóa sản phẩm này?');">
                                                <i class="bi bi-trash3"></i>
                                                Xóa
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
                         id="productTableInfo">
                        Hiển thị sản phẩm
                    </div>

                    <div class="table-pagination"
                         id="productPagination"></div>

                </div>

            </c:otherwise>

        </c:choose>

    </div>

</div>
