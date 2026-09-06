<%@ page language="java"
         contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<title>Dashboard</title>

<div class="dashboard-page">

    <!-- =========================
         PAGE HEADER
    ========================== -->
    <div class="dashboard-page-header">

        <div>

            <div class="dashboard-title-group">

                <h1>
                    Dashboard
                </h1>

                <span>
                    Thống kê & báo cáo hệ thống
                </span>

            </div>

        </div>


        <div class="dashboard-date">

            <i class="bi bi-calendar3"></i>

            <span id="dashboardCurrentDate">
                Hôm nay
            </span>

        </div>

    </div>


    <!-- =========================
         STATISTICS
    ========================== -->
    <div class="dashboard-stats-grid">

        <!-- Revenue -->
        <div class="dashboard-stat-card">

            <div class="stat-card-top">

                <div class="stat-icon stat-icon-green">

                    <i class="bi bi-cash-stack"></i>

                </div>

                <div class="stat-info">

                    <span class="stat-label">
                        Tổng doanh thu
                    </span>

                    <h2 class="stat-value stat-green">
                        78.000.000đ
                    </h2>

                    <div class="stat-change">

                        <span class="change-positive">
                            <i class="bi bi-arrow-up"></i>
                            76%
                        </span>

                        <span>
                            so với tháng trước
                        </span>

                    </div>

                </div>

            </div>

            <div class="stat-progress">

                <div class="stat-progress-bar green"
                     style="width: 76%">
                </div>

            </div>

        </div>


        <!-- Feedback -->
        <div class="dashboard-stat-card">

            <div class="stat-card-top">

                <div class="stat-icon stat-icon-red">

                    <i class="bi bi-chat-dots"></i>

                </div>

                <div class="stat-info">

                    <span class="stat-label">
                        Phản hồi mới
                    </span>

                    <h2 class="stat-value stat-red">
                        1.349
                    </h2>

                    <div class="stat-change">

                        <span class="change-positive">
                            <i class="bi bi-arrow-up"></i>
                            85%
                        </span>

                        <span>
                            so với tháng trước
                        </span>

                    </div>

                </div>

            </div>

            <div class="stat-progress">

                <div class="stat-progress-bar red"
                     style="width: 85%">
                </div>

            </div>

        </div>


        <!-- Orders -->
        <div class="dashboard-stat-card">

            <div class="stat-card-top">

                <div class="stat-icon stat-icon-blue">

                    <i class="bi bi-cart3"></i>

                </div>

                <div class="stat-info">

                    <span class="stat-label">
                        Đơn hàng mới
                    </span>

                    <h2 class="stat-value stat-blue">
                        567
                    </h2>

                    <div class="stat-change">

                        <span class="change-positive">
                            <i class="bi bi-arrow-up"></i>
                            45%
                        </span>

                        <span>
                            so với tháng trước
                        </span>

                    </div>

                </div>

            </div>

            <div class="stat-progress">

                <div class="stat-progress-bar blue"
                     style="width: 45%">
                </div>

            </div>

        </div>


        <!-- Users -->
        <div class="dashboard-stat-card">

            <div class="stat-card-top">

                <div class="stat-icon stat-icon-purple">

                    <i class="bi bi-people"></i>

                </div>

                <div class="stat-info">

                    <span class="stat-label">
                        Người dùng mới
                    </span>

                    <h2 class="stat-value stat-purple">
                        276
                    </h2>

                    <div class="stat-change">

                        <span class="change-positive">
                            <i class="bi bi-arrow-up"></i>
                            57%
                        </span>

                        <span>
                            so với tháng trước
                        </span>

                    </div>

                </div>

            </div>

            <div class="stat-progress">

                <div class="stat-progress-bar purple"
                     style="width: 57%">
                </div>

            </div>

        </div>

    </div>


    <!-- =========================
         MAIN DASHBOARD GRID
    ========================== -->
    <div class="dashboard-main-grid">

        <!-- SALES OVERVIEW -->
        <div class="dashboard-panel">

            <div class="dashboard-panel-header">

                <div class="panel-heading">

                    <i class="bi bi-bar-chart-fill"></i>

                    <h3>
                        TỔNG QUAN DOANH SỐ
                    </h3>

                </div>


                <div class="dashboard-tabs"
                     data-dashboard-tabs="sales">

                    <button
                        type="button"
                        class="dashboard-tab active"
                        data-period="today">

                        Hôm nay

                    </button>

                    <button
                        type="button"
                        class="dashboard-tab"
                        data-period="week">

                        Tuần

                    </button>

                    <button
                        type="button"
                        class="dashboard-tab"
                        data-period="month">

                        Tháng

                    </button>

                </div>

            </div>


            <div class="sales-summary-grid">

                <div class="sales-summary-item">

                    <span>
                        Doanh số
                    </span>

                    <strong class="summary-blue">
                        13.760
                    </strong>

                    <small>
                        đơn hàng
                    </small>

                </div>


                <div class="sales-summary-item">

                    <span>
                        Doanh thu
                    </span>

                    <strong class="summary-green">
                        78.000.000đ
                    </strong>

                    <small>
                        tổng doanh thu
                    </small>

                </div>


                <div class="sales-summary-item">

                    <span>
                        Chi phí
                    </span>

                    <strong class="summary-red">
                        11.760.000đ
                    </strong>

                    <small>
                        tổng chi phí
                    </small>

                </div>


                <div class="sales-summary-item">

                    <span>
                        Tăng trưởng
                    </span>

                    <strong class="summary-blue">
                        9.760.000đ
                    </strong>

                    <small>
                        so với tháng trước
                    </small>

                </div>

            </div>


            <div class="dashboard-chart-wrapper">

                <canvas id="salesChart"></canvas>

            </div>

        </div>


        <!-- MEMBER ACTIVITY -->
        <div class="dashboard-panel">

            <div class="dashboard-panel-header">

                <div class="panel-heading">

                    <i class="bi bi-people-fill"></i>

                    <h3>
                        HOẠT ĐỘNG THÀNH VIÊN
                    </h3>

                </div>


                <div class="dashboard-tabs"
                     data-dashboard-tabs="members">

                    <button
                        type="button"
                        class="dashboard-tab active">

                        Hôm nay

                    </button>

                    <button
                        type="button"
                        class="dashboard-tab">

                        Tuần

                    </button>

                    <button
                        type="button"
                        class="dashboard-tab">

                        Tháng

                    </button>

                </div>

            </div>


            <div class="member-summary">

                <div class="member-summary-block">

                    <div>

                        <span>
                            Tổng thành viên
                        </span>

                        <strong>
                            2.460
                        </strong>

                    </div>

                    <canvas id="memberTotalChart"></canvas>

                </div>


                <div class="member-summary-block">

                    <div>

                        <span>
                            Thành viên mới
                        </span>

                        <strong>
                            719
                        </strong>

                    </div>

                    <canvas id="memberNewChart"></canvas>

                </div>

            </div>


            <div class="member-table-wrapper">

                <table class="member-table">

                    <thead>

                    <tr>

                        <th>
                            Thành viên
                        </th>

                        <th>
                            Thu nhập
                        </th>

                        <th>
                            Công việc
                        </th>

                        <th>
                            Hoàn thành
                        </th>

                        <th>
                            Tỷ lệ
                        </th>

                    </tr>

                    </thead>

                    <tbody>

                    <tr>

                        <td>
                            <div class="member-cell">

                                <div class="member-avatar">
                                    B
                                </div>

                                <span>
                                    Brain
                                </span>

                            </div>
                        </td>

                        <td>
                            3.450.000đ
                        </td>

                        <td>
                            45
                        </td>

                        <td>
                            124
                        </td>

                        <td class="member-rate">
                            80%
                        </td>

                    </tr>


                    <tr>

                        <td>
                            <div class="member-cell">

                                <div class="member-avatar">
                                    N
                                </div>

                                <span>
                                    Nick
                                </span>

                            </div>
                        </td>

                        <td>
                            5.600.000đ
                        </td>

                        <td>
                            12
                        </td>

                        <td>
                            24
                        </td>

                        <td class="member-rate">
                            67%
                        </td>

                    </tr>


                    <tr>

                        <td>

                            <div class="member-cell">

                                <div class="member-avatar">
                                    T
                                </div>

                                <span>
                                    Tim
                                </span>

                            </div>

                        </td>

                        <td>
                            13.450.000đ
                        </td>

                        <td>
                            450
                        </td>

                        <td>
                            46
                        </td>

                        <td class="member-rate">
                            98%
                        </td>

                    </tr>


                    <tr>

                        <td>

                            <div class="member-cell">

                                <div class="member-avatar">
                                    T
                                </div>

                                <span>
                                    Tom
                                </span>

                            </div>

                        </td>

                        <td>
                            6.450.000đ
                        </td>

                        <td>
                            50
                        </td>

                        <td>
                            89
                        </td>

                        <td class="member-rate">
                            58%
                        </td>

                    </tr>

                    </tbody>

                </table>

            </div>

        </div>

    </div>


    <!-- =========================
         BOTTOM GRID
    ========================== -->
    <div class="dashboard-bottom-grid">

        <!-- TASKS -->
        <div class="dashboard-panel">

            <div class="dashboard-panel-header">

                <div class="panel-heading">

                    <i class="bi bi-check-circle-fill"></i>

                    <div>

                        <h3>
                            CÔNG VIỆC
                        </h3>

                        <small>
                            16 công việc đang chờ xử lý
                        </small>

                    </div>

                </div>


                <div class="panel-actions">

                    <div class="dashboard-search">

                        <input
                            type="text"
                            id="taskSearch"
                            placeholder="Tìm kiếm...">

                        <i class="bi bi-search"></i>

                    </div>


                    <button
                        type="button"
                        class="btn-dashboard-primary">

                        <i class="bi bi-plus-lg"></i>

                        Thêm công việc

                    </button>

                </div>

            </div>


            <div class="dashboard-table-wrapper">

                <table class="dashboard-data-table"
                       id="taskTable">

                    <thead>

                    <tr>

                        <th>#</th>

                        <th>
                            Công việc
                        </th>

                        <th>
                            Ưu tiên
                        </th>

                        <th>
                            Trạng thái
                        </th>

                        <th>
                            Ngày tạo
                        </th>

                        <th>
                            Thao tác
                        </th>

                    </tr>

                    </thead>

                    <tbody>

                    <tr>

                        <td>
                            1
                        </td>

                        <td>
                            Cập nhật sản phẩm mới
                        </td>

                        <td>
                            <span class="badge-priority high">
                                Cao
                            </span>
                        </td>

                        <td>

                            <span class="badge-status working">

                                <span></span>

                                Đang xử lý

                            </span>

                        </td>

                        <td>
                            26/04/2026
                        </td>

                        <td>

                            <button
                                type="button"
                                class="table-more-btn">

                                <i class="bi bi-three-dots"></i>

                            </button>

                        </td>

                    </tr>

                    </tbody>

                </table>

            </div>

        </div>


        <!-- SUPPORT -->
        <div class="dashboard-panel">

            <div class="dashboard-panel-header">

                <div class="panel-heading">

                    <i class="bi bi-headset"></i>

                    <div>

                        <h3>
                            HỖ TRỢ KHÁCH HÀNG
                        </h3>

                        <small>
                            45 yêu cầu hỗ trợ
                        </small>

                    </div>

                </div>


                <div class="dashboard-search">

                    <input
                        type="text"
                        id="supportSearch"
                        placeholder="Tìm kiếm...">

                    <i class="bi bi-search"></i>

                </div>

            </div>


            <div class="dashboard-table-wrapper">

                <table
                    class="dashboard-data-table"
                    id="supportTable">

                    <thead>

                    <tr>

                        <th>#</th>

                        <th>
                            Khách hàng
                        </th>

                        <th>
                            Nội dung
                        </th>

                        <th>
                            Trạng thái
                        </th>

                        <th>
                            Ngày gửi
                        </th>

                    </tr>

                    </thead>

                    <tbody>

                    <tr>

                        <td>
                            1
                        </td>

                        <td>
                            Nguyễn Văn A
                        </td>

                        <td>
                            Hỏi về sản phẩm
                        </td>

                        <td>

                            <span class="badge-status done">

                                <span></span>

                                Đã phản hồi

                            </span>

                        </td>

                        <td>
                            26/04/2026
                        </td>

                    </tr>

                    </tbody>

                </table>

            </div>

        </div>

    </div>

</div>
