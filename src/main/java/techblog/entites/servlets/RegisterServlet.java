package techblog.entites.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import techblog.entites.User;
import techblog.entites.dao.userDao;
import techblog.entites.helper.ConnectionProvider;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

@MultipartConfig
@WebServlet("/registerservlet")
public class RegisterServlet extends HttpServlet {

  @Override
  protected void doPost(HttpServletRequest req, HttpServletResponse resp)
      throws ServletException, IOException {
    String check = req.getParameter("check");

    resp.setContentType("text/html");
    PrintWriter writer = resp.getWriter();

    if (check == null) {
      writer.println("Box not checked");
    } else {
      // accept the data
      String name = req.getParameter("user_name");
      String email = req.getParameter("user_email");
      String password = req.getParameter("user_password");
      String gender = req.getParameter("gender");
      String about = req.getParameter("about");

      User user = new User(name, email, password, about, gender);
      userDao userDao = new userDao(ConnectionProvider.getConnection());

      if (userDao.saveUser(user)) {
        writer.println("done");
      } else {
        writer.println("Error 404");
      }
    }
  }
}
