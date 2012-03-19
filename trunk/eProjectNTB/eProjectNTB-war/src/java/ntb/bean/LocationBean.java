/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package ntb.bean;

import BeanCRUD.CountriesFacade;
import BeanCRUD.LandsFacade;
import BeanCRUD.LocationsFacade;
import BeanInfo.Countries;
import BeanInfo.Lands;
import BeanInfo.Locations;
import Helpers.Messages;
import Helpers.ThaoTacSession;
import java.util.ArrayList;
import java.util.List;
import javax.ejb.EJB;
import javax.faces.application.FacesMessage;
import javax.faces.model.SelectItem;

/**
 * This class contains methods to operate with database on Locations table
 * @author Nhat Nguyen
 */
public class LocationBean {

    @EJB
    private LandsFacade landsFacade;
    @EJB
    private CountriesFacade countriesFacade;
    @EJB
    private LocationsFacade locationsFacade;
    private Locations location = new Locations();
    private Countries country = new Countries();
    private int countryID;
    private int errors = 1;

    /** Creates a new instance of LocationBean */
    public LocationBean() {
    }

    /**
     * Get list country's name show in combo box
     * This helps Administrator operate easily
     * @return country's name list, Type: java.util.ArrayList
     */
    public ArrayList<SelectItem> getListCountryName() {
        ArrayList<SelectItem> temp = new ArrayList<SelectItem>();
        List<Countries> list = this.countriesFacade.findAll();
        for (Countries c : list) {
            SelectItem si = new SelectItem(c.getCountryID(), c.getCountryName());
            temp.add(si);
        }
        return temp;
    }

    /**
     * Retrieve a list of locations from Locations table in database
     * @return locations list, Type: java.util.List
     */
    public List<Locations> getListLocation() {
        return this.locationsFacade.findAll();
    }

    /**
     * Retrieve a list of lands from Lands table in database.
     * We using that to check constraint on delete cascade between 2 tables are : Locations and Lands
     * @return lands list, Type: java.util.List
     */
    public List<Lands> getListLand() {
        return this.landsFacade.findAll();
    }

    /**
     * Create a new location record in Locations table
     */
    public void createLocation() {
        try {
            Countries cTemp = this.countriesFacade.find(this.countryID);
            this.location.setCountries(cTemp);
            String ln = location.getCityName();
            List<Locations> temp = getListLocation();
            //Check and notify to Administrator/Moderator that this location is existed or not
            for (int i = 0; i < temp.size(); i++) {
                if (ln.toString().trim().equals(temp.get(i).getCityName().toString().trim())) {
                    this.errors = 1;
                    break;
                } else {
                    this.errors = 0;
                }
            }
            if (errors == 1) {
                Messages.taoTB(FacesMessage.SEVERITY_ERROR, "", "Location '" + getLocation().getCityName() + "' existed. Can't insert!!!");
            } else {
                if (location.getConstructPermitCost() <= 0 || location.getOccupancyPermitCost() <= 0) {
                    Messages.taoTB(FacesMessage.SEVERITY_ERROR, "", "Cost must be >= 0 ");
                } else {
                    this.locationsFacade.create(location);
                    Messages.taoTB(FacesMessage.SEVERITY_INFO, "", "New location '" + getLocation().getCityName() + "' have been created successully");
                }
            }
        } catch (Exception ex) {
            Messages.taoTB(FacesMessage.SEVERITY_ERROR, "", "Error: " + ex.getMessage());
        }
    }

    /**
     * Update details for the location is existed in Locations table
     */
    public void updateLocation() {
        this.getLocation().setLocationID(Integer.parseInt(ThaoTacSession.layXuong("locationID").toString()));
        try {
            String ln = location.getCityName();
            int lid = location.getLocationID();
            List<Locations> temp = getListLocation();
            //Check and notify to Administrator/Moderator that this location is existed or not
            for (int i = 0; i < temp.size(); i++) {
                if (ln.toString().trim().equals(temp.get(i).getCityName().toString().trim()) && lid != (temp.get(i).getLocationID())) {
                    this.errors = 1;
                    break;
                } else {
                    this.errors = 0;
                }
            }
            if (errors == 1) {
                Messages.taoTB(FacesMessage.SEVERITY_ERROR, "", "Location '" + location.getCityName() + "' existed. Try again!!!");
            } else {
                Countries cTemp = this.countriesFacade.find(this.countryID);
                this.location.setCountries(cTemp);
                if (location.getConstructPermitCost() <= 0 || location.getOccupancyPermitCost() <= 0) {
                    Messages.taoTB(FacesMessage.SEVERITY_ERROR, "", "Cost must be >= 0 ");
                } else {
                    this.locationsFacade.edit(location);
                    Messages.taoTB(FacesMessage.SEVERITY_INFO, "", "Location '" + location.getCityName() + "' updated successfully!");
                }
            }
        } catch (Exception ex) {
            Messages.taoTB(FacesMessage.SEVERITY_ERROR, "", "Error: " + ex.getMessage());
        }
    }

    /**
     * Delete the location is existed in Locations table
     */
    public void deleteLocation() {
        this.setLocation((Locations) ThaoTacSession.layXuong("location"));
        try {
            int lID = this.getLocation().getLocationID();
            List<Lands> temp = this.getListLand();
            //Check and notify to Administrator/Moderator that this location is existed in Lands table or not
            for (int i = 0; i < temp.size(); i++) {
                if (lID == temp.get(i).getLocations().getLocationID()) {
                    this.errors = 1;
                    break;
                } else {
                    this.errors = 0;
                }
            }
            if (errors == 1) {
                Messages.taoTB(FacesMessage.SEVERITY_ERROR, "", "Location '" + getLocation().getCityName() + "' is existing in child table. "
                        + "<font color='red'>Can't delete!!!</font>");
            } else {
                this.locationsFacade.remove(location);
                Messages.taoTB(FacesMessage.SEVERITY_INFO, "", "You deleted location <b>'" + getLocation().getCityName() + "'</b>!");
            }
            ThaoTacSession.xoaGT("location");
        } catch (Exception ex) {
            Messages.taoTB(FacesMessage.SEVERITY_ERROR, "", "Error: " + ex.getMessage());
        }
    }

    public void setLocationToSession() {
        ThaoTacSession.duaGTLenSession("location", this.location);
    }

    public void setLocationIDToSession() {
        ThaoTacSession.duaGTLenSession("locationID", this.location.getLocationID());
    }

    public void setCountryIDToSession() {
        ThaoTacSession.duaGTLenSession("countryID", this.countryID);
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
     * @return the country
     */
    public Countries getCountry() {
        return country;
    }

    /**
     * @param country the country to set
     */
    public void setCountry(Countries country) {
        this.country = country;
    }

    /**
     * @return the countryID
     */
    public int getCountryID() {
        return countryID;
    }

    /**
     * @param countryID the countryID to set
     */
    public void setCountryID(int countryID) {
        this.countryID = countryID;
    }
}
