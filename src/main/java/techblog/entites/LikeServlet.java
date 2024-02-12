package techblog.entites;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import techblog.entites.dao.LikeDao;
import techblog.entites.helper.ConnectionProvider;

@WebServlet("/likeservlet")
public class LikeServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String operation = req.getParameter("operation");

        PrintWriter writer = resp.getWriter();
        resp.setContentType("text/html");

        int pid = Integer.parseInt(req.getParameter("pid"));
        int uid = Integer.parseInt(req.getParameter("uid"));
        if (operation.equals("like")) {

            LikeDao likeDao = new LikeDao(ConnectionProvider.getConnection());
            boolean insertlike = likeDao.insertlike(pid, uid);

            writer.println(insertlike);
        }

    }

}
