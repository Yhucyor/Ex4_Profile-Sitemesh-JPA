document.addEventListener("DOMContentLoaded", function () {
    const searchInput =
        document.getElementById("productSearch");

    const table =
        document.getElementById("productTable");

    const categoryFilter =
        document.getElementById("productCategoryFilter");

    const pagination =
        document.getElementById("productPagination");

    const info =
        document.getElementById("productTableInfo");

    if (!table) {
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

        const selectedCategory =
            categoryFilter
                ? categoryFilter.value.trim().toLowerCase()
                : "";

        return rows.filter(function (row) {
            const text =
                row.textContent.toLowerCase();

            const category =
                (row.dataset.category || "").trim().toLowerCase();

            return text.includes(keyword) &&
                (!selectedCategory || category === selectedCategory);
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

        filteredRows
            .slice(startIndex, endIndex)
            .forEach(function (row) {
                row.style.display = "";
            });

        if (info) {
            info.textContent =
                totalItems === 0
                    ? "Hiển thị 0 sản phẩm"
                    : "Hiển thị " + (startIndex + 1) + " - " +
                    Math.min(endIndex, totalItems) + " của " +
                    totalItems + " sản phẩm";
        }

        renderPagination(totalPages);
    }

    function renderPagination(totalPages) {
        if (!pagination) {
            return;
        }

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

    if (categoryFilter) {
        categoryFilter.addEventListener("change", function () {
            currentPage = 1;
            render();
        });
    }

    render();
});
