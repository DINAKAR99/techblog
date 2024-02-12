package techblog.entites.filters;

import java.io.IOException;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import techblog.entites.User;

@WebFilter(urlPatterns = { "/profile.jsp", "/profileEdit.jsp", "/postfecthbyid", "/show_code.jsp" })
public class AuthFilterr implements Filter {

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException

    {
        HttpServletRequest request2 = (HttpServletRequest) request;

        HttpServletResponse response2 = (HttpServletResponse) response;

        HttpSession session = request2.getSession();

        User u1 = (User) session.getAttribute("user");

        if (u1 != null) {
            chain.doFilter(request, response);

        } else {
            response2.sendRedirect("login.jsp");
        }

    }

}
