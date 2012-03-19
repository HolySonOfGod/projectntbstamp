/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Filters;

import BeanInfo.PaymentDetails;
import java.util.Date;
import javax.faces.context.FacesContext;

/**
 *
 * @author phamdoan
 */
public class PaymentDetailFilter {

    /** Creates a new instance of PaymentDetailFilter */
    private Date payDate;
    private int contractID;
    private String username = "";
    private String firstName = "";
    private double totaCost;
    private double firstPaid;
    private double aInstallment;
    private int installNo;
    private int installmentNo;
    private Date dateEnd;
    private double amountPaid;
    private double amountOwed;
    private double amountPaidPerInstallment;

    public PaymentDetailFilter() {
    }

    public void resetDetailTable() {
        FacesContext.getCurrentInstance().getExternalContext().getSessionMap().remove("paymentDetailFilter");
    }

    public boolean filterByDate(Object obj) {
        PaymentDetails paymentdetail = (PaymentDetails) obj;
        if (payDate == null) {
            return true;
        }
        return payDate.equals(paymentdetail.getPayDate());
    }

    public boolean filteringContractID(Object obj) {
        PaymentDetails paymentdetail = (PaymentDetails) obj;
        if (contractID == 0) {
            return true;
        }
        if (paymentdetail.getContracts().getContractID() == contractID) {
            return true;
        } else {
            return false;
        }

    }

    public boolean filterDetailUsername(Object current) {
        PaymentDetails paymentDetail = (PaymentDetails) current;
        if (username.length() == 0) {
            return true;
        }
        if (paymentDetail.getContracts().getAccounts().getUsername().toLowerCase().startsWith(username.toLowerCase())) {
            return true;
        } else {
            return false;
        }
    }

    public boolean filterDetailFirstName(Object current) {
        PaymentDetails paymentDetail = (PaymentDetails) current;
        if (firstName.length() == 0) {
            return true;
        }
        if (paymentDetail.getContracts().getAccounts().getFirstName().toLowerCase().startsWith(firstName.toLowerCase())) {
            return true;
        } else {
            return false;
        }
    }

    public boolean filteringTotalCost(Object obj) {
        PaymentDetails paymentdetail = (PaymentDetails) obj;
        if (totaCost == 0) {
            return true;
        }
        if (paymentdetail.getContracts().getTotalCost() == totaCost) {
            return true;
        } else {
            return false;
        }

    }

    public boolean filteringFirstPaid(Object obj) {
        PaymentDetails paymentdetail = (PaymentDetails) obj;
        if (firstPaid == 0) {
            return true;
        }
        if (paymentdetail.getContracts().getFirstPaid() == firstPaid) {
            return true;
        } else {
            return false;
        }

    }

    public boolean filteringAmountPaid(Object obj) {
        PaymentDetails paymentdetail = (PaymentDetails) obj;
        if (getAmountPaid() == 0) {
            return true;
        }
        if (paymentdetail.getAmountPaid() == getAmountPaid()) {
            return true;
        } else {
            return false;
        }

    }

    public boolean filteringAmountOWeb(Object obj) {
        PaymentDetails paymentdetail = (PaymentDetails) obj;
        if (getAmountOwed() == 0) {
            return true;
        }
        if (paymentdetail.getAmountOwed() == getAmountOwed()) {
            return true;
        } else {
            return false;
        }

    }

    public boolean filteringamountPaidPerInstallment(Object obj) {
        PaymentDetails paymentdetail = (PaymentDetails) obj;
        if (amountPaidPerInstallment == 0) {
            return true;
        }
        if (paymentdetail.getAmountPaidPerInstallment() == amountPaidPerInstallment) {
            return true;
        } else {
            return false;
        }

    }

    public boolean filteringInstallNo(Object obj) {
        PaymentDetails paymentdetail = (PaymentDetails) obj;
        if (installmentNo == 0) {
            return true;
        }
        if (paymentdetail.getInstallmentNo() == installmentNo) {
            return true;
        } else {
            return false;
        }

    }

    /**
     * @return the installmentNo
     */
    public int getInstallmentNo() {
        return installmentNo;
    }

    /**
     * @param installmentNo the installmentNo to set
     */
    public void setInstallmentNo(int installmentNo) {
        this.installmentNo = installmentNo;
    }

    /**
     * @return the payDate
     */
    public Date getPayDate() {
        return payDate;
    }

    /**
     * @param payDate the payDate to set
     */
    public void setPayDate(Date payDate) {
        this.payDate = payDate;
    }

    /**
     * @return the dateEnd
     */
    public Date getDateEnd() {
        return dateEnd;
    }

    /**
     * @param dateEnd the dateEnd to set
     */
    public void setDateEnd(Date dateEnd) {
        this.dateEnd = dateEnd;
    }

    /**
     * @return the amountPaid
     */
    public double getAmountPaid() {
        return amountPaid;
    }

    /**
     * @param amountPaid the amountPaid to set
     */
    public void setAmountPaid(double amountPaid) {
        this.amountPaid = amountPaid;
    }

    /**
     * @return the amountOwed
     */
    public double getAmountOwed() {
        return amountOwed;
    }

    /**
     * @param amountOwed the amountOwed to set
     */
    public void setAmountOwed(double amountOwed) {
        this.amountOwed = amountOwed;
    }

    /**
     * @return the amountPaidPerInstallment
     */
    public double getAmountPaidPerInstallment() {
        return amountPaidPerInstallment;
    }

    /**
     * @param amountPaidPerInstallment the amountPaidPerInstallment to set
     */
    public void setAmountPaidPerInstallment(double amountPaidPerInstallment) {
        this.amountPaidPerInstallment = amountPaidPerInstallment;
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
     * @return the firstName
     */
    public String getFirstName() {
        return firstName;
    }

    /**
     * @param firstName the firstName to set
     */
    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    /**
     * @return the totaCost
     */
    public double getTotaCost() {
        return totaCost;
    }

    /**
     * @param totaCost the totaCost to set
     */
    public void setTotaCost(double totaCost) {
        this.totaCost = totaCost;
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
     * @return the aInstallment
     */
    public double getaInstallment() {
        return aInstallment;
    }

    /**
     * @param aInstallment the aInstallment to set
     */
    public void setaInstallment(double aInstallment) {
        this.aInstallment = aInstallment;
    }

    /**
     * @return the installNo
     */
    public int getInstallNo() {
        return installNo;
    }

    /**
     * @param installNo the installNo to set
     */
    public void setInstallNo(int installNo) {
        this.installNo = installNo;
    }
}
