package techblog.entites.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import techblog.entites.Message;
import techblog.entites.User;
import techblog.entites.dao.userDao;
import techblog.entites.helper.ConnectionProvider;

@WebServlet("/login")
public class loginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String p1 = req.getParameter("email");
        String p2 = req.getParameter("password");

        userDao u1 = new userDao(ConnectionProvider.getConnection());

        try {
            User user1 = u1.getUserbyEmailAndPassword(p1, p2);

            if (user1 == null) {
                // error page

                resp.setContentType("text/html");
                PrintWriter writer = resp.getWriter();
                // writer.println("invalid credentials try again ");

                Message m1 = new Message("invalid credentials", "error", "alert-danger");
                HttpSession session = req.getSession();
                session.setAttribute("msg", m1);
                resp.sendRedirect("login.jsp");
            }

            else {

                HttpSession session = req.getSession();

                session.setAttribute("user", user1);

                resp.sendRedirect("profile.jsp");
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

    }

}
