/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package ntb.bean;

import BeanCRUD.ApartmentTypesFacade;
import BeanCRUD.ApartmentsFacade;
import BeanCRUD.BuildingsFacade;
import BeanCRUD.FloorsFacade;
import BeanCRUD.ImageListsFacade;
import BeanInfo.ApartmentTypes;
import BeanInfo.Apartments;
import BeanInfo.Buildings;
import BeanInfo.Floors;
import BeanInfo.ImageLists;
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
public class ApartmentBean {

    @EJB
    private BuildingsFacade buildingsFacade;
    @EJB
    private ApartmentTypesFacade apartmentTypesFacade;
    @EJB
    private FloorsFacade floorsFacade;
    @EJB
    private ApartmentsFacade apartmentsFacade;
    @EJB
    private ImageListsFacade imageListFacade;
    private Apartments apartment = new Apartments();
    private Floors floor = new Floors();
    private ApartmentTypes apartmentType = new ApartmentTypes();
    private Buildings building = new Buildings();
    private ImageLists imagelist = new ImageLists();
    private int errors = 1;

    /*properties of searching*/
    private boolean flag = false;
    private String keyWords;
    private String searchType = "none";

    /** Creates a new instance of ApartmentBean */
    public ApartmentBean() {
        if (ThaoTacSession.layXuong("chuyentrangApartmentTypeID") != null) {
            this.apartmentType = (ApartmentTypes) ThaoTacSession.layXuong("chuyentrangApartmentTypeID");
        }
    }

    /**
     * Get all apartment and get apartment by searching with different types
     * @return
     */
    public List<Apartments> getListApartment() {
        if (flag == false) //flag = false - get all record
            return this.apartmentsFacade.findAll();
          else { // flag = true - get apartment by searching
            List<Apartments> apartmentList = new ArrayList<Apartments>();
            if (keyWords.length() != 0 || keyWords != null) {
                if (searchType.equals("area")) { //search with area
                    try {
                        apartmentList = this.searchArea(keyWords);//return result
                    } catch (Exception e) {
                    }
                }
                if (searchType.equals("AP")) { // search with Apartment price
                    try {
                        apartmentList = this.searchPrice(keyWords);
                    } catch (Exception e) {
                        System.out.println(e.getMessage());
                    }
                }
                if (searchType.equals("location")) { // search with location (city,country)
                    try {
                        apartmentList = this.searchLocation(keyWords);
                    } catch (Exception e) {
                        System.out.println(e.getMessage());
                    }
                }
            }
            return apartmentList;
        }
    }

    /**
     * Get searching type and set flag to get apartment records by searching
     */
    public void loadApartment() {
        if (searchType.equals("none")) // set flag for searching
        {
            flag = false; // flag = false - get all records
        } else {
            flag = true; // flag = true - get by searching
        }
    }

    //set flag to get all apartment records
    public void loadAllApartment() {
        flag = false;
    }

    /**
     * Method of searching area
     * @param searchStr
     * @return
     */
    public List<Apartments> searchArea(String searchStr) {

        List<Apartments> apartmentList = new ArrayList<Apartments>();
        //result list
        int length = searchStr.length();
        char lastChar = searchStr.charAt(length - 1);
        //check the last character of keyword

        if (lastChar == '+') //EX:keywords:"30+" , it will return apartments that have area > 30
        {
            double area = Double.valueOf(searchStr.substring(0, length - 1));
            //convert a string to a double number
            apartmentList = this.apartmentsFacade.findByGreaterArea(area);
        } else if (lastChar == '-') //EX:keywords:"30-" , it will return apartments that have area < 30
        {
            double area = Double.valueOf(searchStr.substring(0, length - 1));
            apartmentList = this.apartmentsFacade.findBySmallerArea(area);
        } else {
            try {//Ex:keywords:"30",it will return apartments that have area = 30
                double area = Double.valueOf(searchStr);
                apartmentList = this.apartmentsFacade.findByArea(area);
            } catch (Exception e) {
                System.out.println(e.getMessage());
            }

            try {//Ex:keywords:"30 to 50",it will return apartments that have area in range from 30 to 50
                int position = searchStr.indexOf("to");
                //specify the word "to" to split the string
                double fromArea = Double.valueOf(searchStr.substring(0, position));
                //get the first value
                double toArea = Double.valueOf(searchStr.substring(position + 2, searchStr.length()));
                //get the second value
                apartmentList = this.apartmentsFacade.findByRangeArea(fromArea, toArea);
            } catch (Exception e) {
                System.out.println(e.getMessage());
            }
        }
        return apartmentList; //return result list
    }

    /**
     * Method of searching price
     * @param searchStr
     * @return
     */
    public List<Apartments> searchPrice(String searchStr) {
        List<Apartments> searchedApartments = new ArrayList<Apartments>();
        //result list
        List<Apartments> apartmentList = this.apartmentsFacade.findAll();
        //all apartments - apartment list
        int length = searchStr.length();
        char lastChar = searchStr.charAt(length - 1);
        if (lastChar == '+') {
            //EX:keywords:"30+" , it will return apartments that have price > 30
            double apartmentPrice = Double.valueOf(searchStr.substring(0, length - 1));
            for (Apartments a : apartmentList) {//get each apartment to compare

                //compare apartment price to get what we need and then add the aparmtent to the result list
                if (a.getArea() * a.getFloors().getPrice() > apartmentPrice) {
                    searchedApartments.add(a);
                }
            }
        } else if (lastChar == '-') {
            //EX:keywords:"30+" , it will return apartments that have price < 30
            double apartmentPrice = Double.valueOf(searchStr.substring(0, length - 1));
            for (Apartments a : apartmentList) {//get each apartment to compare

                //compare apartment price to get what we need and then add the aparmtent to the result list
                if (a.getArea() * a.getFloors().getPrice() < apartmentPrice) {
                    searchedApartments.add(a);
                }
            }
        } else {
            try { //EX:keywords:"30" , it will return apartments that have price = 30
                double apartmentPrice = Double.valueOf(searchStr);
                for (Apartments a : apartmentList) {
                    if (a.getArea() * a.getFloors().getPrice() == apartmentPrice) {
                        searchedApartments.add(a);
                    }
                }
            } catch (Exception e) {
            }
            try { //EX:keywords:"30 to 50" , it will return apartments that have price in range from 30 to 50
                int position = searchStr.indexOf("to");
                double fromPrice = Double.valueOf(searchStr.substring(0, position));
                double toPrice = Double.valueOf(searchStr.substring(position + 2, searchStr.length()));
                for (Apartments a : apartmentList) {
                    if (a.getArea() * a.getFloors().getPrice() >= fromPrice && a.getArea() * a.getFloors().getPrice() <= toPrice) {
                        searchedApartments.add(a);
                    }
                }
            } catch (Exception e) {
            }
        }
        return searchedApartments;// return result list
    }

    /**
     * Method of searching location
     * @param searchStr
     * @return
     */
    public List<Apartments> searchLocation(String searchStr) {
        List<Apartments> searchedApartments = new ArrayList<Apartments>();
        //result list
        List<Apartments> apartmentList = this.apartmentsFacade.findAll();
        //all aparment list
        for (Apartments a : apartmentList) {//get each apartment to compare
            String cityName = a.getFloors().getBuildings().getLands().getLocations().getCityName();
            //get city name of the apartment
            String countryName = a.getFloors().getBuildings().getLands().getLocations().getCountries().getCountryName();
            //get country name of the apartment
            if (cityName.contains(searchStr) || countryName.contains(searchStr)) {
                // check whether the keywords exists in the city-country column or not
                //if it exists , add the apartment to the result list
                searchedApartments.add(a);
            }
        }
        return searchedApartments;//return result list
    }


    /**
     * Get a list of building show in combo box
     * @return
     */
    public List<SelectItem> getListBuildingName() {
        List<SelectItem> buildingItemList = new ArrayList<SelectItem>();
        List<Buildings> list = this.buildingsFacade.findAll();
        for (Buildings b : list) {
            SelectItem item = new SelectItem(b.getBuildingID(), b.getBuildingName());
            buildingItemList.add(item);
        }
        return buildingItemList;
    }

    /**
     * Get a list of floor show in combo box
     * @return
     */
    public List<SelectItem> getListFloorNumber() {
        List<SelectItem> floorItemList = new ArrayList<SelectItem>();
        List<Floors> list = this.floorsFacade.getFloorOfBuilding(building);
        for (Floors f : list) {
            SelectItem item = new SelectItem(f.getFloorID(), String.valueOf(f.getFloorNumber()));
            floorItemList.add(item);
        }
        return floorItemList;
    }

    /**
     * Get a list of apartment type show in combo box
     * @return
     */
    public List<SelectItem> getListApartmentTypeName() {
        List<SelectItem> apartmentItemList = new ArrayList<SelectItem>();
        List<ApartmentTypes> list = this.apartmentTypesFacade.findAll();
        for (ApartmentTypes at : list) {
            SelectItem item = new SelectItem(at.getApartmentTypeID(), at.getTypeName());
            apartmentItemList.add(item);
        }

        return apartmentItemList;
    }

    /**
     * Get a list of apartment of apartment
     * @return
     */
    public List<Apartments> getListApartmentsByType() {
        List<SelectItem> temp = new ArrayList<SelectItem>();
        List<Apartments> list = this.apartmentsFacade.getlistApartID(true);
        for (Apartments a : list) {
            SelectItem si = new SelectItem(a.getApartmentID(), a.getApartmentID().toString());
            temp.add(si);
        }
        if (ThaoTacSession.layXuong("chuyentrangApartmentTypeID") != null) {
            this.apartmentType = (ApartmentTypes) ThaoTacSession.layXuong("chuyentrangApartmentTypeID");
        }
        return this.apartmentsFacade.findByApartmentTypeID(apartmentType);
    }

    /**
     * Re-render selectOneMenu of floor
     */
    public void buildingIDChanged() {
        FacesContext.getCurrentInstance().renderResponse();
    }

    /**
     * Method to remove value of session bean
     */
    public void removeSession() {
        FacesContext.getCurrentInstance().getExternalContext().getSessionMap().remove("ApartmentBC");
    }

    /**
     * Method to insert an apartment
     */
    public void createApartment() {
        List<Apartments> listApartmentOfFloor = this.apartmentsFacade.getApartmentOfFloor(floor);
        // get all apartments of the floor
        int NOA = this.floorsFacade.find(floor.getFloorID()).getNumberOfApartment();
        // get number of apartments of the floor
        if (listApartmentOfFloor.size() < NOA) // check whether the floor is full of apartment or not
        // if it is not - we can insert a new apartment
        {
            apartment.setApartmentTypes(apartmentType);
            apartment.setFloors(floor);
            apartment.setStatus(Boolean.TRUE);
            this.apartmentsFacade.create(apartment);
            Messages.taoTB(FacesMessage.SEVERITY_INFO, "A new apartment have been created successully", "Finish!");
            this.setErrors(0);
            FacesContext.getCurrentInstance().getExternalContext().getSessionMap().remove("ApartmentBC");
        } else {
            //we can't insert a new apartment if number of apartments reach the maximum
            Messages.taoTB(FacesMessage.SEVERITY_INFO, "", "Maximun number of apartments of the floor");
            FacesContext.getCurrentInstance().getExternalContext().getSessionMap().remove("ApartmentBC");
        }


    }

    /**
     * method to update an apartment
     */
    public void updateApartment() {
        this.getApartment().setApartmentID(Integer.parseInt(ThaoTacSession.layXuong("apartmentID").toString()));
        Apartments temp = this.apartmentsFacade.find(Integer.parseInt(ThaoTacSession.layXuong("apartmentID").toString()));
        //set apartmentID
        if (temp.getStatus() == true){
        apartment.setApartmentTypes(apartmentType);
        apartment.setFloors(floor);
        apartment.setStatus(temp.getStatus());
        //set others
        this.apartmentsFacade.edit(apartment);
        //edit the apartment
        Messages.taoTB(FacesMessage.SEVERITY_INFO, "The apartment is updated successfully", "Finish!");
        this.setErrors(0);
        FacesContext.getCurrentInstance().getExternalContext().getSessionMap().remove("ApartmentBC");
        }else{Messages.taoTB(FacesMessage.SEVERITY_INFO, "", "You can't update this apartment because it is sold");}
        //remove value of session bean after inserting
    }

    /**
     * Method to delete an apartment
     */
    public void deleteApartment() {
        this.setApartment((Apartments) ThaoTacSession.layXuong("apartment"));
        //get an apartment object from session
        ThaoTacSession.xoaGT("apartment");
        //detroy the session
        boolean status = apartment.getStatus();
        //get status of an apartment
        //status = false - the apartment is sold
        //status = true - the apartment is available
        if (status == true) {
            //status = true - we can delete the apartment
            this.apartmentsFacade.remove(getApartment());
            Messages.taoTB(FacesMessage.SEVERITY_INFO, "You deleted the apartment", "Finish!");
        } else { // we can't delete the apartment
            Messages.taoTB(FacesMessage.SEVERITY_INFO, "", "You can't delete this apartment because it exists in the contract table");
        }

        this.setErrors(0);
    }

    public void setApartmentToSession() {
        ThaoTacSession.duaGTLenSession("apartment", this.apartment);
    }

    public void setApartmentIDToSession() {
        ThaoTacSession.duaGTLenSession("apartmentID", this.apartment.getApartmentID());
    }

    public void updateProcess() {
        setApartmentIDToSession();
        building = this.getApartment().getFloors().getBuildings();
        floor.setFloorID(this.getApartment().getFloors().getFloorID());
        apartmentType.setApartmentTypeID(this.getApartment().getApartmentTypes().getApartmentTypeID());
    }

    /**
     * @return the apartment
     */
    public Apartments getApartment() {
        return apartment;
    }

    /**
     * @param apartment the apartment to set
     */
    public void setApartment(Apartments apartment) {
        this.apartment = apartment;
    }

    public ImageLists getImagelist() {
        return imagelist;
    }

    public void setImagelist(ImageLists imagelist) {
        this.imagelist = imagelist;
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

    public ApartmentTypes getApartmentType() {
        return apartmentType;
    }

    public void setApartmentType(ApartmentTypes apartmentType) {
        this.apartmentType = apartmentType;
    }

    public Floors getFloor() {
        return floor;
    }

    public void setFloor(Floors floor) {
        this.floor = floor;
    }

    public Buildings getBuilding() {
        return building;
    }

    public void setBuilding(Buildings building) {
        this.building = building;
    }

    public boolean isFlag() {
        return flag;
    }

    public void setFlag(boolean flag) {
        this.flag = flag;
    }

    public String getKeyWords() {
        return keyWords;
    }

    public void setKeyWords(String keyWords) {
        this.keyWords = keyWords;
    }

    public String getSearchType() {
        return searchType;
    }

    public void setSearchType(String searchType) {
        this.searchType = searchType;
    }
}
