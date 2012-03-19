/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Helpers;

import java.util.Calendar;
import java.util.Date;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 *
 * @author Nhat Nguyen
 */
public class CompareDate {

    public String comparePermit(Date day1, Date day2) {
        Calendar c1 = Calendar.getInstance();
        Calendar c2 = Calendar.getInstance();

        c1.setTime(day1);
        c2.setTime(day2);

        if (c1.before(c2)) {
            return "Received";
        } else if (c1.after(c2)) {
            return "Waiting";
        } else if (c1.equals(c2)) {
            return "Receiving";
        }
        return "";
    }

    /**
     * Check phone number
     * @param phone
     * @return
     */
    public boolean checkPhone(String phone) {
        if (phone.equals("")) {
            return true;
        }
        if (phone.length() > 20 || phone.length() < 8) {
            return false;
        } else {
            String strPattern = "[^0-9]";
            Pattern p;
            Matcher m;
            int flag = Pattern.CASE_INSENSITIVE;
            p = Pattern.compile(strPattern, flag);
            m = p.matcher(phone);
            return !m.find();
        }
    }
}
