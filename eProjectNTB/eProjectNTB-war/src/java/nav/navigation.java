/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package nav;

import BeanInfo.ApartmentTypes;
import BeanInfo.Apartments;
import BeanInfo.Contracts;
import BeanInfo.News;
import BeanInfo.NewsTypes;
import Helpers.ThaoTacSession;
import javax.annotation.PostConstruct;

/**
 *
 * @author 
 */
public class navigation {

    private String trangNews;
    private String trangApart;
    private String trangContract;
    private String trangpaymentmode;
    private Contracts contract = new Contracts();
    private News news = new News();
    private NewsTypes NewsType = new NewsTypes();
    private int buildingID;
    private ApartmentTypes apartmentType = new ApartmentTypes();
    private Apartments apartment = new Apartments();

    /** Creates a new instance of navigation */
    public navigation() {
    }

    @PostConstruct
    public void init() {
        trangNews = "newsAll.jsp";
        trangApart = "apartmentAll.jsp";
        trangpaymentmode = "paymentMode.jsp";
        trangContract = "contract.jsp";
    }

    public String chuyenTrangNews() {
        ThaoTacSession.duaGTLenSession("chuyenNewsTypeID", this.NewsType);
        trangNews = "newsList.jsp";
        return null;
    }

    public String chuyenTrangContract() {
        ThaoTacSession.duaGTLenSession("contract", this.contract);
        trangContract = "contractDetail.jsp";
        return null;
    }

    public String chuyenTrangNewsDetail() {
        ThaoTacSession.duaGTLenSession("news", this.news);
        trangNews = "newsDetail.jsp";
        return null;
    }

    public String chuyentrangApartmentList() {
        ThaoTacSession.duaGTLenSession("chuyentrangApartmentTypeID", this.apartmentType);
        trangApart = "apartmentList.jsp";
        return null;
    }

    public String chuyenTrangApartmentDetail(){
        ThaoTacSession.duaGTLenSession("apartment", this.apartment);
        trangApart = "apartmentDetail.jsp";
        return null;
    }

    public String chuyenTrangBuilding() {
        ThaoTacSession.duaGTLenSession("buildingID", this.getBuildingID());
        trangNews = "buildingList.jsp";
        return null;
    }

    public String chuyenTrangBuildDetail() {
        System.out.println(this.getBuildingID());
        ThaoTacSession.duaGTLenSession("buildingID", this.getBuildingID());
        trangNews = "buildingDetail.jsp";
        return null;
    }

    /** get set */
    public NewsTypes getNewsType() {
        return NewsType;
    }

    public void setNewsType(NewsTypes NewsType) {
        this.NewsType = NewsType;
    }

    public News getNews() {
        return news;
    }

    public void setNews(News news) {
        this.news = news;
    }

    public String getTrangNews() {
        return trangNews;
    }

    public void setTrangNews(String trangNews) {
        this.trangNews = trangNews;
    }

    public String getTrangContract() {
        return trangContract;
    }

    public void setTrangContract(String trangContract) {
        this.trangContract = trangContract;
    }

    /**
     * @return the buildingID
     */
    public int getBuildingID() {
        return buildingID;
    }

    public Contracts getContract() {
        return contract;
    }

    public void setContract(Contracts contract) {
        this.contract = contract;
    }

    /**
     * @param buildingID the buildingID to set
     */
    public void setBuildingID(int buildingID) {
        this.buildingID = buildingID;
    }

    /**
     * @return the apartmentType
     */
    public ApartmentTypes getApartmentType() {
        return apartmentType;
    }

    /**
     * @param apartmentType the apartmentType to set
     */
    public void setApartmentType(ApartmentTypes apartmentType) {
        this.apartmentType = apartmentType;
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
     * @return the trangApart
     */
    public String getTrangApart() {
        return trangApart;
    }

    /**
     * @param trangApart the trangApart to set
     */
    public void setTrangApart(String trangApart) {
        this.trangApart = trangApart;
    }

    /**
     * @return the trangpaymentmode
     */
    public String getTrangpaymentmode() {
        return trangpaymentmode;
    }

    /**
     * @param trangpaymentmode the trangpaymentmode to set
     */
    public void setTrangpaymentmode(String trangpaymentmode) {
        this.trangpaymentmode = trangpaymentmode;
    }
}
