package techblog.entites;

public class Comment {
    public int uid;
    public String comment;

    public Comment(int uid, String comment) {
        this.uid = uid;
        this.comment = comment;
    }

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    @Override
    public String toString() {
        return "Comment [uid=" + uid + ", comment=" + comment + "]";
    }
}
