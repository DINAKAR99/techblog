package techblog.entites.servlets;

import java.io.IOException;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import techblog.entites.User;
import techblog.entites.dao.PostDao;
import techblog.entites.helper.ConnectionProvider;

@WebServlet("/postliked")
public class PostLiked extends HttpServlet {

    private HttpSession session;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        int postId = Integer.parseInt(req.getParameter("postId"));
        String action = req.getParameter("action");
        /// fetching user id from current session
        session = req.getSession();
        User u1 = (User) session.getAttribute("user");
        int uid = u1.getId();
        /// fetching user id from current session

        PostDao d1 = new PostDao(ConnectionProvider.getConnection());
        if (action.equalsIgnoreCase("liked")) {
            try {
                int updatedLikes = d1.postlikedbyuserinjector(postId, uid);

                resp.getWriter().write(String.valueOf(updatedLikes));

            } catch (Exception e) {

                e.printStackTrace();
            }

        } else {
            try {
                int updatedLikes = d1.postunlikedbyuserinjector(postId, uid);

                resp.getWriter().write(String.valueOf(updatedLikes));

            } catch (Exception e) {

                e.printStackTrace();
            }

        }

    }

}
