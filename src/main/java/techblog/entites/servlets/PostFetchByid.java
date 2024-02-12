package techblog.entites.servlets;

import java.io.IOException;
import java.util.ArrayList;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import techblog.entites.Post;
import techblog.entites.dao.PostDao;
import techblog.entites.helper.ConnectionProvider;

@WebServlet("/postfecthbyid")
public class PostFetchByid extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        int catid = Integer.parseInt(req.getParameter("catid"));
        System.out.println(catid);

        PostDao p1 = new PostDao(ConnectionProvider.getConnection());
        ArrayList<Post> fecthPostsByCategory = p1.fecthPostsByCategory(catid);

        // req.setAttribute("fetchedposts", fecthPostsByCategory);

        HttpSession session1 = req.getSession();

        session1.setAttribute("fetchedposts", fecthPostsByCategory);

        // RequestDispatcher requestDispatcher =
        // req.getRequestDispatcher("profile.jsp");
        // requestDispatcher.forward(req, resp);

        resp.sendRedirect("profile.jsp");

    }

}
