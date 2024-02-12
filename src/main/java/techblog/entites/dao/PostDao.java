package techblog.entites.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import techblog.entites.Category;
import techblog.entites.Comment;
import techblog.entites.Post;

public class PostDao {
    public Connection con;

    public PostDao(Connection con) {
        this.con = con;
    }

    public ArrayList<Category> getAllCategories() {
        ArrayList<Category> list = new ArrayList<>();
        try {
            String q = "select * from category";
            Statement st = con.createStatement();
            ResultSet set = st.executeQuery(q);
            while (set.next()) {
                int cid = set.getInt("cid");
                String name = set.getString("cname");
                String description = set.getString("cdescription");
                Category c = new Category(cid, name, description);
                list.add(c);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public boolean injectPosts(Post p1)

    {

        String getpTitle = p1.getpTitle();
        String getpContent = p1.getpContent();
        String getpCode = p1.getpCode();
        String getpPic = p1.getpPic();
        int catId = p1.getCatId();
        int userid = p1.getUserid();

        boolean flag = false;
        try {
            String q = "INSERT INTO  posts( ptitle, pcontent, pcode, ppic, catid,user_id) VALUES (?, ?, ?, ?, ?,?)";
            PreparedStatement statement = con.prepareStatement(q);

            statement.setString(1, getpTitle);
            statement.setString(2, getpContent);
            statement.setString(3, getpCode);
            statement.setString(4, getpPic);
            statement.setInt(5, catId);
            statement.setInt(6, userid);

            statement.executeUpdate();

            flag = true;

        } catch (Exception e) {
            System.out.println(e);
        }
        return flag;
    }

    public ArrayList<Post> fecthPosts() {

        ArrayList<Post> holder = new ArrayList<>();

        String query = "select * from posts";

        Statement statement;
        try {
            statement = con.createStatement();
            // TODO Auto-generated catch block

            ResultSet sett = statement.executeQuery(query);

            while (sett.next()) {

                int post_id = sett.getInt(1);
                String post_title = sett.getString(2);
                String post_content = sett.getString(3);
                String post_code = sett.getString(4);
                String post_pic = sett.getString(5);
                int cat_id = sett.getInt(6);
                Timestamp post_date = sett.getTimestamp(7);
                int post_user_id = sett.getInt(8);
                Post sample = new Post(post_id, post_title, post_content, post_code, post_pic, post_date, cat_id,
                        post_user_id);

                holder.add(sample);
            }
        } catch (SQLException e) {

            e.printStackTrace();
        }
        return holder;

    }

    public ArrayList<Post> fecthPostsByCategory(int category) {

        ArrayList<Post> holder = new ArrayList<>();

        String query = "select * from posts where catid=?";

        try {
            PreparedStatement statement = con.prepareStatement(query);
            statement.setInt(1, category);

            ResultSet sett = statement.executeQuery();

            while (sett.next()) {

                int post_id = sett.getInt(1);
                String post_title = sett.getString(2);
                String post_content = sett.getString(3);
                String post_code = sett.getString(4);
                String post_pic = sett.getString(5);
                int cat_id = sett.getInt(6);
                Timestamp post_date = sett.getTimestamp(7);
                int post_user_id = sett.getInt(8);
                int post_likes = sett.getInt(9);
                Post sample = new Post(post_id, post_title, post_content, post_code, post_pic, post_date, cat_id,
                        post_user_id);

                sample.setLikes(post_likes);

                holder.add(sample);
            }
        } catch (SQLException e) {

            e.printStackTrace();
        }
        return holder;

    }

    public int updateLikesincrement(int id) throws SQLException {

        int getlikesCount = getlikesCount(id);

        String query = "update  posts  set likes=? where pid=?";
        try (PreparedStatement statement = con.prepareStatement(query)) {
            statement.setInt(1, getlikesCount + 1);
            statement.setInt(2, id);

            int executeUpdate = statement.executeUpdate();

            int updatedlikes = getlikesCount(id);

            System.out.println("the updated likes are for id " + id + "is" + updatedlikes);
            return updatedlikes;
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
            return -1;
        }

    }

    public int updateLikesdecrement(int id) throws SQLException {

        int getlikesCount = getlikesCount(id);

        String query = "update  posts  set likes=? where pid=?";
        try (PreparedStatement statement = con.prepareStatement(query)) {
            statement.setInt(1, getlikesCount - 1);
            statement.setInt(2, id);

            int executeUpdate = statement.executeUpdate();

            int updatedlikes = getlikesCount(id);

            System.out.println("the updated likes are for id " + id + "is" + updatedlikes);
            return updatedlikes;
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
            return -1;
        }

    }

    public int getlikesCount(int id) throws SQLException {

        String query = "select likes from posts  where pid=?";

        PreparedStatement statement = con.prepareStatement(query);
        statement.setInt(1, id);

        ResultSet executeQuery = statement.executeQuery();

        if (executeQuery.next()) {

            int int1 = executeQuery.getInt("likes");
            System.out.println("the likes are for id " + id + "is" + int1);

            return int1;
        } else {

            return -1;
        }

    }

    public Post getPostbyId(int postid) {

        Post post = null;
        try {

            PreparedStatement statement = con.prepareStatement("select * from posts where pid=?");
            statement.setInt(1, postid);
            ResultSet sett = statement.executeQuery();

            if (sett.next()) {
                int post_id = sett.getInt(1);
                String post_title = sett.getString(2);
                String post_content = sett.getString(3);
                String post_code = sett.getString(4);
                String post_pic = sett.getString(5);
                int cat_id = sett.getInt(6);
                Timestamp post_date = sett.getTimestamp(7);
                int post_user_id = sett.getInt(8);
                int post_likes = sett.getInt(9);

                Post sample = new Post(post_id, post_title, post_content, post_code, post_pic, post_date, cat_id,
                        post_user_id, post_likes);

                return sample;

            }

        } catch (Exception e) {

        }

        return post;
    }

    public int postlikedbyuserinjector(int pid, int uid) {
        int executeUpdate = 0;
        String query = "insert into likes (pid,uid) values (?,?)";
        try {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, pid);
            ps.setInt(2, uid);

            ps.executeUpdate();
            executeUpdate = getlikeCountForPost(pid);
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return executeUpdate;

    }

    public int postunlikedbyuserinjector(int pid, int uid) {
        int executeUpdate = 0;
        String query = "delete from likes where pid=? and uid=? ";
        try {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, pid);
            ps.setInt(2, uid);

            executeUpdate = ps.executeUpdate();
            executeUpdate = getlikeCountForPost(pid);
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return executeUpdate;

    }

    public int getlikeCountForPost(int pid) throws SQLException {

        String query = "select count(*) as likes_count from likes  where pid=?";

        PreparedStatement statement = con.prepareStatement(query);
        statement.setInt(1, pid);

        ResultSet executeQuery = statement.executeQuery();

        if (executeQuery.next()) {

            int int1 = executeQuery.getInt(1);
            System.out.println("the likes are for id " + pid + "is" + int1);

            return int1;
        } else {

            return -1;
        }

    }

    public int getlikeCountForPostbyUid(int pid, int uid) throws SQLException {

        String query = "select count(*) as likes_count from likes  where pid=? and uid=?";

        PreparedStatement statement = con.prepareStatement(query);
        statement.setInt(1, pid);
        statement.setInt(2, uid);

        ResultSet executeQuery = statement.executeQuery();

        if (executeQuery.next()) {

            int int1 = executeQuery.getInt(1);
            System.out.println("the likes are for id " + pid + "is" + int1);

            return int1;
        } else {

            return -1;
        }

    }

    /// comments part
    public List<Comment> postCommentedByUserinjector(int pid, int uid, String comment) {

        String query = "insert into comments (pid,uid,comment) values (?,?,?)";
        List<Comment> updatedCommentsForPost = new ArrayList<>();
        try {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, pid);
            ps.setInt(2, uid);
            ps.setString(3, comment);

            ps.executeUpdate();
            updatedCommentsForPost = getAllcommentsForPost(pid);

        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return updatedCommentsForPost;

    }

    public List<Comment> getAllcommentsForPost(int pid) {
        String query = "select uid,comment  from comments where pid=?";

        System.out.println(pid);
        List<Comment> commentsList = new ArrayList<>();

        try {
            PreparedStatement ps = con.prepareStatement(query);

            ps.setInt(1, pid);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Comment c1 = null;
                int uid = rs.getInt(1);
                String comment = rs.getString(2);
                if (comment == null) {
                    comment = "empty";

                }

                System.out.println("the retrived comment is " + comment);
                c1 = new Comment(uid, comment);

                commentsList.add(c1);
                System.out.println(c1);

            }

        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return commentsList;

    }

    public int getAllcommentsCountForPost(int pid) {
        String query = "select  count(*) from comments where pid=?";

        System.out.println(pid);

        int count = 0;

        try {
            PreparedStatement ps = con.prepareStatement(query);

            ps.setInt(1, pid);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {

                count = rs.getInt(1);
            }

        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return count;

    }

}
