package techblog.entites.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import techblog.entites.Like;

public class LikeDao {

    private Connection conn;

    public LikeDao(Connection conn) {
        this.conn = conn;
    }

    public boolean insertlike(int pid, int uid) {

        try {
            PreparedStatement statement = conn.prepareStatement("insert into like values(?,?,?)");

            statement.setInt(2, pid);
            statement.setInt(3, uid);

            statement.executeUpdate();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        boolean f = false;

        return f;

    }

    public int countLikeonpost(int pid) {
        int count = 0;
        String q = "select count(*) from like where pid=?";

        try {
            PreparedStatement ps = conn.prepareStatement(q);

            ps.setInt(1, pid);

            ResultSet rs = ps.executeQuery();

            // if (rs.next()) {
            // rs.getInt();

            // }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return count;

    }

    public int isLikedByuser(int pid, int uid) {
        int count = 0;
        String q = "select count(*) from like where pid=? and uid=?";

        try {
            PreparedStatement ps = conn.prepareStatement(q);

            ps.setInt(1, pid);
            ps.setInt(2, uid);

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

    public boolean deleteLike(int pid, int uid) {

        boolean f = false;
        int count = 0;
        String q = "delete from like where pid=? and uid=?";

        try {
            PreparedStatement ps = conn.prepareStatement(q);

            ps.setInt(1, pid);
            ps.setInt(2, uid);

            int executeUpdate = ps.executeUpdate();
            f = true;
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return f;

    }
}
