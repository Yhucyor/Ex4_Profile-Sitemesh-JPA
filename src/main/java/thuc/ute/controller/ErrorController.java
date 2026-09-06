package thuc.ute.controller;

import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/error")
public class ErrorController extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(
            HttpServletRequest req,
            HttpServletResponse resp)
            throws ServletException, IOException {

        Object statusCode =
                req.getAttribute(
                        RequestDispatcher.ERROR_STATUS_CODE
                );

        int status =
                HttpServletResponse.SC_NOT_FOUND;

        if (statusCode instanceof Integer) {
            status = (Integer) statusCode;
        }

        req.setAttribute("statusCode", status);
        req.setAttribute("breadcrumbTitle", "Error");

        if (status == HttpServletResponse.SC_NOT_FOUND) {
            req.setAttribute(
                    "errorTitle",
                    "Không tìm thấy trang"
            );
            req.setAttribute(
                    "errorMessage",
                    "Đường dẫn bạn vừa nhập không tồn tại hoặc đã được di chuyển."
            );
        } else {
            req.setAttribute(
                    "errorTitle",
                    "Có lỗi xảy ra"
            );
            req.setAttribute(
                    "errorMessage",
                    "Hệ thống đang gặp sự cố tạm thời. Vui lòng thử lại sau."
            );
        }

        req.getRequestDispatcher(
                "/views/error.jsp"
        ).forward(req, resp);
    }

    @Override
    protected void doPost(
            HttpServletRequest req,
            HttpServletResponse resp)
            throws ServletException, IOException {

        doGet(req, resp);
    }
}
