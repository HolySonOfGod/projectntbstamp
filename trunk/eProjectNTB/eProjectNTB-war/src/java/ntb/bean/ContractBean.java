/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package ntb.bean;

import BeanCRUD.AccountsFacade;
import BeanCRUD.ApartmentsFacade;
import BeanCRUD.BuildingsFacade;
import BeanCRUD.ContractsFacade;
import BeanCRUD.FloorsFacade;
import BeanCRUD.PaymentDetailsFacade;
import BeanCRUD.PaymentModesFacade;
import BeanCRUD.RolesFacade;
import BeanInfo.Accounts;
import BeanInfo.Apartments;
import BeanInfo.Buildings;
import BeanInfo.Contracts;
import BeanInfo.Floors;
import BeanInfo.PaymentDetails;
import BeanInfo.PaymentModes;
import Helpers.Messages;
import Helpers.ThaoTacSession;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.ejb.EJB;
import javax.faces.application.FacesMessage;
import javax.faces.context.FacesContext;
import javax.faces.model.SelectItem;
import javax.validation.constraints.Max;
import javax.validation.constraints.Min;

/**
 *
 * @author phamdoan
 */
public class ContractBean implements Serializable {

    @EJB
    private RolesFacade rolesFacade;
    @EJB
    private BuildingsFacade buildingsFacade;
    @EJB
    private FloorsFacade floorsFacade;
    @EJB
    private PaymentDetailsFacade paymentDetailsFacade;
    @EJB
    private ApartmentsFacade apartmentsFacade;
    @EJB
    private PaymentModesFacade paymentModesFacade;
    @EJB
    private AccountsFacade accountsFacade;
    @EJB
    private ContractsFacade contractsFacade;
    private Contracts contract = new Contracts();
    private Apartments apartment = new Apartments();
    private PaymentModes paymentmode = new PaymentModes();
    private Accounts accounts = new Accounts();
    private PaymentDetails paymentDetail = new PaymentDetails();
    private Floors floors = new Floors();
    private Buildings building = new Buildings();
    private int errors = 1;
    private int paymentModeID;
    private int apartmentId;
    @Min(value = 100)
    @Max(value = 3000)
    private int stampDutyCost;
    private double firstPaid;
    private double total;

    public int getStampDutyCost() {
        return stampDutyCost;
    }

    public void setStampDutyCost(int stampDutyCost) {
        this.stampDutyCost = stampDutyCost;
    }

    public int getApartmentId() {
        return apartmentId;
    }

    public void setApartmentId(int apartmentId) {
        this.apartmentId = apartmentId;
    }

    public int getPaymentModeID() {
        return paymentModeID;
    }

    public void setPaymentModeID(int paymentModeID) {
        this.paymentModeID = paymentModeID;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }
    private String username;
    private double area;
    private double price;
    private double apartmentPrice;

    public double getApartmentPrice() {
        return apartmentPrice;
    }

    public void setApartmentPrice(double apartmentPrice) {
        this.apartmentPrice = apartmentPrice;
    }

    public double getArea() {
        return area;
    }

    public void setArea(double area) {
        this.area = area;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    /** Creates a new instance of ContractBean */
    public ContractBean() {
    }

    public List<Contracts> getlistContract() {
        return contractsFacade.findAll();
    }

    public List<Contracts> getlistContractByUsername() {
        accounts.setUsername(ThaoTacSession.layXuong("USER").toString());
        return this.contractsFacade.findByAccounts(accounts);
    }

    public List<SelectItem> getListBuildingName() {
        List<SelectItem> buildingItemList = new ArrayList<SelectItem>();
        List<Buildings> list = this.buildingsFacade.findAll();
        for (Buildings b : list) {
            SelectItem item = new SelectItem(b.getBuildingID(), b.getBuildingName());
            buildingItemList.add(item);
        }
        return buildingItemList;
    }

    public List<PaymentDetails> getlistdetail() {
        return this.paymentDetailsFacade.findAll();
    }

    public List<SelectItem> getListPaymodeID() {
        List<SelectItem> temp = new ArrayList<SelectItem>();
        List<PaymentModes> list = this.paymentModesFacade.findAll();
        for (PaymentModes p : list) {
            SelectItem si = new SelectItem(p.getPaymentModeID(), p.getPaymentModeName());
            temp.add(si);
        }
        return temp;
    }

    public List<SelectItem> getListApartment() {
        List<SelectItem> temp = new ArrayList<SelectItem>();
        List<Apartments> list = this.apartmentsFacade.getlistApartID(true);
        for (Apartments a : list) {
            SelectItem si = new SelectItem(a.getApartmentID(), a.getApartmentID().toString());
            temp.add(si);
        }
        return temp;
    }

    public List<SelectItem> getListAccount() {
        List<SelectItem> temp = new ArrayList<SelectItem>();
        List<Accounts> list = this.accountsFacade.getAccountOfCustomer(this.rolesFacade.find(5));
        for (Accounts a : list) {
            SelectItem si = new SelectItem(a.getUsername(), a.getUsername());
            temp.add(si);
        }
        return temp;
    }

    public void paymentChanged() {
        paymentmode = this.paymentModesFacade.find(this.paymentModeID);
        this.contract.setPaymentModes(this.paymentmode);
        if (paymentmode.getPaymentModeName().equals("one time")) {
            firstPaid = apartmentPrice + apartmentPrice * paymentmode.getInterest() / 100 + this.stampDutyCost;
            contract.setFirstPaid(firstPaid);
            contract.setTotalCost(total);
            FacesContext.getCurrentInstance().renderResponse();
        }
        FacesContext.getCurrentInstance().renderResponse();

    }

    //Apartment Price Customer payment
    public void apartmentChanged() {
        apartment = this.apartmentsFacade.find(this.apartmentId);
        this.area = apartment.getArea();
        this.price = apartment.getFloors().getPrice();
        this.apartmentPrice = area * price;
        contract.setApartmentPrice(this.apartmentPrice);
        FacesContext.getCurrentInstance().renderResponse();
    }

    public void firstPaidChanged() {
        double interest = paymentmode.getInterest();
        firstPaid = contract.getFirstPaid();
        total = apartmentPrice + apartmentPrice * interest / 100 + this.stampDutyCost - firstPaid;
        this.contract.setTotalCost(total);
        FacesContext.getCurrentInstance().renderResponse();
    }

    public void dmStamp() {
        System.out.println("test: " + this.stampDutyCost);
    }

    //function install date on database
    public void createContract() {
        if (firstPaid > apartmentPrice + stampDutyCost) {
            Messages.taoTB(FacesMessage.SEVERITY_INFO, "", "First Paid can't larger apartment Price!");
        } else {
            Date d = new Date();
            this.contract.setDateCreate(d);
            this.contract.setStampDutyCost(stampDutyCost);
            accounts = this.accountsFacade.find(this.username);
            this.contract.setApartments(apartment);
            this.contract.setAccounts(this.accounts);
            this.contractsFacade.create(this.contract);
            this.apartmentsFacade.updateStatus(apartment.getApartmentID());
            FacesContext.getCurrentInstance().getExternalContext().getSessionMap().remove("ContractBC");
            Messages.taoTB(FacesMessage.SEVERITY_INFO, "New Contract have been created successully", "Finish!");
            this.setErrors(0);
            ThaoTacSession.xoaGT("contractID");
        }
    }

    public List<PaymentDetails> getlistPaymentdetail() {
        return this.paymentDetailsFacade.findAll();
    }

    public void updateContract() {
        this.getContract().setContractID(Integer.parseInt(ThaoTacSession.layXuong("contractID").toString()));
        Date d = new Date();
        this.contract.setStampDutyCost(this.stampDutyCost);
        this.contract.setAccounts(this.accounts);
        this.contract.getPaymentModes().getPaymentModeID();
        this.contract.setDateCreate(d);
        this.contractsFacade.edit(contract);
        Messages.taoTB(FacesMessage.SEVERITY_INFO, "The contract updated successfully", "Finish!");
        this.setErrors(0);
        ThaoTacSession.xoaGT("contractID");
    }

    //fuction delete date
    public void deleteContract() {
        int id = Integer.parseInt(ThaoTacSession.layXuong("contractID").toString());
        contract = this.contractsFacade.find(id);
        String paymentMode = contract.getPaymentModes().getPaymentModeName();
        if (paymentMode.equals("one time")) {
            Messages.taoTB(FacesMessage.SEVERITY_ERROR, "", "You can't delete This Contract ");
        } else {
            List<PaymentDetails> temp = this.paymentDetailsFacade.getPaymentOfContract(contract);
            if (temp.isEmpty()) {
                contract = this.contractsFacade.find(Integer.valueOf(ThaoTacSession.layXuong("contractID").toString()));
                this.apartmentsFacade.updateStatusTrue(contract.getApartments().getApartmentID());
                this.contractsFacade.deleteContractID(Integer.parseInt(ThaoTacSession.layXuong("contractID").toString()));
                Messages.taoTB(FacesMessage.SEVERITY_INFO, " ", "delete successfully");
                this.setErrors(0);
            } else {
                Messages.taoTB(FacesMessage.SEVERITY_ERROR, "", "Contract '" + " can't delete this Contract because payment detail using  this Contract!. ");
            }
        }
        ThaoTacSession.xoaGT("contractID");
    }
    public void setContractToSession() {
        ThaoTacSession.duaGTLenSession("contract", this.contract);
    }

    public void setContractIDToSession() {
        ThaoTacSession.duaGTLenSession("contractID", this.contract.getContractID());

    }

    /**
     * @return the contract
     */
    public Contracts getContract() {
        return contract;
    }

    /**
     * @param contract the contract to set
     */
    public void setContract(Contracts contract) {
        this.contract = contract;
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

    /**
     * @return the paymentmode
     */
    public PaymentModes getPaymentmode() {
        return paymentmode;
    }

    /**
     * @param paymentmode the paymentmode to set
     */
    public void setPaymentmode(PaymentModes paymentmode) {
        this.paymentmode = paymentmode;
    }

    /**
     * @return the accounts
     */
    public Accounts getAccounts() {
        return accounts;
    }

    /**
     * @param accounts the accounts to set
     */
    public void setAccounts(Accounts accounts) {
        this.accounts = accounts;
    }

    /**
     * @return the paymentModeID
     */
    /**
     * @return the floors
     */
    public Floors getFloors() {
        return floors;
    }

    /**
     * @param floors the floors to set
     */
    public void setFloors(Floors floors) {
        this.floors = floors;
    }

    /**
     * @return the paymentDetail
     */
    public PaymentDetails getPaymentDetail() {
        return paymentDetail;
    }

    /**
     * @param paymentDetail the paymentDetail to set
     */
    public void setPaymentDetail(PaymentDetails paymentDetail) {
        this.paymentDetail = paymentDetail;
    }

    public Buildings getBuilding() {
        return building;
    }

    public void setBuilding(Buildings building) {
        this.building = building;
    }

    /**
     * @return the total
     */
    public double getTotal() {
        return total;
    }

    /**
     * @param total the total to set
     */
    public void setTotal(double total) {
        this.total = total;
    }
}
