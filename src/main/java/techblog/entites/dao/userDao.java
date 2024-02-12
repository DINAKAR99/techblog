package techblog.entites.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import techblog.entites.User;

public class userDao {
    private Connection conn;

    public userDao(Connection conn) {
        this.conn = conn;
    }

    public boolean saveUser(User u1) {

        boolean f = false;
        try {
            String query = "insert into user_data (name,password,email,gender,about) values(?,?,?,?,?)";
            PreparedStatement statement = conn.prepareStatement(query);

            statement.setString(1, u1.getName());
            statement.setString(2, u1.getPassword());
            statement.setString(3, u1.getEmail());
            statement.setString(4, u1.getGender());
            statement.setString(5, u1.getAbout());

            statement.executeUpdate();
            f = true;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return f;
    }

    // fetch user

    public User getUserbyEmailAndPassword(String email, String pass) throws SQLException {
        User u1 = null;
        String query = "select * from user_data where email=? and password=? ";

        PreparedStatement statement = conn.prepareStatement(query);

        statement.setString(1, email);
        statement.setString(2, pass);

        System.out.println(statement);
        ResultSet executeQuery = statement.executeQuery();

        if (executeQuery.next()) {

            u1 = new User();
            u1.setName(executeQuery.getString("name"));
            u1.setEmail(executeQuery.getString("email"));
            u1.setPassword(executeQuery.getString("password"));
            u1.setGender(executeQuery.getString("gender"));
            u1.setAbout(executeQuery.getString("about"));
            u1.setProfile(executeQuery.getString("profile"));
            u1.setId(executeQuery.getInt("id"));
            u1.setRdate(executeQuery.getTimestamp("regis_date"));

        }

        return u1;

    }

    public boolean updateUser(User user) {
        boolean f = false;
        try {
            String query = "update user_data set name=?,email=?,password=?,gender=?,about=?,profile=? where id=?";
            PreparedStatement p = conn.prepareStatement(query);
            p.setString(1, user.getName());
            p.setString(2, user.getEmail());
            p.setString(3, user.getPassword());
            p.setString(4, user.getGender());
            p.setString(5, user.getAbout());
            p.setString(6, user.getProfile());
            p.setInt(7, user.getId());

            p.executeUpdate();
            f = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

    public User getUserByUserid(int id) {

        User u1 = null;

        String query = "select * from user_data where id=" + id;
        try {
            PreparedStatement statement = conn.prepareStatement(query);
            // statement.setInt(1, id);

            ResultSet executeQuery = statement.executeQuery();

            if (executeQuery.next()) {
                u1 = new User();
                u1.setName(executeQuery.getString("name"));
                u1.setEmail(executeQuery.getString("email"));
                u1.setPassword(executeQuery.getString("password"));
                u1.setGender(executeQuery.getString("gender"));
                u1.setAbout(executeQuery.getString("about"));
                u1.setProfile(executeQuery.getString("profile"));
                u1.setId(executeQuery.getInt("id"));
                u1.setRdate(executeQuery.getTimestamp("regis_date"));

            }

        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return u1;

    }

}
