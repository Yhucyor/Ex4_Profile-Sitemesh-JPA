<%@ page language="java"
         contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<c:set var="currentURI" value="${pageContext.request.requestURI}" />

<aside class="admin-sidebar">

    <!-- =========================
         MANAGEMENT
    ========================== -->
    <div class="sidebar-section">

        <h3 class="sidebar-title">
            QUẢN LÝ
        </h3>

        <ul class="sidebar-menu">

            <!-- DASHBOARD -->
            <li>
                <a
                    href="${pageContext.request.contextPath}/admin/dashboard"
                    class="sidebar-link
                    ${currentURI.contains('/admin/dashboard') ? 'active' : ''}">

                    <i class="bi bi-house-door-fill"></i>

                    <span>
                        Dashboard
                    </span>

                </a>
            </li>


            <!-- CATEGORY -->
            <li>
                <a
                    href="${pageContext.request.contextPath}/admin/categories"
                    class="sidebar-link
                    ${currentURI.contains('/admin/categories') ? 'active' : ''}">

                    <i class="bi bi-grid-fill"></i>

                    <span>
                        Category
                    </span>

                </a>
            </li>


            <!-- PRODUCT -->
            <li>
                <a
                    href="${pageContext.request.contextPath}/admin/products"
                    class="sidebar-link
                    ${currentURI.contains('/admin/products') ? 'active' : ''}">

                    <i class="bi bi-box-seam"></i>

                    <span>
                        Product
                    </span>

                </a>
            </li>


            <!-- HOME -->
            <li>
                <a
                    href="${pageContext.request.contextPath}/home"
                    class="sidebar-link">

                    <i class="bi bi-house"></i>

                    <span>
                        Trang chủ
                    </span>

                </a>
            </li>

        </ul>

    </div>


    <div class="admin-sidebar-divider"></div>


    <!-- =========================
         ACCOUNT
    ========================== -->
    <div class="sidebar-section">

        <h3 class="sidebar-title">
            TÀI KHOẢN
        </h3>

        <ul class="sidebar-menu">

            <!-- PROFILE -->
            <li>
                <a
                    href="${pageContext.request.contextPath}/admin/profile"
                    class="sidebar-link
                    ${currentURI.contains('/admin/profile') ? 'active' : ''}">

                    <i class="bi bi-person-fill"></i>

                    <span>
                        Hồ sơ cá nhân
                    </span>

                </a>
            </li>


            <!-- LOGOUT -->
            <li>
                <a
                    href="${pageContext.request.contextPath}/logout"
                    class="sidebar-link sidebar-logout-link">

                    <i class="bi bi-box-arrow-right"></i>

                    <span>
                        Đăng xuất
                    </span>

                </a>
            </li>

        </ul>

    </div>


    <!-- =========================
         BOTTOM CARD
    ========================== -->
    <div class="sidebar-promo">

        <div class="sidebar-promo-icon">
            <i class="bi bi-layers-fill"></i>
        </div>

        <h4>
            Quản trị dễ dàng
            <br>
            Hiệu quả hơn
        </h4>

        <p>
            Hệ thống quản lý
            <br>
            cửa hàng của bạn
        </p>

        <div class="sidebar-promo-line"></div>

    </div>

</aside>
