/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package Helpers;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Enumeration;
import javax.faces.context.FacesContext;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

/**
 *
 * @author PEHA
 */
public class ThaoTacSession {
    public static void duaGTLenSession(String name, Object giaTri){
        FacesContext context=FacesContext.getCurrentInstance();
        HttpSession session=(HttpSession)context.getExternalContext().getSession(false);
        session.setAttribute(name, giaTri);
    }
    public static void xoaGT(String name){
        FacesContext context=FacesContext.getCurrentInstance();
        HttpSession session=(HttpSession)context.getExternalContext().getSession(false);
        session.removeAttribute(name);
    }
    public static Object layXuong(String name){
        FacesContext context=FacesContext.getCurrentInstance();
        HttpSession session=(HttpSession)context.getExternalContext().getSession(false);
        return session.getAttribute(name);
    }

    //ham lay duong dan tuyet doi
    public static String layDuongDan(String tenFolder)
    {
          FacesContext context = FacesContext.getCurrentInstance();
          HttpSession session = (HttpSession) context.getExternalContext().getSession(false);
          ServletContext sc = session.getServletContext();
          String duongDan = sc.getRealPath(tenFolder);
          duongDan=duongDan.replace('\\', '/');
          return duongDan;
    }

    //ham tao folder theo duong dan
    public static void taoFolder(String duongDan){
        File f = new File(duongDan);
        f.mkdirs();
    }

    //ham tao file theo vi tri
    public static boolean taoFileTheoViTri(String duongDan, byte[] data){
        File file=new File(duongDan);
        try{
            file.createNewFile();
            FileOutputStream fo=new FileOutputStream(file);
            fo.write(data);
            fo.close();
            return true;
        }catch(IOException ex){
            return false;
        }
    }

    public static void danhSach() {
        FacesContext context = FacesContext.getCurrentInstance();
        HttpSession session = (HttpSession) context.getExternalContext().getSession(false);
        Enumeration<String> en= session.getAttributeNames();
         while (en.hasMoreElements()) {
            String s=en.nextElement();
            System.out.println(s);
            System.out.println(session.getAttribute(s));
        }
    }
}
