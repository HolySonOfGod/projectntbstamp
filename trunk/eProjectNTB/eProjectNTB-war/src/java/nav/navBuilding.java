/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package nav;

import BeanInfo.Buildings;
import BeanInfo.Lands;
import Helpers.ThaoTacSession;
import javax.annotation.PostConstruct;

/**
 *
 * @author Administrator
 */
public class navBuilding {

    private String trangBuilding;
    private Buildings building = new Buildings();
    private Lands land = new Lands();
    private int buildingID;

    /** Creates a new instance of navBuilding */
    public navBuilding() {
    }

    @PostConstruct
    public void init() {
        trangBuilding = "newsAll.jsp";
    }

    public String chuyenTrangNews() {
        ThaoTacSession.duaGTLenSession("chuyenBuildingTypeID", this.getLand());
        trangBuilding = "buildingList.jsp";
        return null;
    }

    public String chuyenTrangBuildingDetail() {
        ThaoTacSession.duaGTLenSession("buildingID", this.buildingID);
        return "buildingDetail.jsp";
    }

    /**
     * @return the trangNews
     */
    public String getTrangNews() {
        return trangBuilding;
    }

    /**
     * @param trangNews the trangNews to set
     */
    public void setTrangNews(String trangNews) {
        this.trangBuilding = trangNews;
    }

    /**
     * @return the building
     */
    public Buildings getBuilding() {
        return building;
    }

    /**
     * @param building the building to set
     */
    public void setBuilding(Buildings building) {
        this.building = building;
    }

    /**
     * @return the land
     */
    public Lands getLand() {
        return land;
    }

    /**
     * @param land the land to set
     */
    public void setLand(Lands land) {
        this.land = land;
    }

    /**
     * @return the buildingID
     */
    public int getBuildingID() {
        return buildingID;
    }

    /**
     * @param buildingID the buildingID to set
     */
    public void setBuildingID(int buildingID) {
        this.buildingID = buildingID;
    }
}
