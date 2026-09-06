<%@ page language="java"
         contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>

<title>Sửa sản phẩm</title>

<c:choose>
    <c:when test="${not empty product.image}">
        <c:choose>
            <c:when test="${fn:startsWith(product.image, 'http://')
                    or fn:startsWith(product.image, 'https://')}">
                <c:set var="productImageUrl" value="${product.image}" />
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

<div class="product-form-page">

    <div class="product-form-card">

        <div class="product-form-header">

            <div class="product-form-title-group">

                <div class="product-form-icon">
                    <i class="bi bi-pencil-square"></i>
                </div>

                <div>
                    <h1>Sửa sản phẩm</h1>

                    <p>
                        Cập nhật thông tin sản phẩm, tồn kho, ảnh và trạng thái.
                    </p>
                </div>

            </div>

            <a href="${pageContext.request.contextPath}/admin/products"
               class="btn-back-product">

                <i class="bi bi-arrow-left"></i>
                Quay lại

            </a>

        </div>

        <form action="${pageContext.request.contextPath}/admin/product/update"
              method="post"
              enctype="multipart/form-data"
              class="product-form">

            <input type="hidden"
                   name="productId"
                   value="${product.productId}">

            <div class="product-form-grid">

                <div class="form-group">

                    <label for="productName">
                        Tên sản phẩm
                        <span class="required">*</span>
                    </label>

                    <div class="input-icon-wrapper">

                        <i class="bi bi-box"></i>

                        <input type="text"
                               id="productName"
                               name="productName"
                               class="form-control"
                               value="${product.productName}"
                               required>

                    </div>

                </div>

                <div class="form-group">

                    <label for="productPrice">
                        Giá
                        <span class="required">*</span>
                    </label>

                    <div class="input-icon-wrapper">

                        <i class="bi bi-cash"></i>

                        <input type="number"
                               id="productPrice"
                               name="price"
                               class="form-control"
                               min="0"
                               step="0.01"
                               value="${product.price}"
                               required>

                    </div>

                </div>

            </div>

            <div class="product-form-grid">

                <div class="form-group">

                    <label for="productQuantity">
                        Số lượng
                    </label>

                    <div class="input-icon-wrapper">

                        <i class="bi bi-123"></i>

                        <input type="number"
                               id="productQuantity"
                               name="quantity"
                               class="form-control"
                               min="0"
                               value="${product.quantity}"
                               required>

                    </div>

                </div>

                <div class="form-group">

                    <label for="categoryId">
                        Category
                        <span class="required">*</span>
                    </label>

                    <select id="categoryId"
                            name="categoryId"
                            class="form-select"
                            required>

                        <c:forEach items="${listCategory}"
                                   var="category">

                            <option value="${category.categoryid}"
                                    ${category.categoryid == product.category.categoryid ? 'selected' : ''}>
                                    ${category.categoryname}
                            </option>

                        </c:forEach>

                    </select>

                </div>

            </div>

            <div class="form-group">

                <label for="productImage">
                    Ảnh sản phẩm
                </label>

                <div class="product-upload-layout">

                    <div class="product-upload-area">

                        <input type="file"
                               id="productImage"
                               name="imageFile"
                               accept="image/*"
                               hidden>

                        <label for="productImage"
                               class="product-upload-label">

                            <div class="product-upload-icon">
                                <i class="bi bi-cloud-arrow-up"></i>
                            </div>

                            <div>
                                <strong>Chọn ảnh mới</strong>
                                <span>Không chọn ảnh mới thì giữ nguyên ảnh hiện tại.</span>
                            </div>

                        </label>

                    </div>

                    <div class="product-image-preview">

                        <img id="productImagePreview"
                             src="${productImageUrl}"
                             alt="${product.productName}"
                             style="${not empty productImageUrl ? 'display: block;' : ''}">

                        <div id="productImagePreviewEmpty"
                             class="product-image-preview-empty"
                             style="${not empty productImageUrl ? 'display: none;' : ''}">

                            <i class="bi bi-image"></i>
                            <span>Chưa có ảnh</span>

                        </div>

                    </div>

                </div>

            </div>

            <div class="form-group">

                <label for="productDescription">
                    Mô tả
                </label>

                <textarea id="productDescription"
                          name="description"
                          class="form-control product-description-input"
                          rows="5"
                          placeholder="Nhập mô tả ngắn cho sản phẩm...">${product.description}</textarea>

                <div class="description-counter">
                    <span id="descriptionCount">0</span>/500
                </div>

            </div>

            <div class="form-group">

                <label>
                    Trạng thái
                </label>

                <div class="product-status-options">

                    <label class="product-status-option">

                        <input type="radio"
                               name="status"
                               value="1"
                               ${product.status == 1 ? 'checked' : ''}>

                        <div class="product-status-content">

                            <span class="status-dot-green"></span>

                            <div>
                                <strong>Hoạt động</strong>
                                <small>Sản phẩm được hiển thị trên hệ thống</small>
                            </div>

                        </div>

                    </label>

                    <label class="product-status-option">

                        <input type="radio"
                               name="status"
                               value="0"
                               ${product.status == 0 ? 'checked' : ''}>

                        <div class="product-status-content">

                            <span class="status-dot-red"></span>

                            <div>
                                <strong>Khóa</strong>
                                <small>Sản phẩm tạm thời không hiển thị</small>
                            </div>

                        </div>

                    </label>

                </div>

            </div>

            <div class="product-form-actions">

                <a href="${pageContext.request.contextPath}/admin/products"
                   class="btn-product-cancel">
                    Hủy
                </a>

                <button type="submit"
                        class="btn-product-submit">
                    <i class="bi bi-check2-circle"></i>
                    Cập nhật sản phẩm
                </button>

            </div>

        </form>

    </div>

</div>
