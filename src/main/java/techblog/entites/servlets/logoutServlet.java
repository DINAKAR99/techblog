package techblog.entites.servlets;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import techblog.entites.Message;

@WebServlet("/logoutservlet")
public class logoutServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        HttpSession session = req.getSession();

        session.removeAttribute("user");

        Message m2 = new Message("logout succesfull ", "success", "alert-success");
        session.setAttribute("msg", m2);

        resp.sendRedirect("login.jsp");

    }

}
