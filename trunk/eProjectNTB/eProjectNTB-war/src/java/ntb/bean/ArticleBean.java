/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package ntb.bean;

import BeanCRUD.AccountsFacade;
import BeanCRUD.ApartmentsFacade;
import BeanCRUD.ArticlesFacade;
import BeanInfo.Accounts;
import BeanInfo.Apartments;
import BeanInfo.Articles;
import Helpers.Messages;
import Helpers.ThaoTacSession;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.ejb.EJB;
import javax.faces.application.FacesMessage;
import javax.faces.model.SelectItem;

/**
 * This class contains methods to operate with database on Roles table
 * @author Nhat Nguyen
 */
public class ArticleBean {

    @EJB
    private AccountsFacade accountsFacade;
    @EJB
    private ApartmentsFacade apartmentsFacade;
    @EJB
    private ArticlesFacade articlesFacade;
    private Articles article = new Articles();
    private int errors = 1;
    private Accounts account = new Accounts();
    private String username;
    private Apartments apartment = new Apartments();
    private int apartmentID;

    /** Creates a new instance of ArticleBean */
    public ArticleBean() {
    }

    public List<Articles> getListArticle() {
        return this.articlesFacade.findAll();
    }

    /**
     * Get list account show in combo box
     * This helps Administrator operate easily
     * @return account list, Type: java.util.ArrayList
     */
    public ArrayList<SelectItem> getListWriter() {
        ArrayList<SelectItem> temp = new ArrayList<SelectItem>();
        List<Accounts> list = this.accountsFacade.findAll();
        for (Accounts a : list) {
            SelectItem si = new SelectItem(a.getUsername(), a.getLastName() + " " + a.getFirstName());
            temp.add(si);
        }
        return temp;
    }

    /**
     * Get list apartment's ID show in combo box
     * This helps Administrator operate easily
     * @return apartment's ID list, Type: java.util.ArrayList
     */
    public ArrayList<SelectItem> getListApartmentID() {
        ArrayList<SelectItem> temp = new ArrayList<SelectItem>();
        List<Apartments> list = this.apartmentsFacade.findAll();
        for (Apartments a : list) {
            SelectItem si = new SelectItem(a.getApartmentID(), a.getApartmentID().toString());
            temp.add(si);
        }
        return temp;
    }

    public void createArticle() {
        try {
            Accounts accTemp = this.accountsFacade.find(this.username);
            Apartments apaTemp = this.apartmentsFacade.find(this.apartmentID);
            this.article.setAccounts(accTemp);
            this.article.setApartments(apaTemp);
            this.article.setDateCreate(new Date());
            this.article.setStatus(Boolean.TRUE);
            this.articlesFacade.create(article);
            Messages.taoTB(FacesMessage.SEVERITY_INFO, "New article have been created successully", "Finish!");
            this.setErrors(0);
        } catch (Exception ex) {
            Messages.taoTB(FacesMessage.SEVERITY_ERROR, "", "Error: " + ex.getMessage());
        }
    }

    public void updateArticle() {
        this.getArticle().setArticleID(Integer.parseInt(ThaoTacSession.layXuong("articleID").toString()));
        try {
            Accounts accTemp = this.accountsFacade.find(this.username);
            Apartments apaTemp = this.apartmentsFacade.find(this.apartmentID);
            this.article.setAccounts(accTemp);
            this.article.setApartments(apaTemp);
            this.article.setDateCreate(new Date());
            this.articlesFacade.edit(getArticle());
            Messages.taoTB(FacesMessage.SEVERITY_INFO, "The article updated successfully", "Finish!");
            ThaoTacSession.xoaGT("articleID");
            this.setErrors(0);
        } catch (Exception ex) {
            Messages.taoTB(FacesMessage.SEVERITY_ERROR, "", "Error: " + ex.getMessage());
        }
    }

    public void deleteArticle() {
        this.setArticle((Articles) ThaoTacSession.layXuong("article"));
        try {
            this.articlesFacade.remove(getArticle());
            Messages.taoTB(FacesMessage.SEVERITY_INFO, "You deleted article", "Finish!");
            ThaoTacSession.xoaGT("article");
            this.setErrors(0);
        } catch (Exception ex) {
            Messages.taoTB(FacesMessage.SEVERITY_ERROR, "", "Error: " + ex.getMessage());
        }
    }

    public void setArticleToSession() {
        ThaoTacSession.duaGTLenSession("article", this.article);
    }

    public void setArticleIDToSession() {
        ThaoTacSession.duaGTLenSession("articleID", this.article.getArticleID());
    }

    /**
     * @return the article
     */
    public Articles getArticle() {
        return article;
    }

    /**
     * @param article the article to set
     */
    public void setArticle(Articles article) {
        this.article = article;
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
     * @return the account
     */
    public Accounts getAccount() {
        return account;
    }

    /**
     * @param account the account to set
     */
    public void setAccount(Accounts account) {
        this.account = account;
    }

    /**
     * @return the username
     */
    public String getUsername() {
        return username;
    }

    /**
     * @param username the username to set
     */
    public void setUsername(String username) {
        this.username = username;
    }

    /**
     * @return the apartment
     */
    public Apartments getApartment() {
        return apartment;
    }

    /**
     * @param apartment the apartment to set
     */
    public void setApartment(Apartments apartment) {
        this.apartment = apartment;
    }

    /**
     * @return the apartmentID
     */
    public int getApartmentID() {
        return apartmentID;
    }

    /**
     * @param apartmentID the apartmentID to set
     */
    public void setApartmentID(int apartmentID) {
        this.apartmentID = apartmentID;
    }
}
