/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package ntb.bean;

import BeanCRUD.BuildingsFacade;
import BeanCRUD.LandsFacade;
import BeanCRUD.LocationsFacade;
import BeanCRUD.PermitsFacade;
import BeanInfo.Buildings;
import BeanInfo.Lands;
import BeanInfo.Locations;
import BeanInfo.Permits;
import Helpers.Messages;
import Helpers.ThaoTacSession;
import java.util.ArrayList;
import java.util.List;
import javax.ejb.EJB;
import javax.faces.application.FacesMessage;
import javax.faces.model.SelectItem;

/**
 * This class contains methods to operate with database on Lands table
 * @author Nhat Nguyen
 */
public class LandBean {

    @EJB
    private PermitsFacade permitsFacade;
    @EJB
    private BuildingsFacade buildingsFacade;
    @EJB
    private LocationsFacade locationsFacade;
    @EJB
    private LandsFacade landsFacade;
    private Lands land = new Lands();
    private Locations location = new Locations();
    private int locationID;
    private int errors = 1;
    private List landList;

    /** Creates a new instance of LandBean */
    public LandBean() {
    }

    /**
     * Get list Location name show in combo box
     * @return list location name
     */
    public ArrayList<SelectItem> getListCityName() {
        ArrayList<SelectItem> temp = new ArrayList<SelectItem>();
        List<Locations> list = this.locationsFacade.findAll();
        for (Locations lo : list) {
            SelectItem si = new SelectItem(lo.getLocationID(), lo.getCityName());
            temp.add(si);
        }
        return temp;
    }

    /**
     * Retrieve a list of lands from Lands table in database
     * @return lands list, Type: java.util.List
     */
    public List<Lands> getListLand() {
        //return this.landList = this.landsFacade.findByLocationID(locationID);
        return this.landsFacade.findByLocationID(locationID);
    }

    /**
     * Retrieve a list of lands by criteria is locationID
     * @return
     */
    public String searchLand() {
        this.landList = this.landsFacade.findByLocationID(locationID);
        return null;
    }

    /**
     * 
     * @return
     */
    public String showAll() {
        this.setLocationID(0);
        this.landList = this.landsFacade.findByLocationID(locationID);
        return null;
    }

    /**
     * Retrieve a list of permits from Permits table in database.
     * We using that to check constraint on delete cascade between 2 tables are : Permits and Lands
     * @return permits list, Type: java.util.List
     */
    public List<Permits> getListPermit() {
        return this.permitsFacade.findAll();
    }

    /**
     * Retrieve a list of buildings from Buildings table in database.
     * We using that to check constraint on delete cascade between 2 tables are : Buildings and Lands
     * @return buildings list, Type: java.util.List
     */
    public List<Buildings> getListBuilding() {
        return this.buildingsFacade.findAll();
    }

    /**
     * Create a new land record in Lands table
     */
    public void createLand() {
        try {
            Locations loTemp = this.locationsFacade.find(this.locationID);
            this.land.setLocations(loTemp);
            if (land.getPresentCost() <= 0 || land.getPurchasedCost() <= 0) {
                Messages.taoTB(FacesMessage.SEVERITY_ERROR, "", "Cost must be >= 0");
            } else {
                this.landsFacade.create(land);
                Messages.taoTB(FacesMessage.SEVERITY_INFO, "", "New land <b>'" + getLand().getLandID() + "'</b> have been created successully!");
                this.setErrors(0);
                this.showAll();
            }
        } catch (Exception ex) {
            Messages.taoTB(FacesMessage.SEVERITY_ERROR, "", "Error: " + ex.getMessage());
        }
    }

    /**
     * Update details for the land is existed in Lands table
     */
    public void updateLand() {
        this.getLand().setLandID(Integer.parseInt(ThaoTacSession.layXuong("landID").toString()));
        try {
            Locations loTemp = this.locationsFacade.find(this.locationID);
            this.land.setLocations(loTemp);
            if (land.getPresentCost() <= 0 || land.getPurchasedCost() <= 0) {
                Messages.taoTB(FacesMessage.SEVERITY_ERROR, "", "Cost must be >= 0");
            } else {
                this.landsFacade.edit(land);
                Messages.taoTB(FacesMessage.SEVERITY_INFO, "", "The land <b>'" + getLand().getLandID()
                        + "'</b> updated successfully, Finish!");
                this.setErrors(0);
                ThaoTacSession.xoaGT("landID");
                this.showAll();
            }
        } catch (Exception ex) {
            Messages.taoTB(FacesMessage.SEVERITY_ERROR, "", "Error: " + ex.getMessage());
        }
    }

    /**
     * Delete the land is existed in Lands table
     */
    public void deleteLand() {
        this.setLand((Lands) ThaoTacSession.layXuong("land"));
        try {
            int laID = this.getLand().getLandID();
            List<Permits> tempPermit = this.getListPermit();
            List<Buildings> tempBuilding = this.getListBuilding();
            for (int i = 0; i < tempPermit.size(); i++) {
                if (laID == tempPermit.get(i).getLands().getLandID()) {
                    this.errors = 1;
                    break;
                } else {
                    for (int j = 0; j < tempBuilding.size(); j++) {
                        if (laID == tempBuilding.get(j).getLands().getLandID()) {
                            this.errors = 1;
                            break;
                        } else {
                            this.errors = 0;
                        }
                    }
                }
            }

            if (errors == 1) {
                Messages.taoTB(FacesMessage.SEVERITY_ERROR, "", "Land <b>'" + getLand().getLandID() + "'</b> is existing in child table. "
                        + "<font color='red'>Can't delete!!!</font>");
            } else {
                this.landsFacade.remove(land);
                Messages.taoTB(FacesMessage.SEVERITY_INFO, "", "You deleted land <b>'" + getLand().getLandID() + "'</b> !");
            }
            ThaoTacSession.xoaGT("land");
            this.showAll();
        } catch (Exception ex) {
            Messages.taoTB(FacesMessage.SEVERITY_ERROR, "", "Error: " + ex.getMessage());
        }
    }

    public void setLandToSession() {
        ThaoTacSession.duaGTLenSession("land", this.land);
    }

    public void setLandIDToSession() {
        ThaoTacSession.duaGTLenSession("landID", this.land.getLandID());
    }

    public void setLocationIDToSession() {
        ThaoTacSession.duaGTLenSession("locationID", this.locationID);
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
     * @return the location
     */
    public Locations getLocation() {
        return location;
    }

    /**
     * @param location the location to set
     */
    public void setLocation(Locations location) {
        this.location = location;
    }

    /**
     * @return the locationID
     */
    public int getLocationID() {
        return locationID;
    }

    /**
     * @param locationID the locationID to set
     */
    public void setLocationID(int locationID) {
        this.locationID = locationID;
    }
}
