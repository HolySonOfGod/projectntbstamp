/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Helpers;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;

/**
 *
 * @author Administrator
 */
public class execFile {

    public static void writeFile(String path, byte[] data) throws FileNotFoundException, IOException {
        FileOutputStream out = new FileOutputStream(path);
        out.write(data);
        out.flush();
        out.close();
    }

    public static boolean findFile(String path) {
        File file = new File(path);
        return file.exists();
    }

    public static boolean deleteFile(String path) {
        File file = new File(path);
        return file.delete();
    }
}
