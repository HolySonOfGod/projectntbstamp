/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package Filters;

import BeanInfo.Apartments;
import javax.faces.context.FacesContext;

/**
 *
 * @author NguyenQuocHung
 */


public class ApartmentFilter{

    private int apartmentTypeIDFilter=0;
    private int floorNumber;
    private int buildingIDFilter=0;
    private double areaFilter;

    //method for filtering apartment by type
    public boolean filteringApartmentByType(Object current){
        Apartments apartment = (Apartments) current;
        if (apartmentTypeIDFilter==0)
        {
            return true;
        }
        if (apartment.getApartmentTypes().getApartmentTypeID() == apartmentTypeIDFilter){
            return true;
        }else{
            return false;
        }
    }

    //method for filtering apartment by floor number
    public boolean filteringApartmentByFloorNumber(Object current){
        Apartments apartment = (Apartments) current;
        if (floorNumber==0)
        {
            return true;
        }
        if (apartment.getFloors().getFloorNumber() == floorNumber){
            return true;
        }else{
            return false;
        }
    }

    //method for filtering apartment by building
    public boolean   filteringApartmentByBuildingName(Object current){
        Apartments apartment = (Apartments) current;
        if (buildingIDFilter==0)
        {
            return true;
        }
        if (apartment.getFloors().getBuildings().getBuildingID() == buildingIDFilter){
            return true;
        }else{
            return false;
        }
    }

    //method for filtering apartment by area
    public boolean   filteringApartmentByArea(Object current){
        Apartments apartment = (Apartments) current;
        if (areaFilter==0)
        {
            return true;
        }
        if (apartment.getArea() == areaFilter){
            return true;
        }else{
            return false;
        }

    }

    ////method for reset all 
    public void resetApartmentTable(){
        FacesContext.getCurrentInstance().getExternalContext().getSessionMap().remove("ApartmentFilter");
    }


    public double getAreaFilter() {
        return areaFilter;
    }

    public void setAreaFilter(double areaFilter) {
        this.areaFilter = areaFilter;
    }

      public int getApartmentTypeIDFilter() {
        return apartmentTypeIDFilter;
    }

    public void setApartmentTypeIDFilter(int apartmentTypeIDFilter) {
        this.apartmentTypeIDFilter = apartmentTypeIDFilter;
    }

    public int getBuildingIDFilter() {
        return buildingIDFilter;
    }

    public void setBuildingIDFilter(int buildingIDFilter) {
        this.buildingIDFilter = buildingIDFilter;
    }

    public int getFloorNumber() {
        return floorNumber;
    }

    public void setFloorNumber(int floorNumber) {
        this.floorNumber = floorNumber;
    }

}
