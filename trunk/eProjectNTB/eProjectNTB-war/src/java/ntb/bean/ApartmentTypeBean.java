/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package ntb.bean;

import BeanCRUD.ApartmentTypesFacade;
import BeanCRUD.ApartmentsFacade;
import BeanInfo.ApartmentTypes;
import BeanInfo.Apartments;
import Helpers.Messages;
import Helpers.ThaoTacSession;
import java.util.List;
import javax.ejb.EJB;
import javax.faces.application.FacesMessage;
import javax.faces.context.FacesContext;

/**
 *
 * @author NguyenQuocHung
 */
public class ApartmentTypeBean {

    @EJB
    private ApartmentsFacade apartmentsFacade;
    @EJB
    private ApartmentTypesFacade apartmentTypesFacade;
    private ApartmentTypes apartmentType = new ApartmentTypes();
    private int errors = 1;

    /** Creates a new instance of ApartmentTypeBean */
    public ApartmentTypeBean() {
    }

    //get a list of apartment type
    public List<ApartmentTypes> getListApartmentType() {
        return this.apartmentTypesFacade.findAll();
    }

    //method for inserting
    public void createApartmentType() {

        String existName = this.apartmentTypesFacade.getApartmentTypeByName(apartmentType.getTypeName()).getTypeName();
        //get the apartment type name to check whether it exists or not
        if (existName == null || existName.isEmpty()) {
            //if it doesn't exist , we can insert a new apartment type
            this.apartmentTypesFacade.create(getApartmentType());
            Messages.taoTB(FacesMessage.SEVERITY_INFO, "New apartment type have been created successully", "Finish!");
            FacesContext.getCurrentInstance().getExternalContext().getSessionMap().remove("ApartmentTypeBC");
            this.setErrors(0);
        } else { //can't insert if it exists
            Messages.taoTB(FacesMessage.SEVERITY_INFO, "", "The Apartment type name already exists in the apartment type table ");
        }

    }

    //method for updating an apartment
    public void updateApartmentType() {
        this.getApartmentType().setApartmentTypeID(Integer.parseInt(ThaoTacSession.layXuong("apartmentTypeID").toString()));
        //set apartment type ID
        String existName = this.apartmentTypesFacade.getApartmentTypeByName(apartmentType.getTypeName()).getTypeName();
        //get the apartment type name to check whether it exists or not
        if (existName == null || existName.isEmpty()) {
            this.apartmentTypesFacade.edit(getApartmentType());
            Messages.taoTB(FacesMessage.SEVERITY_INFO, "The apartment type '" + getApartmentType().getTypeName()
                    + "' updated successfully", "Finish!");
            FacesContext.getCurrentInstance().getExternalContext().getSessionMap().remove("ApartmentTypeBC");
            this.setErrors(0);
        } else {
            Messages.taoTB(FacesMessage.SEVERITY_INFO, "", "The Apartment type name already exists in the table ");
        }

    }

    //method for deleting an aparmtent type
    public void deleteApartmentType() {
        int apartmentTypeID = Integer.parseInt(ThaoTacSession.layXuong("apartmentTypeID").toString());
        apartmentType = this.apartmentTypesFacade.find(apartmentTypeID);
        List<Apartments> innerList = this.apartmentsFacade.getApartmentOfType(apartmentType);
        //get all apartments of an apartment type
        if (innerList.isEmpty()) {
        //check if the list is empty , we can delete the apartment type
            this.apartmentTypesFacade.deleteApartmentType(apartmentTypeID);
            Messages.taoTB(FacesMessage.SEVERITY_INFO, "You deleted the apartment type", "Finish!");
            this.setErrors(0);
        } else {
            Messages.taoTB(FacesMessage.SEVERITY_INFO, "", "You can't delete this apartment type because the apartment type exists in the child table");
        }
    }

    public void setApartmentTypeToSession() {
        ThaoTacSession.duaGTLenSession("apartmentType", this.apartmentType);
    }

    public void setApartmentTypeIDToSession() {
        ThaoTacSession.duaGTLenSession("apartmentTypeID", this.apartmentType.getApartmentTypeID());
    }

    /**
     * @return the apartmentTypes
     */
    public ApartmentTypes getApartmentType() {
        return apartmentType;
    }

    /**
     * @param apartmentTypes the apartmentTypes to set
     */
    public void setApartmentType(ApartmentTypes apartmentType) {
        this.apartmentType = apartmentType;
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
