/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package Helpers;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

/**
 *
 * @author Titan
 */
public class Encrypted {
    public static String EncryptedPass(String pass) {
        try {
            char ch1,ch2;
            int maAsc;
            MessageDigest md5 = MessageDigest.getInstance("MD5");
            md5.update(pass.getBytes());
            BigInteger dis = new BigInteger(1, md5.digest());
            pass = dis.toString(16);
            String kq="";
            for (int i = 0; i < pass.length(); i++) {
                ch1 = pass.charAt(i);
                maAsc = (int) ch1;
                if (maAsc == 57) {
                    maAsc = 47;
                } else {
                    if (maAsc == 90) {
                        maAsc = 64;
                    } else {
                        if (maAsc == 122) {
                            maAsc = 96;
                        }
                    }
                }
                ch2 = (char) (maAsc + 1);
                kq += String.valueOf(ch2);
            }
            return kq;
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }

        return null;
    }

}
