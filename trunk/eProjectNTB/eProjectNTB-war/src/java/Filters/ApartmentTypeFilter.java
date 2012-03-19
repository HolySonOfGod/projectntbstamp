/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Filters;

import BeanInfo.ApartmentTypes;
import javax.faces.context.FacesContext;

/**
 *
 * @author NguyenHung
 */
public class ApartmentTypeFilter {

    /** Creates a new instance of ApartmentTypeFilter */
    private String typeName = "";
    private String description = "";

    public ApartmentTypeFilter() {
    }

    public boolean filterType(Object current) {
        ApartmentTypes apartmentTypes = (ApartmentTypes) current;
        if (typeName.length() == 0) {
            return true;
        }
        if (apartmentTypes.getTypeName().toLowerCase().startsWith(typeName.toLowerCase())) {
            return true;
        } else {
            return false;
        }
    }

    public boolean filterDescription(Object current) {
        ApartmentTypes apartmentTypes = (ApartmentTypes) current;
        if (description.length() == 0) {
            return true;
        }
        if (apartmentTypes.getDescription().toLowerCase().startsWith(description.toLowerCase())) {
            return true;
        } else {
            return false;
        }
    }

    public void resetApartmentType(){
        FacesContext.getCurrentInstance().getExternalContext().getSessionMap().remove("apartmentTypeFilter");
    }

    /**
     * @return the typeName
     */
    public String getTypeName() {
        return typeName;
    }

    /**
     * @param typeName the typeName to set
     */
    public void setTypeName(String typeName) {
        this.typeName = typeName;
    }

    /**
     * @return the description
     */
    public String getDescription() {
        return description;
    }

    /**
     * @param description the description to set
     */
    public void setDescription(String description) {
        this.description = description;
    }
}
