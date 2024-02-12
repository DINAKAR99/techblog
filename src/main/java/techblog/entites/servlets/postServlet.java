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
import techblog.entites.Post;
import techblog.entites.User;
import techblog.entites.dao.PostDao;
import techblog.entites.helper.ConnectionProvider;
import techblog.entites.helper.helper;

@WebServlet("/postservlet")
@MultipartConfig
public class postServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session1 = req.getSession();
        resp.setContentType("text/html");

        // fecthing userid

        User u1 = (User) session1.getAttribute("user");
        int userid = u1.getId();

        /// fecthing the form data
        String title = req.getParameter("ptitle");
        String content = req.getParameter("pcontent");
        String code = req.getParameter("pcode");
        Part part = req.getPart("image1");
        String pic = part.getSubmittedFileName();
        int catid = Integer.parseInt(req.getParameter("catid"));

        ////////

        //// post obj

        Post samplePost = new Post(title, content, code, pic, catid, userid);

        //// post obj

        PostDao dao = new PostDao(ConnectionProvider.getConnection());

        boolean injectPosts = dao.injectPosts(samplePost);

        PrintWriter writer = resp.getWriter();
        if (injectPosts) {

            String path = getServletContext().getRealPath("/post_pics/") + File.separator + pic;

            helper.saveFile(part.getInputStream(), path);

            System.out.println(samplePost);
            Message m1 = new Message("POST INJECTION SUCCESSFUL ", "SUCCESS", "alert-success");
            session1.setAttribute("msg1", m1);

            writer.println("done");

        } else {
            Message msg = new Message("POST INJECTION FAILED....", "error", "alert-danger");
            session1.setAttribute("msg1", msg);
            System.out.println(samplePost);
            writer.println("error");
        }

    }

}
