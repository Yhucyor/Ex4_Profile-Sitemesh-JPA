document.addEventListener("DOMContentLoaded", function () {

    initDashboardDate();
    initDashboardTabs();
    initDashboardSearch();
    initDashboardCharts();

});


/* =========================================================
   CURRENT DATE
========================================================= */

function initDashboardDate() {

    const dateElement =
        document.getElementById("dashboardCurrentDate");

    if (!dateElement) {
        return;
    }

    const now =
        new Date();

    const formatter =
        new Intl.DateTimeFormat(
            "vi-VN",
            {
                weekday: "long",
                day: "2-digit",
                month: "2-digit",
                year: "numeric"
            }
        );

    let formattedDate =
        formatter.format(now);

    formattedDate =
        formattedDate.charAt(0).toUpperCase()
        + formattedDate.slice(1);

    dateElement.textContent =
        formattedDate;
}


/* =========================================================
   DASHBOARD TABS
========================================================= */

function initDashboardTabs() {

    const tabGroups =
        document.querySelectorAll(
            ".dashboard-tabs"
        );

    tabGroups.forEach(function (group) {

        const buttons =
            group.querySelectorAll(
                ".dashboard-tab"
            );

        buttons.forEach(function (button) {

            button.addEventListener(
                "click",
                function () {

                    buttons.forEach(
                        function (item) {

                            item.classList.remove(
                                "active"
                            );

                        }
                    );

                    button.classList.add(
                        "active"
                    );

                }
            );

        });

    });

}


/* =========================================================
   SEARCH TABLE
========================================================= */

function initDashboardSearch() {

    bindTableSearch(
        "taskSearch",
        "taskTable"
    );

    bindTableSearch(
        "supportSearch",
        "supportTable"
    );

}


function bindTableSearch(
    inputId,
    tableId
) {

    const input =
        document.getElementById(inputId);

    const table =
        document.getElementById(tableId);

    if (!input || !table) {
        return;
    }

    input.addEventListener(
        "input",
        function () {

            const keyword =
                input.value
                    .trim()
                    .toLowerCase();

            const rows =
                table.querySelectorAll(
                    "tbody tr"
                );

            rows.forEach(
                function (row) {

                    const text =
                        row.textContent
                            .toLowerCase();

                    row.style.display =
                        text.includes(keyword)
                            ? ""
                            : "none";

                }
            );

        }
    );

}


/* =========================================================
   CHARTS
========================================================= */

function initDashboardCharts() {

    if (typeof Chart === "undefined") {

        console.warn(
            "Chart.js chưa được load."
        );

        return;
    }

    initSalesChart();
    initMemberTotalChart();
    initMemberNewChart();

}


/* =========================================================
   SALES CHART
========================================================= */

function initSalesChart() {

    const canvas =
        document.getElementById(
            "salesChart"
        );

    if (!canvas) {
        return;
    }

    const context =
        canvas.getContext("2d");


    const revenueGradient =
        context.createLinearGradient(
            0,
            0,
            0,
            280
        );

    revenueGradient.addColorStop(
        0,
        "rgba(59, 130, 246, 0.30)"
    );

    revenueGradient.addColorStop(
        1,
        "rgba(59, 130, 246, 0.02)"
    );


    const costGradient =
        context.createLinearGradient(
            0,
            0,
            0,
            280
        );

    costGradient.addColorStop(
        0,
        "rgba(16, 185, 129, 0.24)"
    );

    costGradient.addColorStop(
        1,
        "rgba(16, 185, 129, 0.02)"
    );


    new Chart(
        context,
        {

            type: "line",

            data: {

                labels: [
                    "T1",
                    "T2",
                    "T3",
                    "T4",
                    "T5",
                    "T6",
                    "T7"
                ],

                datasets: [

                    {

                        label: "Doanh thu",

                        data: [
                            40,
                            48,
                            68,
                            50,
                            72,
                            55,
                            77
                        ],

                        borderColor:
                            "#3b82f6",

                        backgroundColor:
                        revenueGradient,

                        fill: true,

                        tension: 0.42,

                        pointRadius: 0,

                        borderWidth: 2

                    },

                    {

                        label: "Chi phí",

                        data: [
                            20,
                            29,
                            37,
                            30,
                            44,
                            34,
                            48
                        ],

                        borderColor:
                            "#10b981",

                        backgroundColor:
                        costGradient,

                        fill: true,

                        tension: 0.42,

                        pointRadius: 0,

                        borderWidth: 2

                    }

                ]

            },

            options: {

                responsive: true,

                maintainAspectRatio: false,

                interaction: {

                    intersect: false,

                    mode: "index"

                },

                plugins: {

                    legend: {

                        position: "bottom",

                        labels: {

                            usePointStyle: true,

                            boxWidth: 7,

                            boxHeight: 7,

                            color: "#64748b",

                            font: {

                                size: 11

                            }

                        }

                    }

                },

                scales: {

                    x: {

                        grid: {

                            display: false

                        },

                        ticks: {

                            color: "#94a3b8"

                        }

                    },

                    y: {

                        beginAtZero: true,

                        max: 80,

                        ticks: {

                            stepSize: 20,

                            color: "#94a3b8",

                            callback:
                                function (value) {

                                    if (
                                        value === 0
                                    ) {
                                        return "0";
                                    }

                                    return value + "M";

                                }

                        },

                        grid: {

                            color:
                                "rgba(148, 163, 184, 0.15)"

                        }

                    }

                }

            }

        }
    );

}


/* =========================================================
   MEMBER TOTAL CHART
========================================================= */

function initMemberTotalChart() {

    const canvas =
        document.getElementById(
            "memberTotalChart"
        );

    if (!canvas) {
        return;
    }

    new Chart(
        canvas,
        {

            type: "bar",

            data: {

                labels: [
                    "",
                    "",
                    "",
                    "",
                    "",
                    "",
                    "",
                    "",
                    "",
                    ""
                ],

                datasets: [

                    {

                        data: [
                            8,
                            14,
                            20,
                            28,
                            22,
                            35,
                            41,
                            30,
                            43,
                            36
                        ],

                        backgroundColor:
                            "#34d399",

                        borderRadius: 2,

                        borderSkipped: false

                    }

                ]

            },

            options: {

                responsive: true,

                maintainAspectRatio: false,

                plugins: {

                    legend: {

                        display: false

                    },

                    tooltip: {

                        enabled: false

                    }

                },

                scales: {

                    x: {

                        display: false

                    },

                    y: {

                        display: false

                    }

                }

            }

        }
    );

}


/* =========================================================
   MEMBER NEW CHART
========================================================= */

function initMemberNewChart() {

    const canvas =
        document.getElementById(
            "memberNewChart"
        );

    if (!canvas) {
        return;
    }

    new Chart(
        canvas,
        {

            type: "bar",

            data: {

                labels: [
                    "",
                    "",
                    "",
                    "",
                    "",
                    "",
                    "",
                    "",
                    ""
                ],

                datasets: [

                    {

                        data: [
                            9,
                            19,
                            28,
                            35,
                            20,
                            31,
                            44,
                            16,
                            37
                        ],

                        backgroundColor:
                            "#60a5fa",

                        borderRadius: 2,

                        borderSkipped: false

                    }

                ]

            },

            options: {

                responsive: true,

                maintainAspectRatio: false,

                plugins: {

                    legend: {

                        display: false

                    },

                    tooltip: {

                        enabled: false

                    }

                },

                scales: {

                    x: {

                        display: false

                    },

                    y: {

                        display: false

                    }

                }

            }

        }
    );

}