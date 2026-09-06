document.addEventListener("DOMContentLoaded", function () {

    const fileInput =
        document.getElementById("imageFile");

    const urlInput =
        document.getElementById("imageUrl");

    const preview =
        document.getElementById("imagePreview");

    const previewEmpty =
        document.getElementById("imagePreviewEmpty");

    if (!preview || !previewEmpty) {
        return;
    }

    function showImage(src) {

        if (!src) {
            hideImage();
            return;
        }

        preview.src = src;

        preview.style.display = "block";

        previewEmpty.style.display = "none";
    }


    function hideImage() {

        preview.src = "";

        preview.style.display = "none";

        previewEmpty.style.display = "flex";
    }


    if (fileInput) {

        fileInput.addEventListener(
            "change",
            function () {

                const file =
                    fileInput.files[0];

                if (!file) {
                    return;
                }

                if (!file.type.startsWith("image/")) {
                    return;
                }

                const reader =
                    new FileReader();

                reader.onload =
                    function (event) {

                        showImage(
                            event.target.result
                        );

                    };

                reader.readAsDataURL(file);

            }
        );

    }


    if (urlInput) {

        urlInput.addEventListener(
            "input",
            function () {

                const url =
                    urlInput.value.trim();

                if (!url) {

                    if (
                        !fileInput ||
                        fileInput.files.length === 0
                    ) {
                        hideImage();
                    }

                    return;
                }

                showImage(url);

            }
        );

    }


    if (preview) {

        preview.addEventListener(
            "error",
            function () {

                hideImage();

            }
        );

    }

});
