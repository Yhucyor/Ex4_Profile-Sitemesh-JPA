<%@ page language="java"
         contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>

<title>Sửa danh mục</title>

<c:choose>
    <c:when test="${not empty cate.images}">
        <c:choose>
            <c:when test="${fn:startsWith(cate.images, 'http://')
                    or fn:startsWith(cate.images, 'https://')}">
                <c:set var="categoryImageUrl" value="${cate.images}" />
            </c:when>
            <c:otherwise>
                <c:set var="categoryImageUrl"
                       value="${pageContext.request.contextPath}/image?fname=${cate.images}" />
            </c:otherwise>
        </c:choose>
    </c:when>
    <c:otherwise>
        <c:set var="categoryImageUrl" value="" />
    </c:otherwise>
</c:choose>

<div class="category-form-page">

    <div class="category-form-card">

        <div class="category-form-header">

            <div class="category-form-title-group">

                <div class="category-form-icon">
                    <i class="bi bi-pencil-square"></i>
                </div>

                <div>
                    <h1>Sửa danh mục</h1>

                    <p>
                        Cập nhật thông tin, ảnh và trạng thái danh mục.
                    </p>
                </div>

            </div>

            <a href="${pageContext.request.contextPath}/admin/categories"
               class="btn-back-category">

                <i class="bi bi-arrow-left"></i>
                Quay lại

            </a>

        </div>

        <form action="<c:url value="/admin/category/update"/>"
              method="post"
              enctype="multipart/form-data"
              class="category-form">

            <input type="hidden"
                   name="categoryid"
                   value="${cate.categoryid}">

            <div class="form-group">

                <label for="categoryname">
                    Tên danh mục
                    <span class="required">*</span>
                </label>

                <div class="input-icon-wrapper">

                    <i class="bi bi-tag"></i>

                    <input type="text"
                           id="categoryname"
                           name="categoryname"
                           class="form-control"
                           value="${cate.categoryname}"
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

                    <input type="url"
                           id="imageUrl"
                           name="images"
                           class="form-control"
                           value="${fn:startsWith(cate.images, 'http://') or fn:startsWith(cate.images, 'https://') ? cate.images : ''}"
                           placeholder="https://res.cloudinary.com/...">

                </div>

                <small class="form-help">
                    Có thể nhập URL ảnh trực tiếp hoặc upload ảnh mới bên dưới.
                </small>

            </div>

            <div class="form-group">

                <label for="imageFile">
                    Upload ảnh mới
                </label>

                <div class="upload-area">

                    <input type="file"
                           id="imageFile"
                           name="images1"
                           accept="image/*"
                           hidden>

                    <label for="imageFile"
                           class="upload-label">

                        <div class="upload-icon">
                            <i class="bi bi-cloud-arrow-up"></i>
                        </div>

                        <div class="upload-text">
                            <strong>Chọn ảnh để upload</strong>
                            <span>Không chọn ảnh mới thì hệ thống giữ ảnh hiện tại.</span>
                        </div>

                    </label>

                </div>

            </div>

            <div class="image-preview-wrapper"
                 id="imagePreviewWrapper">

                <span class="preview-label">
                    Xem trước ảnh
                </span>

                <div class="image-preview">

                    <img id="imagePreview"
                         src="${categoryImageUrl}"
                         alt="${cate.categoryname}"
                         style="${not empty categoryImageUrl ? 'display: block;' : ''}">

                    <div id="imagePreviewEmpty"
                         class="image-preview-empty"
                         style="${not empty categoryImageUrl ? 'display: none;' : ''}">

                        <i class="bi bi-image"></i>
                        <span>Chưa có ảnh</span>

                    </div>

                </div>

            </div>

            <div class="form-group">

                <label>
                    Trạng thái
                </label>

                <div class="status-options">

                    <label class="status-option">

                        <input type="radio"
                               name="status"
                               value="1"
                               ${cate.status == 1 ? 'checked' : ''}>

                        <span class="status-custom-radio"></span>

                        <span class="status-option-content">
                            <span class="status-option-title active-text">
                                Hoạt động
                            </span>
                            <small>Danh mục được hiển thị trên hệ thống</small>
                        </span>

                    </label>

                    <label class="status-option">

                        <input type="radio"
                               name="status"
                               value="0"
                               ${cate.status != 1 ? 'checked' : ''}>

                        <span class="status-custom-radio"></span>

                        <span class="status-option-content">
                            <span class="status-option-title inactive-text">
                                Khóa
                            </span>
                            <small>Tạm thời ẩn danh mục khỏi hệ thống</small>
                        </span>

                    </label>

                </div>

            </div>

            <div class="category-form-actions">

                <a href="${pageContext.request.contextPath}/admin/categories"
                   class="btn-category-cancel">
                    Hủy
                </a>

                <button type="submit"
                        class="btn-category-submit">
                    <i class="bi bi-check2-circle"></i>
                    Cập nhật danh mục
                </button>

            </div>

        </form>

    </div>

</div>
