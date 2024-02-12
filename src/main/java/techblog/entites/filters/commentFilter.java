package techblog.entites.filters;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import techblog.entites.Comment;
import techblog.entites.User;
import techblog.entites.dao.PostDao;
import techblog.entites.helper.ConnectionProvider;

@WebFilter(urlPatterns = { "/show_code.jsp" })
public class commentFilter implements Filter {

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest req = (HttpServletRequest) request;

        HttpServletResponse resp = (HttpServletResponse) response;

        HttpSession session = req.getSession();

        PostDao p1 = new PostDao(ConnectionProvider.getConnection());

        System.out.println("in commnet filer");
        int pid = Integer.parseInt(req.getParameter("post_id"));

        User user = (User) session.getAttribute("user");

        System.out.println("the pid is " + pid + "---------" + user);

        List<Comment> commentsList = p1.getAllcommentsForPost(pid);

        // System.out.println(commentsList);
        // req.setAttribute("comments", commentsList);
        session.setAttribute("comments", commentsList);

        // chain

        if (user != null) {
            chain.doFilter(request, response);

        } else {
            resp.sendRedirect("login.jsp");
        }

    }

}
