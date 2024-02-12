package techblog.entites.helper;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;

public class helper {
    public static boolean deleteFile(String path) {

        boolean flag = false;

        try {

            File f1 = new File(path);

            f1.delete();
            flag = true;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return flag;

    }

    public static boolean saveFile(InputStream i1, String path) {

        boolean flag = false;

        try {
            byte[] container = new byte[i1.available()];

            i1.read(container);

            FileOutputStream fs = new FileOutputStream(path);

            fs.write(container);
            flag = true;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return flag;
    }

}
