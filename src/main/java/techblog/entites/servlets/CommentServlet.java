package techblog.entites.servlets;

import java.io.IOException;
import java.sql.Connection;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import techblog.entites.Comment;
import techblog.entites.User;
import techblog.entites.dao.PostDao;
import techblog.entites.helper.ConnectionProvider;

@WebServlet("/commentservlet")
public class CommentServlet extends HttpServlet {
    PostDao p1 = new PostDao(ConnectionProvider.getConnection());

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String comment = req.getParameter("comment");

        int pid = Integer.parseInt(req.getParameter("pid"));

        System.out.println(comment + pid);

        HttpSession session = req.getSession();

        User user = (User) session.getAttribute("user");

        List<Comment> postCommentedByUserinjector = p1.postCommentedByUserinjector(pid, user.getId(), comment);

        System.out.println(postCommentedByUserinjector);
        // req.setAttribute("comments", postCommentedByUserinjector);
        session.setAttribute("comments", postCommentedByUserinjector);
        resp.sendRedirect("show_code.jsp?post_id=" + pid);

    }

}
