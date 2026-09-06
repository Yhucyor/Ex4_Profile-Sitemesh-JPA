document.addEventListener("DOMContentLoaded", function () {
    initProductImagePreview();
    initDescriptionCounter();
});

function initProductImagePreview() {
    const input =
        document.getElementById("productImage");

    const preview =
        document.getElementById("productImagePreview");

    const empty =
        document.getElementById("productImagePreviewEmpty");

    if (!input || !preview || !empty) {
        return;
    }

    input.addEventListener("change", function () {
        const file =
            input.files[0];

        if (!file) {
            return;
        }

        if (!file.type.startsWith("image/")) {
            alert("Vui lòng chọn file ảnh.");

            input.value = "";

            return;
        }

        const maxSize =
            5 * 1024 * 1024;

        if (file.size > maxSize) {
            alert("Ảnh không được vượt quá 5MB.");

            input.value = "";

            return;
        }

        const reader =
            new FileReader();

        reader.onload = function (event) {
            preview.src =
                event.target.result;

            preview.style.display =
                "block";

            empty.style.display =
                "none";
        };

        reader.readAsDataURL(file);
    });
}

function initDescriptionCounter() {
    const textarea =
        document.getElementById("productDescription");

    const counter =
        document.getElementById("descriptionCount");

    if (!textarea || !counter) {
        return;
    }

    textarea.maxLength = 500;

    function updateCounter() {
        counter.textContent =
            textarea.value.length;
    }

    textarea.addEventListener("input", updateCounter);

    updateCounter();
}
