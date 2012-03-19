/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package ntb.bean;

import BeanCRUD.BuildingsFacade;
import BeanCRUD.FloorsFacade;
import BeanCRUD.LandsFacade;
import BeanInfo.Buildings;
import BeanInfo.Floors;
import BeanInfo.Lands;
import Helpers.Messages;
import Helpers.ThaoTacSession;
import java.util.ArrayList;
import java.util.List;
import javax.ejb.EJB;
import javax.faces.application.FacesMessage;
import javax.faces.model.SelectItem;

/**
 * This class contains methods to operate with database on Buildings table
 * @author Nhat Nguyen
 */
public class BuildingBean {

    @EJB
    private FloorsFacade floorsFacade;
    @EJB
    private LandsFacade landsFacade;
    @EJB
    private BuildingsFacade buildingsFacade;
    private Buildings building = new Buildings();
    private Lands land = new Lands();
    private int landID;
    private int errors = 1;
    private String buildingName;
    private List buildingList;

    /** Creates a new instance of BuildingBean */
    public BuildingBean() {
    }

    /**
     * Retrieve a list of buildings from Buildings table in database
     * @return buildings list, Type: java.util.List
     */
    public List<Buildings> getListBuilding() {
        return this.buildingList = this.buildingsFacade.findByBuildingName(buildingName);
    }

    /**
     * Get list account by criteria is account's first name and show on table
     * @return
     */
    public String searchBuilding() {
        this.buildingList = this.buildingsFacade.findByBuildingName(buildingName);
        return null;
    }

    public String showAll() {
        this.setBuildingName(null);
        this.buildingList = this.buildingsFacade.findByBuildingName(buildingName);
        return null;
    }

    /**
     * Retrieve a list of floors from Floors table in database.
     * We using that to check constraint on delete cascade between 2 tables are : Buildings and Floors
     * @return floors list, Type: java.util.List
     */
    public List<Floors> getListFloor() {
        return this.floorsFacade.findAll();
    }

    /**
     * Get list land's ID show in combo box
     * This helps Administrator operate easily
     * @return land's ID list, Type: java.util.ArrayList
     */
    public ArrayList<SelectItem> getListLandID() {
        ArrayList<SelectItem> temp = new ArrayList<SelectItem>();
        List<Lands> list = this.landsFacade.findAll();
        for (Lands la : list) {
            SelectItem si = new SelectItem(la.getLandID(), la.getLandID().toString());
            temp.add(si);
        }
        return temp;
    }

    /**
     * Create a new building record in Buildings table
     */
    public void createBuilding() {
        try {
            Lands laTemp = this.landsFacade.find(this.landID);
            this.building.setLands(laTemp);
            this.buildingsFacade.create(building);
            Messages.taoTB(FacesMessage.SEVERITY_INFO, "", "New building '" + getBuilding().getBuildingName()
                    + "' have been created successully!");
            this.setErrors(0);
        } catch (Exception ex) {
            Messages.taoTB(FacesMessage.SEVERITY_ERROR, "", "Error: " + ex.getMessage());
        }
    }

    /**
     * Update details for the building is existed in Buildings table
     */
    public void updateBuilding() {
        this.getBuilding().setBuildingID(Integer.parseInt(ThaoTacSession.layXuong("buildingID").toString()));
        try {
            Lands laTemp = this.landsFacade.find(this.landID);
            this.building.setLands(laTemp);
            this.buildingsFacade.edit(building);
            Messages.taoTB(FacesMessage.SEVERITY_INFO, "", "The building '" + getBuilding().getBuildingName() + "' updated successfully!");
            this.setErrors(0);
            ThaoTacSession.xoaGT("countryID");
        } catch (Exception ex) {
            Messages.taoTB(FacesMessage.SEVERITY_ERROR, "", "Error: " + ex.getMessage());
        }
    }

    /**
     * Delete the building is existed in Buildings table
     */
    public void deleteBuilding() {
        this.setBuilding((Buildings) ThaoTacSession.layXuong("building"));
        try {
            int bID = this.getBuilding().getBuildingID();
            List<Floors> temp = this.getListFloor();
            //Check and notify to Administrator/Moderator that this building is existed in Floors table or not
            for (int i = 0; i < temp.size(); i++) {
                if (bID == temp.get(i).getBuildings().getBuildingID()) {
                    this.errors = 1;
                    break;
                } else {
                    this.errors = 0;
                }
            }
            if (errors == 1) {
                Messages.taoTB(FacesMessage.SEVERITY_ERROR, "", "Building '" + getBuilding().getBuildingName() + "' is existing in child table. "
                        + "<font color='red'>Can't delete!!!</font>");
            } else {
                this.buildingsFacade.remove(building);
                Messages.taoTB(FacesMessage.SEVERITY_INFO, "", "You deleted building '" + getBuilding().getBuildingName() + "' !");
            }
            ThaoTacSession.xoaGT("building");
        } catch (Exception ex) {
            Messages.taoTB(FacesMessage.SEVERITY_ERROR, "", "Error: " + ex.getMessage());
        }
    }

    public void setBuildingToSession() {
        ThaoTacSession.duaGTLenSession("building", this.building);
    }

    public void setBuildingIDToSession() {
        ThaoTacSession.duaGTLenSession("buildingID", this.building.getBuildingID());
    }

    public void setLandIDToSession() {
        ThaoTacSession.duaGTLenSession("landID", this.landID);
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
     * @return the landID
     */
    public int getLandID() {
        return landID;
    }

    /**
     * @param landID the landID to set
     */
    public void setLandID(int landID) {
        this.landID = landID;
    }

    /**
     * @return the buildingName
     */
    public String getBuildingName() {
        return buildingName;
    }

    /**
     * @param buildingName the buildingName to set
     */
    public void setBuildingName(String buildingName) {
        this.buildingName = buildingName;
    }
}
