package techblog.entites;

import java.util.Date;

public class User {
    private int id;
    private String name;
    private String email;
    private String password;
    private String about;
    private String gender;
    private Date rdate;
    private String profile;

    public User(String name, String email, String password, String about, String gender, Date rdate, String profile) {
        this.name = name;
        this.email = email;
        this.password = password;
        this.about = about;
        this.gender = gender;
        this.rdate = rdate;
        this.profile = profile;
    }

    public String getProfile() {
        return profile;
    }

    public void setProfile(String profile) {
        this.profile = profile;
    }

    public Date getRdate() {
        return rdate;
    }

    public void setRdate(Date rdate) {
        this.rdate = rdate;
    }

    public User(String name, String email, String password, String about, String gender) {
        this.name = name;
        this.email = email;
        this.password = password;
        this.about = about;
        this.gender = gender;
    }

    public User() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getAbout() {
        return about;
    }

    public void setAbout(String about) {
        this.about = about;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    @Override
    public String toString() {
        return "user [id=" + id + ", name=" + name + ", email=" + email + ", password=" + password + ", about=" + about
                + ", gender=" + gender + "]";
    }

}
