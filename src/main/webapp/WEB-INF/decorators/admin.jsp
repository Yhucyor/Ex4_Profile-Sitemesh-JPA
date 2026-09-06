<%@ page language="java"
         contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="vi">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <link
            rel="icon"
            type="image/png"
            href="${pageContext.request.contextPath}/assets/global/images/hcmute-logo.png">

    <title>
        <sitemesh:write property="title"/>
    </title>

    <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
            rel="stylesheet">

    <link
            rel="stylesheet"
            href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

    <link
            rel="stylesheet"
            href="${pageContext.request.contextPath}/assets/admin/css/admin.css?v=20260906-admin-profile">

    <sitemesh:write property="head"/>

</head>


<body>


<%@ include file="/commons/admin/header.jsp" %>


<div class="admin-layout">

    <%@ include file="/commons/admin/sidebar.jsp" %>


    <main class="admin-content">

        <sitemesh:write property="body"/>

    </main>

</div>


<%@ include file="/commons/admin/footer.jsp" %>


<script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js">
</script>

<script
        src="https://cdn.jsdelivr.net/npm/chart.js@4.4.7/dist/chart.umd.min.js">
</script>

<script
        src="${pageContext.request.contextPath}/assets/admin/js/admin-dashboard.js?v=20260906-dashboard">
</script>

<script
        src="${pageContext.request.contextPath}/assets/admin/js/category-form.js?v=20260906-category-form">
</script>

<script
        src="${pageContext.request.contextPath}/assets/admin/js/product-list.js?v=20260906-product-list">
</script>

<script
        src="${pageContext.request.contextPath}/assets/admin/js/category-list.js?v=20260906-category-list">
</script>

<script
        src="${pageContext.request.contextPath}/assets/admin/js/product-form.js?v=20260906-product-form">
</script>

</body>

</html>
