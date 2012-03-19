/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package ntb.bean;

import BeanCRUD.CountriesFacade;
import BeanCRUD.LocationsFacade;
import BeanInfo.Countries;
import BeanInfo.Locations;
import Helpers.Messages;
import Helpers.ThaoTacSession;
import java.util.List;
import javax.ejb.EJB;
import javax.faces.application.FacesMessage;

/**
 * This class contains methods to operate with database on Countries table
 * @author Nhat Nguyen
 */
public class CountryBean {

    @EJB
    private LocationsFacade locationsFacade;
    @EJB
    private CountriesFacade countriesFacade;
    private Countries country = new Countries();
    private int errors = 1;

    /** Creates a new instance of CountryBean */
    public CountryBean() {
    }

    /**
     * Retrieve a list of countries from Countries table in database
     * @return countries list, Type: java.util.List
     */
    public List<Countries> getListCountry() {
        return this.countriesFacade.findAll();
    }

    /**
     * Retrieve a list of locations from Locations table in database.
     * We using that to check constraint on delete cascade between 2 tables are : Countries and Locations
     * @return locations list, Type: java.util.List
     */
    public List<Locations> getListLocation() {
        return this.locationsFacade.findAll();
    }

    /**
     * Create a new country record in Countries table
     */
    public void createCountry() {
        try {
            String cn = country.getCountryName();
            List<Countries> temp = getListCountry();
            //Check and notify to Administrator/Moderator that this country is existed or not
            for (int i = 0; i < temp.size(); i++) {
                if (cn.toString().trim().equals(temp.get(i).getCountryName().toString().trim())) {
                    this.errors = 1;
                    break;
                } else {
                    this.errors = 0;
                }
            }
            if (errors == 1) {
                Messages.taoTB(FacesMessage.SEVERITY_ERROR, "", "Country '" + country.getCountryName() + "' existed. Can't insert!!!");
            } else {
                this.countriesFacade.create(country);
                Messages.taoTB(FacesMessage.SEVERITY_INFO, "", "New Country '" + country.getCountryName()
                        + "' have been created successully!");
            }
        } catch (Exception ex) {
            Messages.taoTB(FacesMessage.SEVERITY_ERROR, "", "Error: " + ex.getMessage());
        }
    }

    /**
     * Update details for the country is existed in Countries table
     */
    public void updateCountry() {
        this.getCountry().setCountryID(Integer.parseInt(ThaoTacSession.layXuong("countryID").toString()));
        try {
            String cn = country.getCountryName();
            int cid = country.getCountryID();
            List<Countries> temp = getListCountry();
            //Check and notify to Administrator/Moderator that this country is existed or not
            for (int i = 0; i < temp.size(); i++) {
                if (cn.toString().trim().equals(temp.get(i).getCountryName().toString().trim()) && cid != (temp.get(i).getCountryID())) {
                    this.errors = 1;
                    break;
                } else {
                    this.errors = 0;
                }
            }
            if (errors == 1) {
                Messages.taoTB(FacesMessage.SEVERITY_ERROR, "", "Country '" + country.getCountryName() + "' existed. Try again!!!");
            } else {
                this.countriesFacade.edit(country);
                Messages.taoTB(FacesMessage.SEVERITY_INFO, "", "Country '" + country.getCountryName() + "' updated successfully!");
            }
        } catch (Exception ex) {
            Messages.taoTB(FacesMessage.SEVERITY_ERROR, "", "Error: " + ex.getMessage());
        }
    }

    /**
     * Delete the country is existed in Countries table
     */
    public void deleteCountry() {
        this.country = ((Countries) ThaoTacSession.layXuong("country"));
        try {
            int cID = this.getCountry().getCountryID();
            List<Locations> temp = this.getListLocation();
            //Check and notify to Administrator/Moderator that this country is existed in Locations table or not
            for (int i = 0; i < temp.size(); i++) {
                if (cID == temp.get(i).getCountries().getCountryID()) {
                    this.errors = 1;
                    break;
                } else {
                    this.errors = 0;
                }
            }
            if (errors == 1) {
                Messages.taoTB(FacesMessage.SEVERITY_ERROR, "", "Country '" + getCountry().getCountryName() + "' is existing in child table. "
                        + "<font color='red'>Can't delete!!!</font>");
            } else {
                this.countriesFacade.remove(country);
                Messages.taoTB(FacesMessage.SEVERITY_INFO, "", "You deleted country <b>'" + getCountry().getCountryName() + "'</b>!");
            }
            ThaoTacSession.xoaGT("country");
        } catch (Exception ex) {
            Messages.taoTB(FacesMessage.SEVERITY_ERROR, "", "Error: " + ex.getMessage());
        }
    }

    public void setCountryToSession() {
        ThaoTacSession.duaGTLenSession("country", this.country);
    }

    public void setCountryIDToSession() {
        ThaoTacSession.duaGTLenSession("countryID", this.country.getCountryID());
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
}
