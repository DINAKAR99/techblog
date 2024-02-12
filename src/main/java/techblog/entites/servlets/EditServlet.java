package techblog.entites.servlets;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import techblog.entites.Message;
import techblog.entites.User;
import techblog.entites.dao.userDao;
import techblog.entites.helper.ConnectionProvider;
import techblog.entites.helper.helper;

@WebServlet("/Edit")
@MultipartConfig
public class EditServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        resp.setContentType("text/html");

        PrintWriter out = resp.getWriter();

        // fetch all data
        String userEmail = req.getParameter("user_email");
        String userNmae = req.getParameter("user_name");
        String userPassword = req.getParameter("user_password");
        String userAbout = req.getParameter("user_about");
        String gender = req.getParameter("gender");
        Part part = req.getPart("image");
        String imageName = part.getSubmittedFileName();
        // the external variables
        String checkVal = req.getParameter("delpic");
        String trim = "dal";
        if (checkVal != null) {

            trim = checkVal.trim();
        }
        String oldPicVal = req.getParameter("old_pic");

        // get the user from the session...
        HttpSession session1 = req.getSession();
        User user = (User) session1.getAttribute("user");
        user.setEmail(userEmail);
        user.setName(userNmae);
        user.setPassword(userPassword);
        user.setAbout(userAbout);
        user.setProfile(imageName);
        user.setGender(gender);

        userDao userDao = new userDao(ConnectionProvider.getConnection());
        boolean ans = userDao.updateUser(user);
        if (ans) {

            String path = getServletContext().getRealPath("/pics/") + File.separator + user.getProfile();
            if (trim.equals("del")) {
                out.println("checkval was del");

                String path1 = getServletContext().getRealPath("/pics/") + File.separator + oldPicVal;

                helper.deleteFile(path1);
                Message m1 = new Message("PROFILE PIC DELETED ", "SUCCESS", "alert-success");
                session1.setAttribute("msg", m1);
            } else {

                if (helper.saveFile(part.getInputStream(), path)) {

                    out.println("updated to db");

                    Message m1 = new Message("PROFILE UPDATED ", "SUCCESS", "alert-success");
                    session1.setAttribute("msg", m1);
                } else {
                    Message msg = new Message("Something went wrong....", "error", "alert-danger");
                    session1.setAttribute("msg", msg);
                    out.println("not updated to db but ans=true ");
                }
            }

        } else {
            out.println("not updated..");
            Message msg = new Message("Something went wrong....", "error", "alert-danger");
            session1.setAttribute("msg", msg);

        }
        resp.sendRedirect("profile.jsp");
    }

}
