<%@ page language="java"
         contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<title>Error</title>

<section class="error-page">

    <div class="container">

        <div class="error-card">

            <div class="error-code">
                ${statusCode}
            </div>

            <h2>
                ${errorTitle}
            </h2>

            <p>
                ${errorMessage}
            </p>

            <div class="error-actions">
                <a href="${pageContext.request.contextPath}/home"
                   class="error-primary-btn">
                    <i class="bi bi-house-door"></i>
                    Về trang chủ
                </a>

                <a href="${pageContext.request.contextPath}/product"
                   class="error-secondary-btn">
                    Xem sản phẩm
                </a>
            </div>

        </div>

    </div>

</section>
