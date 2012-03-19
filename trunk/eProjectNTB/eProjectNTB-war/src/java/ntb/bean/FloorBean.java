/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package ntb.bean;

import BeanCRUD.ApartmentsFacade;
import BeanCRUD.BuildingsFacade;
import BeanCRUD.FloorsFacade;
import BeanInfo.Apartments;
import BeanInfo.Buildings;
import BeanInfo.Floors;
import Helpers.Messages;
import Helpers.ThaoTacSession;
import java.util.ArrayList;
import java.util.List;
import javax.ejb.EJB;
import javax.faces.application.FacesMessage;
import javax.faces.context.FacesContext;
import javax.faces.model.SelectItem;

/**
 *
 * @author NguyenQuocHung
 */
public class FloorBean {

    @EJB
    private BuildingsFacade buildingsFacade;
    @EJB
    private ApartmentsFacade apartmentsFacade;
    @EJB
    private FloorsFacade floorsFacade;
    private Floors floor = new Floors();
    private Buildings building = new Buildings();
    private int buildingID;
    private int errors = 1;




    /** Creates a new instance of FloorBean */
    public FloorBean() {
    }


     //get a list of floor to show in combo box
    public List<Floors> getListFloor() {
        List<Floors> floorList = new ArrayList<Floors>();
        floorList=this.floorsFacade.findAll();
        return floorList;
    }

   /**Get a list of building to show in combo box*/
    public List<SelectItem> getListBuildingName() {
        List<SelectItem> itemList = new ArrayList<SelectItem>();
        List<Buildings> list = this.buildingsFacade.findAll();
        for (Buildings b : list) {
            SelectItem item = new SelectItem(b.getBuildingID(), b.getBuildingName());
            itemList.add(item);
        }
        return itemList;
    }


    //method of inserting a floor
    public void createFloor() {
        Buildings b = this.buildingsFacade.find(this.buildingID);
        List<Floors> floorList = this.floorsFacade.getFloorOfBuilding(b);
        //get a list of floor of the building
        boolean existFloorNumber = false; // set flag exist is false
        int numberOfFloors = floorList.size();
        int maxFloor = b.getNumberOfFloor();
        for (int i=0;i<floorList.size();i++)
        {
             // check if the floor number exists in the floor of the building
            if (floor.getFloorNumber()==floorList.get(i).getFloorNumber())
                existFloorNumber=true;
            // set exist = true if it exists
        }
        if(existFloorNumber==false && numberOfFloors < maxFloor){ //it doesn't exist so we can insert a new floor
        this.floor.setBuildings(b);
        this.floorsFacade.create(floor);
        Messages.taoTB(FacesMessage.SEVERITY_INFO, "New floor have been created successully", "Finish!");
        FacesContext.getCurrentInstance().getExternalContext().getSessionMap().remove("FloorBC");
        this.setErrors(0);
        }
        else 
        {
            if (numberOfFloors == maxFloor)
            Messages.taoTB(FacesMessage.SEVERITY_INFO, "", "Maximum number of floors in the building");
            else Messages.taoTB(FacesMessage.SEVERITY_INFO, "", "This floor number already exists");
        }
    }

    //method for updating
    public void updateFloor() {
        this.getFloor().setFloorID(Integer.parseInt(ThaoTacSession.layXuong("floorID").toString()));
        //get a floorID from a sesssion and then set it
        building = this.buildingsFacade.find(this.buildingID);
        List<Floors> floorList = this.floorsFacade.getFloorOfBuilding(building);
        //get a list of floor of the building
        boolean existFloorNumber = false;
        // set flag exist is false

         for (int i=0;i<floorList.size();i++)
        {
             // check if the floor number exists in the floor of the building
            if (floor.getFloorNumber()==floorList.get(i).getFloorNumber())
                existFloorNumber=true;
            // set exist = true if it exists
        }
        this.floor.setBuildings(building);
        if(existFloorNumber==false){
            this.floorsFacade.edit(floor);
            //set others
            Messages.taoTB(FacesMessage.SEVERITY_INFO, "The floor updated successfully", "Finish!");
            FacesContext.getCurrentInstance().getExternalContext().getSessionMap().remove("FloorBC");
            this.setErrors(0);
            ThaoTacSession.xoaGT("BuildingID");
            //detroy the session
        }else Messages.taoTB(FacesMessage.SEVERITY_INFO, "", "This floor number already exists");
    }

    //method for deleting
    public void deleteFloor() {
        int floorID =Integer.parseInt(ThaoTacSession.layXuong("floorID").toString());
        // get a floorID from a session
        floor = this.floorsFacade.find(floorID);
        // get the floor base on the floorID
        List<Apartments> innerList = this.apartmentsFacade.getApartmentOfFloor(floor);
        //get apartment list of the floor
        if (innerList.isEmpty()){
        //check whether the apartment list exists or not
        //delete the floor if it doesn't exist
            this.floorsFacade.deleteFloor(floorID);
            Messages.taoTB(FacesMessage.SEVERITY_INFO, "You deleted the floor", "Finish!");
            this.setErrors(0);
        }
        else{
            Messages.taoTB(FacesMessage.SEVERITY_INFO, "","You can't delete this floor because floorID exists in the apartment table");
        }


    }

    public void updateProcess(){
        setFloorIDToSession();
        this.buildingID = this.floor.getBuildings().getBuildingID();
    }

    public void setFloorToSession() {
        ThaoTacSession.duaGTLenSession("floor", this.floor);
    }

    public void setFloorIDToSession() {
        ThaoTacSession.duaGTLenSession("floorID", this.floor.getFloorID());
    }

    /**
     * @return the floor
     */
    public Floors getFloor() {
        return floor;
    }

    /**
     * @param floor the floor to set
     */
    public void setFloor(Floors floor) {
        this.floor = floor;
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



     public Buildings getBuilding() {
        return building;
    }

    public void setBuilding(Buildings building) {
        this.building = building;
    }
    public int getBuildingID() {
        return buildingID;
    }

    public void setBuildingID(int buildingID) {
        this.buildingID = buildingID;
    }

}
