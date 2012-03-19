/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package Filters;

import BeanInfo.Floors;
import javax.faces.context.FacesContext;

/**
 *
 * @author NguyenHung
 */


public class FloorFilter{

    private int floorNumber;
    private int buildingIDFilter=0;
    private double price;
    private int numberOfApartment;



    //method for filtering floor by floor number
    public boolean filteringFloorByFloorNumber(Object current){
        Floors floor = (Floors) current;
        if (floorNumber==0)
        {
            return true;
        }
        if (floor.getFloorNumber() == floorNumber){
            return true;
        }else{
            return false;
        }
    }

     //method for filtering floor by building
    public boolean   filteringFloorByBuildingName(Object current){
        Floors floor = (Floors) current;
        if (buildingIDFilter==0)
        {
            return true;
        }
        if (floor.getBuildings().getBuildingID() == buildingIDFilter){
            return true;
        }else{
            return false;
        }
    }

     //method for filtering floor by number of apartments
    public boolean   filteringFloorByNOA(Object current){
        Floors floor = (Floors) current;
        if (numberOfApartment==0)
        {
            return true;
        }
        if (floor.getNumberOfApartment()== numberOfApartment){
            return true;
        }else{
            return false;
        }
    }

     //method for filtering floor by floor price
    public boolean   filteringFloorByPrice(Object current){
        Floors floor = (Floors) current;
        if (price==0)
        {
            return true;
        }
        if (floor.getPrice() == price){
            return true;
        }else{
            return false;
        }

    }

     //method to reset all 
    public void resetFloorTable(){
        FacesContext.getCurrentInstance().getExternalContext().getSessionMap().remove("FloorFilter");
    }



    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
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

    public int getNumberOfApartment() {
        return numberOfApartment;
    }

    public void setNumberOfApartment(int numberOfApartment) {
        this.numberOfApartment = numberOfApartment;
    }

}
