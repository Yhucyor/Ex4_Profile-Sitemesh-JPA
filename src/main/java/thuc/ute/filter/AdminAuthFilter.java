package thuc.ute.filter;

import java.io.IOException;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import thuc.ute.entity.User;

public class AdminAuthFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) {
    }

    @Override
    public void doFilter(
            ServletRequest request,
            ServletResponse response,
            FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest req =
                (HttpServletRequest) request;

        HttpServletResponse resp =
                (HttpServletResponse) response;

        HttpSession session =
                req.getSession(false);

        User account = null;

        if (session != null
                && session.getAttribute("account") instanceof User) {
            account =
                    (User) session.getAttribute("account");
        }

        if (account != null
                && account.getRoleid() == 1) {

            chain.doFilter(request, response);
            return;
        }

        if (session != null) {
            session.invalidate();
        }

        resp.sendRedirect(
                req.getContextPath()
                        + "/login?adminRequired=true"
        );
    }

    @Override
    public void destroy() {
    }
}
