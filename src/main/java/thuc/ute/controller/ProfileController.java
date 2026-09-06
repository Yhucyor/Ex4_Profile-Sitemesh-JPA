package thuc.ute.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

import thuc.ute.entity.User;
import thuc.ute.service.IUserService;
import thuc.ute.service.impl.UserServiceImpl;
import thuc.ute.utils.ValidationUtils;

@MultipartConfig
@WebServlet(urlPatterns = {
        "/profile",
        "/admin/profile"
})
public class ProfileController extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private final IUserService userService =
            new UserServiceImpl();

    @Override
    protected void doGet(
            HttpServletRequest req,
            HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session =
                req.getSession(false);

        // 1. Kiểm tra xem user đã đăng nhập chưa
        if (session == null
                || session.getAttribute("account") == null) {

            resp.sendRedirect(
                    req.getContextPath() + "/login"
            );

            return;
        }

        // 2. Lấy User từ Session
        User loginUser =
                (User) session.getAttribute("account");

        // 3. Đọc lại thông tin User từ database
        //    để chắc chắn lấy dữ liệu mới nhất
        User currentUser =
                userService.findById(
                        loginUser.getId()
                );

        if (currentUser == null) {

            // User không còn tồn tại
            session.invalidate();

            resp.sendRedirect(
                    req.getContextPath() + "/login"
            );

            return;
        }

        // 4. Đưa thông tin User vào request để hiển thị
        req.setAttribute("user", currentUser);
        req.setAttribute(
                "profileAction",
                getProfileAction(req)
        );

        // 5. Forward đến trang profile.jsp
        req.getRequestDispatcher(
                "/views/profile.jsp"
        ).forward(req, resp);
    }

    @Override
    protected void doPost(
            HttpServletRequest req,
            HttpServletResponse resp)
            throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html; charset=UTF-8");

        HttpSession session =
                req.getSession(false);

        // 1. Kiểm tra đăng nhập
        if (session == null
                || session.getAttribute("account") == null) {

            resp.sendRedirect(
                    req.getContextPath() + "/login"
            );

            return;
        }

        // 2. Lấy User từ Session
        User loginUser =
                (User) session.getAttribute("account");

        // 3. Đọc User từ database
        User user =
                userService.findById(
                        loginUser.getId()
                );

        if (user == null) {

            session.invalidate();

            resp.sendRedirect(
                    req.getContextPath() + "/login"
            );

            return;
        }

        req.setAttribute(
                "profileAction",
                getProfileAction(req)
        );

        // 4. Lấy dữ liệu từ form
        String fullname =
                req.getParameter("fullname");

        String phone =
                req.getParameter("phone");

        String oldAvatar =
                user.getAvatar();

        String newAvatar =
                null;

        // 5. Validate fullname
        if (!ValidationUtils.isBlank(fullname)
                && !ValidationUtils.isValidFullname(fullname)) {

            req.setAttribute("error",
                    "Họ tên phải từ 3-100 ký tự"
            );

            req.setAttribute("user", user);

            req.getRequestDispatcher(
                    "/views/profile.jsp"
            ).forward(req, resp);

            return;
        }

        String trimmedPhone =
                phone == null
                        ? ""
                        : phone.trim();

        // 6. Validate phone
        if (!ValidationUtils.isValidPhone(phone)) {

            req.setAttribute("error",
                    "Số điện thoại không hợp lệ (phải là 10-11 số, bắt đầu bằng 0)"
            );

            req.setAttribute("user", user);

            req.getRequestDispatcher(
                    "/views/profile.jsp"
            ).forward(req, resp);

            return;
        }

        if (!trimmedPhone.isEmpty()
                && !trimmedPhone.equals(user.getPhone())
                && userService.checkExistPhone(trimmedPhone)) {

            req.setAttribute("error",
                    "Số điện thoại đã được sử dụng bởi tài khoản khác"
            );

            req.setAttribute("user", user);

            req.getRequestDispatcher(
                    "/views/profile.jsp"
            ).forward(req, resp);

            return;
        }

        // 7. Cập nhật fullname và phone
        if (fullname != null) {
            user.setFullname(fullname.trim());
        }

        if (!trimmedPhone.isEmpty()) {
            user.setPhone(trimmedPhone);
        }

        // 8. Xử lý upload avatar
        try {

            Part imagePart =
                    req.getPart("image");

            // Validate image file type
            if (imagePart != null
                    && imagePart.getSize() > 0
                    && !ValidationUtils.isValidImageFile(imagePart)) {

                req.setAttribute("error",
                        "Chỉ chấp nhận file ảnh định dạng: JPG, PNG, GIF"
                );

                req.setAttribute("user", user);

                req.getRequestDispatcher(
                        "/views/profile.jsp"
                ).forward(req, resp);

                return;
            }

            // Validate image file size
            if (imagePart != null
                    && imagePart.getSize() > 0
                    && !ValidationUtils.isValidFileSize(imagePart)) {

                req.setAttribute("error",
                        "Kích thước file không được vượt quá "
                                + ValidationUtils.formatFileSize(5 * 1024 * 1024)
                );

                req.setAttribute("user", user);

                req.getRequestDispatcher(
                        "/views/profile.jsp"
                ).forward(req, resp);

                return;
            }

            if (imagePart != null
                    && imagePart.getSize() > 0) {

                newAvatar =
                        saveAvatar(imagePart, req);

                if (newAvatar != null) {
                    user.setAvatar(newAvatar);
                }
            }

        } catch (Exception e) {

            if (newAvatar != null) {
                deleteOldAvatar(
                        newAvatar,
                        req
                );
            }

            e.printStackTrace();

            req.setAttribute("error",
                    "Lỗi khi upload ảnh đại diện"
            );

            req.setAttribute("user", user);

            req.getRequestDispatcher(
                    "/views/profile.jsp"
            ).forward(req, resp);

            return;
        }

        // 9. Cập nhật database
        try {

            userService.update(user);

            if (newAvatar != null) {
                deleteOldAvatar(
                        oldAvatar,
                        req
                );
            }

            // 8. Cập nhật Session
            session.setAttribute("account", user);

            // 9. Thông báo thành công
            req.setAttribute("success",
                    "Cập nhật hồ sơ thành công"
            );

            req.setAttribute("user", user);

            req.getRequestDispatcher(
                    "/views/profile.jsp"
            ).forward(req, resp);

        } catch (Exception e) {

            if (newAvatar != null) {
                deleteOldAvatar(
                        newAvatar,
                        req
                );
            }

            e.printStackTrace();

            req.setAttribute("error",
                    "Cập nhật hồ sơ thất bại"
            );

            req.setAttribute("user", user);

            req.getRequestDispatcher(
                    "/views/profile.jsp"
            ).forward(req, resp);
        }
    }

    private String getProfileAction(
            HttpServletRequest req) {

        return req.getContextPath()
                + req.getServletPath();
    }

    /**
     * Lưu avatar vào thư mục uploads
     */
    private String saveAvatar(
            Part imagePart,
            HttpServletRequest req)
            throws IOException {

        if (imagePart == null
                || imagePart.getSize() == 0) {

            return null;
        }

        String submittedFileName =
                imagePart.getSubmittedFileName();

        if (submittedFileName == null
                || submittedFileName.isBlank()) {

            return null;
        }

        String originalFileName =
                Paths.get(submittedFileName)
                        .getFileName()
                        .toString();

        int dotIndex =
                originalFileName.lastIndexOf(".");

        String extension = "";

        if (dotIndex > 0) {
            extension =
                    originalFileName.substring(dotIndex);
        }

        String fileName =
                System.currentTimeMillis()
                        + extension;

        String uploadPath =
                req.getServletContext()
                        .getRealPath("/assets/uploads");

        File uploadDir =
                new File(uploadPath);

        if (!uploadDir.exists()) {
            uploadDir.mkdirs();
        }

        imagePart.write(
                uploadPath
                        + File.separator
                        + fileName
        );

        return fileName;
    }

    /**
     * Xóa avatar cũ
     */
    private void deleteOldAvatar(
            String fileName,
            HttpServletRequest req) {

        if (fileName == null
                || fileName.isBlank()
                || fileName.startsWith("http")) {

            return;
        }

        try {

            String uploadPath =
                    req.getServletContext()
                            .getRealPath("/assets/uploads");

            File oldFile =
                    new File(
                            uploadPath
                                    + File.separator
                                    + fileName
                    );

            if (oldFile.exists()) {
                oldFile.delete();
            }

        } catch (Exception e) {

            e.printStackTrace();
        }
    }
}
