<%@ page language="java"
         contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<title>Thêm danh mục</title>

<div class="category-form-page">

    <div class="category-form-card">

        <div class="category-form-header">

            <div class="category-form-title-group">

                <div class="category-form-icon">
                    <i class="bi bi-plus-circle-fill"></i>
                </div>

                <div>
                    <h1>Thêm danh mục</h1>

                    <p>
                        Tạo danh mục sản phẩm mới cho hệ thống.
                    </p>
                </div>

            </div>

            <a href="${pageContext.request.contextPath}/admin/categories"
               class="btn-back-category">

                <i class="bi bi-arrow-left"></i>
                Quay lại

            </a>

        </div>

        <form
                action="<c:url value="/admin/category/insert"/>"
                method="post"
                enctype="multipart/form-data"
                class="category-form">

            <div class="form-group">

                <label for="categoryname">
                    Tên danh mục
                    <span class="required">*</span>
                </label>

                <div class="input-icon-wrapper">

                    <i class="bi bi-tag"></i>

                    <input
                            type="text"
                            id="categoryname"
                            name="categoryname"
                            class="form-control"
                            placeholder="Ví dụ: Laptop, Điện thoại, Tai nghe..."
                            required>

                </div>

                <small class="form-help">
                    Tên danh mục sẽ hiển thị trên hệ thống.
                </small>

            </div>

            <div class="form-group">

                <label for="imageUrl">
                    Link ảnh
                </label>

                <div class="input-icon-wrapper">

                    <i class="bi bi-link-45deg"></i>

                    <input
                            type="url"
                            id="imageUrl"
                            name="images"
                            class="form-control"
                            placeholder="https://res.cloudinary.com/...">

                </div>

                <small class="form-help">
                    Có thể nhập URL ảnh trực tiếp hoặc upload ảnh bên dưới.
                </small>

            </div>

            <div class="form-group">

                <label for="imageFile">
                    Upload ảnh
                </label>

                <div class="upload-area">

                    <input
                            type="file"
                            id="imageFile"
                            name="images1"
                            accept="image/*"
                            hidden>

                    <label
                            for="imageFile"
                            class="upload-label">

                        <div class="upload-icon">
                            <i class="bi bi-cloud-arrow-up"></i>
                        </div>

                        <div class="upload-text">

                            <strong>
                                Chọn ảnh để upload
                            </strong>

                            <span>
                                PNG, JPG, JPEG - tối đa 5MB
                            </span>

                        </div>

                    </label>

                </div>

            </div>

            <div
                    class="image-preview-wrapper"
                    id="imagePreviewWrapper">

                <span class="preview-label">
                    Xem trước ảnh
                </span>

                <div class="image-preview">

                    <img
                            id="imagePreview"
                            src=""
                            alt="Preview">

                    <div
                            class="image-preview-empty"
                            id="imagePreviewEmpty">

                        <i class="bi bi-image"></i>

                        <span>
                            Chưa có ảnh
                        </span>

                    </div>

                </div>

            </div>

            <div class="form-group">

                <label>
                    Trạng thái
                </label>

                <div class="status-options">

                    <label class="status-option">

                        <input
                                type="radio"
                                name="status"
                                value="1"
                                checked>

                        <span class="status-custom-radio"></span>

                        <span class="status-option-content">

                            <span class="status-option-title active-text">
                                Hoạt động
                            </span>

                            <small>
                                Danh mục được hiển thị trên hệ thống
                            </small>

                        </span>

                    </label>

                    <label class="status-option">

                        <input
                                type="radio"
                                name="status"
                                value="0">

                        <span class="status-custom-radio"></span>

                        <span class="status-option-content">

                            <span class="status-option-title inactive-text">
                                Khóa
                            </span>

                            <small>
                                Tạm thời ẩn danh mục khỏi hệ thống
                            </small>

                        </span>

                    </label>

                </div>

            </div>

            <div class="category-form-actions">

                <a
                        href="${pageContext.request.contextPath}/admin/categories"
                        class="btn-category-cancel">

                    Hủy

                </a>

                <button
                        type="submit"
                        class="btn-category-submit">

                    <i class="bi bi-plus-lg"></i>
                    Thêm danh mục

                </button>

            </div>

        </form>

    </div>

</div>
