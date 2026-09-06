document.addEventListener("DOMContentLoaded", function () {
    const table =
        document.getElementById("categoryTable");

    const pagination =
        document.getElementById("categoryPagination");

    const info =
        document.getElementById("categoryTableInfo");

    const searchInput =
        document.getElementById("categorySearch");

    if (!table || !pagination || !info) {
        return;
    }

    const rows =
        Array.from(table.querySelectorAll("tbody tr"));

    const pageSize =
        Number(table.dataset.pageSize) || 10;

    let currentPage = 1;

    function getFilteredRows() {
        const keyword =
            searchInput
                ? searchInput.value.trim().toLowerCase()
                : "";

        return rows.filter(function (row) {
            return row.textContent
                .toLowerCase()
                .includes(keyword);
        });
    }

    function render() {
        const filteredRows =
            getFilteredRows();

        const totalItems =
            filteredRows.length;

        const totalPages =
            Math.max(1, Math.ceil(totalItems / pageSize));

        if (currentPage > totalPages) {
            currentPage = totalPages;
        }

        const startIndex =
            (currentPage - 1) * pageSize;

        const endIndex =
            startIndex + pageSize;

        rows.forEach(function (row) {
            row.style.display = "none";
        });

        filteredRows.forEach(function (row, index) {
            row.style.display =
                index >= startIndex && index < endIndex
                    ? ""
                    : "none";
        });

        info.textContent =
            totalItems === 0
                ? "Hiển thị 0 danh mục"
                : "Hiển thị " + (startIndex + 1) + " - " +
                Math.min(endIndex, totalItems) + " của " +
                totalItems + " danh mục";

        renderPagination(totalPages);
    }

    function renderPagination(totalPages) {
        pagination.innerHTML = "";

        if (totalPages <= 1) {
            return;
        }

        pagination.appendChild(
            createButton("‹", currentPage > 1, function () {
                currentPage -= 1;
                render();
            })
        );

        for (let page = 1; page <= totalPages; page += 1) {
            const button =
                createButton(String(page), true, function () {
                    currentPage = page;
                    render();
                });

            if (page === currentPage) {
                button.classList.add("active");
            }

            pagination.appendChild(button);
        }

        pagination.appendChild(
            createButton("›", currentPage < totalPages, function () {
                currentPage += 1;
                render();
            })
        );
    }

    function createButton(label, enabled, onClick) {
        const button =
            document.createElement("button");

        button.type = "button";
        button.textContent = label;
        button.disabled = !enabled;

        button.addEventListener("click", onClick);

        return button;
    }

    if (searchInput) {
        searchInput.addEventListener("input", function () {
            currentPage = 1;
            render();
        });
    }

    render();
});
