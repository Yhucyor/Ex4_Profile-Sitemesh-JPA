<%@ page language="java"
         contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>

<header class="admin-header">

    <div class="admin-header-left">

        <a href="${pageContext.request.contextPath}/admin/products"
           class="admin-brand">

            <div class="admin-brand-icon">
                <i class="bi bi-layers-fill"></i>
            </div>

            <div class="admin-brand-text">
                <span class="brand-admin">ADMIN</span>
                <span class="brand-management">MANAGEMENT</span>
            </div>

        </a>

    </div>


    <div class="admin-header-right">

        <button class="header-icon-btn"
                type="button"
                aria-label="Notifications">

            <i class="bi bi-bell"></i>

            <span class="notification-dot"></span>

        </button>


        <div class="header-divider"></div>

        <c:choose>

            <c:when test="${not empty sessionScope.account}">

                <div class="admin-user">

                    <div class="admin-avatar">

                        <c:choose>

                            <c:when test="${not empty sessionScope.account.avatar}">

                                <c:choose>
                                    <c:when test="${fn:startsWith(sessionScope.account.avatar, 'http://')
                                            or fn:startsWith(sessionScope.account.avatar, 'https://')}">
                                        <img
                                                src="${sessionScope.account.avatar}"
                                                alt="${sessionScope.account.username}">
                                    </c:when>
                                    <c:otherwise>
                                        <img
                                                src="${pageContext.request.contextPath}/image?fname=${sessionScope.account.avatar}"
                                                alt="${sessionScope.account.username}"
                                                onerror="this.onerror=null; this.src='${pageContext.request.contextPath}/assets/frontend/images/avatar/default-avatar.png';">
                                    </c:otherwise>
                                </c:choose>

                            </c:when>

                            <c:otherwise>

                                <img
                                        src="${pageContext.request.contextPath}/assets/frontend/images/avatar/default-avatar.png"
                                        alt="Default Avatar">

                            </c:otherwise>

                        </c:choose>

                    </div>

                    <div class="admin-user-info">

                        <span class="welcome-text">
                            Xin chào,
                        </span>

                        <strong class="username">
                            <c:choose>
                                <c:when test="${not empty sessionScope.account.fullname}">
                                    ${sessionScope.account.fullname}
                                </c:when>
                                <c:otherwise>
                                    ${sessionScope.account.username}
                                </c:otherwise>
                            </c:choose>
                        </strong>

                    </div>

                </div>


                <div class="header-divider"></div>

                <a href="${pageContext.request.contextPath}/admin/profile"
                   class="header-link profile-link">

                    <i class="bi bi-person"></i>

                    <span>Profile</span>

                </a>

                <a href="${pageContext.request.contextPath}/logout"
                   class="header-link logout-link">

                    <i class="bi bi-box-arrow-right"></i>

                    <span>Logout</span>

                </a>

            </c:when>

            <c:otherwise>

                <a href="${pageContext.request.contextPath}/login"
                   class="header-link profile-link">

                    <i class="bi bi-box-arrow-in-right"></i>

                    <span>Login</span>

                </a>

            </c:otherwise>

        </c:choose>

    </div>

</header>
