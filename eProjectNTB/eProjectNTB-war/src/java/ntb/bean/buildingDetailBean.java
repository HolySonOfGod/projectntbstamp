/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package ntb.bean;

import BeanCRUD.BuildingsFacade;
import BeanInfo.Buildings;
import Helpers.ThaoTacSession;
import java.util.List;
import javax.ejb.EJB;

/**
 *
 * @author Administrator
 */
public class buildingDetailBean {

    /** Creates a new instance of buildingDetailBean */
    private Integer builID;
    private Buildings building = new Buildings();
    @EJB
    private BuildingsFacade buildingsFacade;

    public buildingDetailBean() {
        builID = (Integer) ThaoTacSession.layXuong("buildingID");
    }

    public List<Buildings> getListDetail() {
        System.out.println(builID);
        return this.buildingsFacade.findByBuldID(builID);
    }

    /**
     * @return the builID
     */
    public Integer getBuilID() {
        return builID;
    }

    /**
     * @param builID the builID to set
     */
    public void setBuilID(Integer builID) {
        this.builID = builID;
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
}
