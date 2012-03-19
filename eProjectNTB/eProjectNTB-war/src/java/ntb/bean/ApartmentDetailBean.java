/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package ntb.bean;

import BeanCRUD.ArticlesFacade;
import BeanInfo.Apartments;
import BeanInfo.Articles;
import Helpers.ThaoTacSession;
import javax.ejb.EJB;

/**
 *
 * @author Administrator
 */
public class ApartmentDetailBean {

    @EJB
    private ArticlesFacade articlesFacade;
    private Apartments apartment = new Apartments();
    private double apartmentPrice;

    public double getApartmentPrice() {
        return apartmentPrice;
    }

    public void setApartmentPrice(double apartmentPrice) {
        this.apartmentPrice = apartmentPrice;
    }

    public Apartments getApartment() {
        return apartment;
    }

    public void setApartment(Apartments apartment) {
        this.apartment = apartment;
    }
    private Articles articles;

    /** Creates a new instance of ApartmentDetailBean */
    public ApartmentDetailBean() {
        if (ThaoTacSession.layXuong("apartment") != null) {
            this.apartment = (Apartments) ThaoTacSession.layXuong("apartment");
            this.apartmentPrice = this.apartment.getArea() * this.apartment.getFloors().getPrice();
        }
    }

    /**
     * @return the partment
     */

    /**
     * @return the articles
     */
    public Articles getArticles() {
        return articles;
    }

    /**
     * @param articles the articles to set
     */
    public void setArticles(Articles articles) {
        this.articles = articles;
    }
}
