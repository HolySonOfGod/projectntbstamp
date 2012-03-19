/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package ntb.bean;

import BeanCRUD.LandsFacade;
import BeanCRUD.PermitsFacade;
import BeanInfo.Lands;
import BeanInfo.Permits;
import Helpers.CompareDate;
import Helpers.Messages;
import Helpers.ThaoTacSession;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.ejb.EJB;
import javax.faces.application.FacesMessage;
import javax.faces.model.SelectItem;

/**
 * This class contains methods to operate with database on Permits table
 * @author Nhat Nguyen
 */
public class PermitBean {

    @EJB
    private LandsFacade landsFacade;
    @EJB
    private PermitsFacade permitsFacade;
    private Permits permit = new Permits();
    private Lands land = new Lands();
    private int landID;
    private int errors = 1;

    /** Creates a new instance of PermitBean */
    public PermitBean() {
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
     * Retrieve a list of permits from Permits table in database
     * @return permits list, Type: java.util.List
     */
    public List<Permits> getListPermit() {
        return this.permitsFacade.findAll();
    }

    /**
     * Create a new permit record in Permits table
     */
    public void createPermit() {
        try {
            Lands laTemp = this.landsFacade.find(this.landID);
            this.permit.setLands(laTemp);
            //compare date issued with current date to create permit's status
            CompareDate cd = new CompareDate();
            this.permit.setStatus(cd.comparePermit(this.permit.getDateIssued(), new Date()));
            //end compare
            this.permitsFacade.create(permit);
            Messages.taoTB(FacesMessage.SEVERITY_INFO, "", "New permit have been created successully!");
            this.setErrors(0);
        } catch (Exception ex) {
            Messages.taoTB(FacesMessage.SEVERITY_ERROR, "", "Error: " + ex.getMessage());
        }
    }

    /**
     * Update details for the permit of land is existed in Permits table
     */
    public void updatePermit() {
        this.getPermit().setPermitID(Integer.parseInt(ThaoTacSession.layXuong("permitID").toString()));
        try {
            Lands laTemp = this.landsFacade.find(this.landID);
            this.permit.setLands(laTemp);
            //compare date issued with current date to update permit's status
            CompareDate cd = new CompareDate();
            this.permit.setStatus(cd.comparePermit(this.permit.getDateIssued(), new Date()));
            //end compare
            this.permitsFacade.edit(permit);
            Messages.taoTB(FacesMessage.SEVERITY_INFO, "", "The permit updated successfully!");
            this.setErrors(0);
            ThaoTacSession.xoaGT("permitID");
        } catch (Exception ex) {
            Messages.taoTB(FacesMessage.SEVERITY_ERROR, "", "Error: " + ex.getMessage());
        }
    }

    /**
     * Delete the permit of land is existed in Permits table
     */
    public void deletePermit() {
        this.setPermit((Permits) ThaoTacSession.layXuong("permit"));
        try {
            this.permitsFacade.remove(getPermit());
            Messages.taoTB(FacesMessage.SEVERITY_INFO, "", "You deleted permit!");
            ThaoTacSession.xoaGT("permit");
            this.setErrors(0);
        } catch (Exception ex) {
            Messages.taoTB(FacesMessage.SEVERITY_ERROR, "", "Error: " + ex.getMessage());
        }
    }

    public void setPermitToSession() {
        ThaoTacSession.duaGTLenSession("permit", this.permit);
    }

    public void setPermitIDToSession() {
        ThaoTacSession.duaGTLenSession("permitID", this.permit.getPermitID());
    }

    public void setLandIDToSession() {
        ThaoTacSession.duaGTLenSession("landID", this.landID);
    }

    /**
     * @return the permit
     */
    public Permits getPermit() {
        return permit;
    }

    /**
     * @param permit the permit to set
     */
    public void setPermit(Permits permit) {
        this.permit = permit;
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
}
