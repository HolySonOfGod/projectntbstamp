/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package ntb.bean;

import BeanCRUD.NewsFacade;
import BeanCRUD.NewsTypesFacade;
import BeanInfo.NewsTypes;
import BeanInfo.News;
import Helpers.hinhPhoto;
import Helpers.Messages;
import Helpers.ThaoTacSession;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;
import javax.ejb.EJB;
import javax.faces.application.FacesMessage;
import javax.faces.event.ValueChangeEvent;
import javax.faces.model.SelectItem;
import org.richfaces.event.UploadEvent;
import org.richfaces.model.UploadItem;

/**
 *
 * @author Nhat Nguyen
 */
public class NewsBean {

    @EJB
    private NewsTypesFacade newsTypesFacade;
    @EJB
    private NewsFacade newsFacade;
    private News news = new News();
    private NewsTypes newsType = new NewsTypes();
    private int errors = 1;
    private ArrayList<hinhPhoto> files = new ArrayList<hinhPhoto>();
    private int newTypeID;

    public List<News> getListNews() {
        return this.newsFacade.findAll();
    }

    public NewsBean() {
        if (ThaoTacSession.layXuong("chuyenNewsTypeID") != null) {
            this.newsType = (NewsTypes) ThaoTacSession.layXuong("chuyenNewsTypeID");
        }
    }
   
    public List<News> getListNewsByType() {
         if (ThaoTacSession.layXuong("chuyenNewsTypeID") != null) {
            this.newsType = (NewsTypes) ThaoTacSession.layXuong("chuyenNewsTypeID");
        }
        return this.newsFacade.findByNewsTypeID(newsType);
    }

    public int getSize() {
        if (getFiles().size() > 0) {
            return getFiles().size();
        } else {
            return 0;
        }
    }

    public long getTimeStamp() {
        return System.currentTimeMillis();
    }

    //show len hinh da up sau khi bam nut upload
    public void paint(OutputStream stream, Object object) throws IOException {
        stream.write(getFiles().get((Integer) object).getDuLieu());
    }

    //tao session IMG save img
    public void listener(UploadEvent e) {
        UploadItem item = (UploadItem) e.getUploadItem();
        if (item.getFileName() == null) {
            return;
        }
        hinhPhoto hinh = new hinhPhoto(item.getFileName(), item.getData());
        ThaoTacSession.duaGTLenSession("IMG", hinh);
    }

    private void copyHinh(String duongDan) throws IOException {
        hinhPhoto hinh = (hinhPhoto) ThaoTacSession.layXuong("IMG");
        String duongdanhhinh = duongDan + "/" + hinh.getTenHinh();
        File hinh1 = new File(duongdanhhinh);
        System.out.println("duong dan " + duongdanhhinh);
        hinh1.createNewFile();
        FileOutputStream fo = new FileOutputStream(hinh1);
        System.out.println("Truoc khi get du lieu");
        fo.write(hinh.getDuLieu());
        System.out.println("sau khi get du lieu");
        fo.flush();
        fo.close();
    }

    private void upHinhLenHost(String duongdan) throws IOException {
        hinhPhoto hinh = (hinhPhoto) ThaoTacSession.layXuong("IMG");
        String duongdanhhinh = duongdan + "/" + hinh.getTenHinh();
        File hinh1 = new File(duongdanhhinh);
        System.out.println("duong dan " + duongdanhhinh);
        hinh1.createNewFile();
        FileOutputStream fo = new FileOutputStream(hinh1);
        System.out.println("Truoc khi get du lieu");
        fo.write(hinh.getDuLieu());
        System.out.println("sau khi get du lieu");
        fo.flush();
        fo.close();
    }

    public ArrayList<SelectItem> getListNewType() {
        ArrayList<SelectItem> temp = new ArrayList<SelectItem>();
        List<NewsTypes> list = this.newsTypesFacade.findAll();
        for (NewsTypes m : list) {
            SelectItem si = new SelectItem(m.getTypeName() + "_" + m.getNewsTypeID());
            temp.add(si);
        }
        return temp;
    }

    public void valueChanged(ValueChangeEvent e) {
        String value = e.getNewValue().toString();
        String s = value.split("_")[1];
        int i = Integer.parseInt(s);
        this.setNewsType(newsTypesFacade.find(i));
        ThaoTacSession.duaGTLenSession("newTypeID", this.getNewsType());
    }

    public ArrayList<SelectItem> getListTypeCreate() {
        ArrayList<SelectItem> temp = new ArrayList<SelectItem>();
        List<NewsTypes> list = this.newsTypesFacade.findAll();
        for (NewsTypes m : list) {
            SelectItem si = new SelectItem(m.getNewsTypeID(), m.getTypeName());
            temp.add(si);
        }
        return temp;
    }

    public void createNews() throws FileNotFoundException, IOException {
        NewsTypes tam1 = this.newsTypesFacade.find(this.newTypeID);
        this.news.setNewsTypes(tam1);
        this.news.setStatus(Boolean.TRUE);

        //lam viec voi image
        hinhPhoto img = (hinhPhoto) ThaoTacSession.layXuong("IMG");
        news.setNewsImage("images/upload/" + img.getTenHinh());

        //viet hinh vao folder
        String duongdan = ThaoTacSession.layDuongDan("user");
        duongdan = duongdan + "/images/upload";
        this.upHinhLenHost(duongdan);
        this.copyHinh("C:/Documents and Settings/Administrator/Desktop/Source Code/eProjectNTB/eProjectNTB-war/web/user/images/upload");

        this.newsFacade.create(news);
        Messages.taoTB(FacesMessage.SEVERITY_INFO, "Create Successfull", "Create Event Successfull");
        this.errors = 0;
    }

    public void updateNews() {
        this.news.setNewsID(Integer.parseInt(ThaoTacSession.layXuong("newsID").toString()));
        newsType = (NewsTypes) ThaoTacSession.layXuong("newTypeID");
        ThaoTacSession.xoaGT("newTypeID");
        this.news.setNewsTypes(newsType);
        this.newsFacade.edit(news);
        Messages.taoTB(FacesMessage.SEVERITY_INFO, "Update Sucessful", "Update News Sucessfull");
        this.setErrors(0);
        ThaoTacSession.xoaGT("newsID");
    }

    public void deleteNews() {
        this.news = (News) ThaoTacSession.layXuong("news");
        ThaoTacSession.xoaGT("news");
        this.newsFacade.remove(news);
        Messages.taoTB(FacesMessage.SEVERITY_INFO, "Delete Successfull", "Delete News Successfull");
    }

    public void setNewsToSession() {
        ThaoTacSession.duaGTLenSession("news", this.news);
    }

    public void setNewsIDToSession() {
        ThaoTacSession.duaGTLenSession("newsID", this.news.getNewsID());
    }

    /**
     * @return the news
     */
    public News getNews() {
        return news;


    }

    /**
     * @param news the news to set
     */
    public void setNews(News news) {
        this.news = news;


    }

    /**
     * @return the newsType
     */
    public NewsTypes getNewsType() {
        return newsType;


    }

    /**
     * @param newsType the newsType to set
     */
    public void setNewsType(NewsTypes newsType) {
        this.newsType = newsType;

    }

    /**
     * @return the errors
     */
    public int getErrors() {
        return errors;
    }

    /**
     * @param errors the errors to set
     */
    public void setErrors(int errors) {
        this.errors = errors;
    }

    /**
     * @return the files
     */
    public ArrayList<hinhPhoto> getFiles() {
        return files;
    }

    /**
     * @param files the files to set
     */
    public void setFiles(ArrayList<hinhPhoto> files) {
        this.files = files;
    }

    /**
     * @return the newTypeID
     */
    public int getNewTypeID() {
        return newTypeID;
    }

    /**
     * @param newTypeID the newTypeID to set
     */
    public void setNewTypeID(int newTypeID) {
        this.newTypeID = newTypeID;
    }
}
