<%@ page language="java"
         contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<title>Thêm sản phẩm</title>

<div class="product-form-page">

    <div class="product-form-card">

        <div class="product-form-header">

            <div class="product-form-title-group">

                <div class="product-form-icon">
                    <i class="bi bi-box-seam-fill"></i>
                </div>

                <div>
                    <h1>Thêm sản phẩm</h1>

                    <p>
                        Tạo sản phẩm mới và thêm vào hệ thống quản lý.
                    </p>
                </div>

            </div>

            <a href="${pageContext.request.contextPath}/admin/products"
               class="btn-back-product">

                <i class="bi bi-arrow-left"></i>
                Quay lại

            </a>

        </div>

        <form
                action="${pageContext.request.contextPath}/admin/product/insert"
                method="post"
                enctype="multipart/form-data"
                class="product-form">

            <div class="product-form-grid">

                <div class="form-group">

                    <label for="productName">
                        Tên sản phẩm
                        <span class="required">*</span>
                    </label>

                    <div class="input-icon-wrapper">

                        <i class="bi bi-box"></i>

                        <input
                                type="text"
                                id="productName"
                                name="productName"
                                class="form-control"
                                placeholder="Ví dụ: ASUS Vivobook 15"
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

                        <input
                                type="number"
                                id="productPrice"
                                name="price"
                                class="form-control"
                                placeholder="Ví dụ: 18500000"
                                min="0"
                                step="0.01"
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

                        <input
                                type="number"
                                id="productQuantity"
                                name="quantity"
                                class="form-control"
                                value="0"
                                min="0"
                                required>

                    </div>

                </div>

                <div class="form-group">

                    <label for="categoryId">
                        Category
                        <span class="required">*</span>
                    </label>

                    <select
                            id="categoryId"
                            name="categoryId"
                            class="form-select"
                            required>

                        <option value="">
                            -- Chọn Category --
                        </option>

                        <c:forEach
                                items="${listCategory}"
                                var="category">

                            <option value="${category.categoryid}">
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

                        <input
                                type="file"
                                id="productImage"
                                name="imageFile"
                                accept="image/*"
                                hidden>

                        <label
                                for="productImage"
                                class="product-upload-label">

                            <div class="product-upload-icon">
                                <i class="bi bi-cloud-arrow-up"></i>
                            </div>

                            <div>
                                <strong>
                                    Chọn ảnh sản phẩm
                                </strong>

                                <span>
                                    PNG, JPG, JPEG - tối đa 5MB
                                </span>
                            </div>

                        </label>

                    </div>

                    <div class="product-image-preview">

                        <img
                                id="productImagePreview"
                                src=""
                                alt="Preview">

                        <div
                                id="productImagePreviewEmpty"
                                class="product-image-preview-empty">

                            <i class="bi bi-image"></i>

                            <span>
                                Chưa có ảnh
                            </span>

                        </div>

                    </div>

                </div>

            </div>

            <div class="form-group">

                <label for="productDescription">
                    Mô tả
                </label>

                <textarea
                        id="productDescription"
                        name="description"
                        class="form-control product-description-input"
                        rows="5"
                        placeholder="Nhập mô tả ngắn cho sản phẩm..."></textarea>

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

                        <input
                                type="radio"
                                name="status"
                                value="1"
                                checked>

                        <div class="product-status-content">

                            <span class="status-dot-green"></span>

                            <div>
                                <strong>
                                    Hoạt động
                                </strong>

                                <small>
                                    Sản phẩm được hiển thị trên hệ thống
                                </small>
                            </div>

                        </div>

                    </label>

                    <label class="product-status-option">

                        <input
                                type="radio"
                                name="status"
                                value="0">

                        <div class="product-status-content">

                            <span class="status-dot-red"></span>

                            <div>
                                <strong>
                                    Khóa
                                </strong>

                                <small>
                                    Sản phẩm tạm thời không hiển thị
                                </small>
                            </div>

                        </div>

                    </label>

                </div>

            </div>

            <div class="product-form-actions">

                <a
                        href="${pageContext.request.contextPath}/admin/products"
                        class="btn-product-cancel">

                    Hủy

                </a>

                <button
                        type="submit"
                        class="btn-product-submit">

                    <i class="bi bi-plus-lg"></i>
                    Thêm sản phẩm

                </button>

            </div>

        </form>

    </div>

</div>
