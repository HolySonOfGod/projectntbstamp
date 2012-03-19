/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Filters;

import BeanInfo.Contracts;
import java.util.Date;
import javax.faces.context.FacesContext;

/**
 *
 * @author phamdoan
 */
public class ContractFilter {

    /** Creates a new instance of ContractFilter */
    private int contractID = 0;
    private String username = "";
    private Date contractDate;
    private int stampDutyCost = 0;
    private int apartmentID = 0;
    private double apartmentPrice;
    private double totalCost;
    private double firstPaid;
    private int paymentModeID = 0;

    public ContractFilter() {
    }
    private Date filterDate;
    public boolean filterByDate(Object current) {
        if (getFilterDate() == null) {
            return true;
        }
        Contracts contract = (Contracts) current;
        return getFilterDate().equals(contract.getDateCreate());
    }

    //filtering
    public boolean filterStates(Object current) {
        Contracts contract = (Contracts) current;
        if (username.length() == 0) {
            return true;
        }
        if (contract.getAccounts().getUsername().toLowerCase().startsWith(username.toLowerCase())) {
            return true;
        } else {
            return false;
        }
    }

    public boolean filteringApartmentID(Object obj) {
        Contracts contract = (Contracts) obj;
        if (apartmentID == 0) {
            return true;
        }
        if (contract.getApartments().getApartmentID() == apartmentID) {
            return true;
        } else {
            return false;
        }
    }

    public boolean filteringfirstPaid(Object obj) {
        Contracts contract = (Contracts) obj;
        if (firstPaid == 0) {
            return true;
        }
        if (contract.getFirstPaid() == firstPaid) {
            return true;
        } else {
            return false;
        }

    }

    public boolean filteringTotalCost(Object obj) {
        Contracts contract = (Contracts) obj;
        if (totalCost == 0) {
            return true;
        }
        if (contract.getTotalCost() == totalCost) {
            return true;
        } else {
            return false;
        }

    }

    public boolean filteringApartmentPrice(Object obj) {
        Contracts contract = (Contracts) obj;
        if (apartmentPrice == 0) {
            return true;
        }
        if (contract.getApartmentPrice() == apartmentPrice) {
            return true;
        } else {
            return false;
        }

    }

    public boolean filteringPaymentmodeName(Object obj) {
        Contracts contract = (Contracts) obj;
        if (paymentModeID == 0) {
            return true;
        }
        if (contract.getPaymentModes().getPaymentModeID() == paymentModeID) {
            return true;
        } else {
            return false;
        }
    }

    public boolean filteringStampDutyCost(Object obj) {
        Contracts contract = (Contracts) obj;
        if (stampDutyCost == 0) {
            return true;
        }
        if (contract.getStampDutyCost() == stampDutyCost) {
            return true;
        } else {
            return false;
        }
    }

    public boolean filterContractID(Object ojb) {
        Contracts contract = (Contracts) ojb;
        if (contractID == 0) {
            return true;
        }
        if (contract.getContractID() == contractID) {
            return true;
        } else {
            return false;
        }
    }

    public void resetContractTable() {
        FacesContext.getCurrentInstance().getExternalContext().getSessionMap().remove("contractFilter");
    }

    /**
     * @return the contractID
     */
    public int getContractID() {
        return contractID;
    }

    /**
     * @param contractID the contractID to set
     */
    public void setContractID(int contractID) {
        this.contractID = contractID;
    }

    /**
     * @return the contractDate
     */
    public Date getContractDate() {
        return contractDate;
    }

    /**
     * @param contractDate the contractDate to set
     */
    public void setContractDate(Date contractDate) {
        this.contractDate = contractDate;
    }

    /**
     * @return the stampDutyCost
     */
    public int getStampDutyCost() {
        return stampDutyCost;
    }

    /**
     * @param stampDutyCost the stampDutyCost to set
     */
    public void setStampDutyCost(int stampDutyCost) {
        this.stampDutyCost = stampDutyCost;
    }

    /**
     * @return the apartmentPrice
     */
    public double getApartmentPrice() {
        return apartmentPrice;
    }

    /**
     * @param apartmentPrice the apartmentPrice to set
     */
    public void setApartmentPrice(double apartmentPrice) {
        this.apartmentPrice = apartmentPrice;
    }

    /**
     * @return the totalCost
     */
    public double getTotalCost() {
        return totalCost;
    }

    /**
     * @param totalCost the totalCost to set
     */
    public void setTotalCost(double totalCost) {
        this.totalCost = totalCost;
    }

    /**
     * @return the firstPaid
     */
    public double getFirstPaid() {
        return firstPaid;
    }

    /**
     * @param firstPaid the firstPaid to set
     */
    public void setFirstPaid(double firstPaid) {
        this.firstPaid = firstPaid;
    }

    /**
     * @return the apartmentID
     */
    public int getApartmentID() {
        return apartmentID;
    }

    /**
     * @param apartmentID the apartmentID to set
     */
    public void setApartmentID(int apartmentID) {
        this.apartmentID = apartmentID;
    }

    /**
     * @return the paymentModeID
     */
    public int getPaymentModeID() {
        return paymentModeID;
    }

    /**
     * @param paymentModeID the paymentModeID to set
     */
    public void setPaymentModeID(int paymentModeID) {
        this.paymentModeID = paymentModeID;
    }

    /**
     * @return the username
     */
    public String getUsername() {
        return username;
    }

    /**
     * @param username the username to set
     */
    public void setUsername(String username) {
        this.username = username;
    }

    /**
     * @return the filterDate
     */
    public Date getFilterDate() {
        return filterDate;
    }

    /**
     * @param filterDate the filterDate to set
     */
    public void setFilterDate(Date filterDate) {
        this.filterDate = filterDate;
    }
}
