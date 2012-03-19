/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package BeanInfo;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.*;

/**
 *
 * @author phamdoan
 */
@Entity
@Table(name = "Contracts")
@NamedQueries({
    @NamedQuery(name = "Contracts.findAll", query = "SELECT c FROM Contracts c"),
    @NamedQuery(name = "Contracts.deleteContractsID", query = "DELETE FROM Contracts p WHERE p.contractID = :contractID"),
    @NamedQuery(name = "Contracts.findByContractID", query = "SELECT c FROM Contracts c WHERE c.contractID = :contractID"),
    @NamedQuery(name = "Contracts.findByDateCreate", query = "SELECT c FROM Contracts c WHERE c.dateCreate = :dateCreate"),
    @NamedQuery(name = "Contracts.findByStampDutyCost", query = "SELECT c FROM Contracts c WHERE c.stampDutyCost = :stampDutyCost"),
    @NamedQuery(name = "Contracts.findByApartmentPrice", query = "SELECT c FROM Contracts c WHERE c.apartmentPrice = :apartmentPrice"),
    @NamedQuery(name = "Contracts.findByTotalCost", query = "SELECT c FROM Contracts c WHERE c.totalCost = :totalCost"),
    @NamedQuery(name = "Contracts.findByFirstPaid", query = "SELECT c FROM Contracts c WHERE c.firstPaid = :firstPaid"),
    @NamedQuery(name = "Contracts.findByAccounts", query = "SELECT c FROM Contracts c WHERE c.accounts = :accounts")})
public class Contracts implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "ContractID")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer contractID;
    @Basic(optional = false)
    @Column(name = "DateCreate")
    @Temporal(TemporalType.TIMESTAMP)
    private Date dateCreate;
    @Column(name = "StampDutyCost")
    @Min(value = 1)
    @Max(value = 999999)
    private Integer stampDutyCost;
    @Basic(optional = false)
    @Column(name = "ApartmentPrice")
    private double apartmentPrice;
    @Basic(optional = false)
    @Column(name = "TotalCost")
    private double totalCost;
    @Basic(optional = false)
    @Column(name = "FirstPaid")
    private double firstPaid;
    @JoinColumn(name = "PaymentModeID", referencedColumnName = "PaymentModeID")
    @ManyToOne
    private PaymentModes paymentModes;
    @JoinColumn(name = "ApartmentID", referencedColumnName = "ApartmentID")
    @OneToOne
    private Apartments apartments;
    @JoinColumn(name = "Username", referencedColumnName = "Username")
    @ManyToOne
    private Accounts accounts;
    @OneToMany(mappedBy = "contracts")
    private List<PaymentDetails> paymentDetailsList;

    public Contracts() {
    }

    public Contracts(Integer contractID) {
        this.contractID = contractID;
    }

    public Contracts(Integer contractID, Date dateCreate, double apartmentPrice, double totalCost, double firstPaid) {
        this.contractID = contractID;
        this.dateCreate = dateCreate;
        this.apartmentPrice = apartmentPrice;
        this.totalCost = totalCost;
        this.firstPaid = firstPaid;
    }

    public Integer getContractID() {
        return contractID;
    }

    public void setContractID(Integer contractID) {
        this.contractID = contractID;
    }

    public Date getDateCreate() {
        return dateCreate;
    }

    public void setDateCreate(Date dateCreate) {
        this.dateCreate = dateCreate;
    }

    public Integer getStampDutyCost() {
        return stampDutyCost;

    }

    public void setStampDutyCost(Integer stampDutyCost) {
        this.stampDutyCost = stampDutyCost;
    }

    public double getApartmentPrice() {
        return apartmentPrice;
    }

    public void setApartmentPrice(double apartmentPrice) {
        this.apartmentPrice = apartmentPrice;
    }

    public double getTotalCost() {
        return totalCost;
    }

    public void setTotalCost(double totalCost) {
        this.totalCost = totalCost;
    }

    public double getFirstPaid() {
        return firstPaid;
    }

    public void setFirstPaid(double firstPaid) {
        this.firstPaid = firstPaid;
    }

    public PaymentModes getPaymentModes() {
        return paymentModes;
    }

    public void setPaymentModes(PaymentModes paymentModes) {
        this.paymentModes = paymentModes;
    }

    public Apartments getApartments() {
        return apartments;
    }

    public void setApartments(Apartments apartments) {
        this.apartments = apartments;
    }

    public Accounts getAccounts() {
        return accounts;
    }

    public void setAccounts(Accounts accounts) {
        this.accounts = accounts;
    }

    public List<PaymentDetails> getPaymentDetailsList() {
        return paymentDetailsList;
    }

    public void setPaymentDetailsList(List<PaymentDetails> paymentDetailsList) {
        this.paymentDetailsList = paymentDetailsList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (contractID != null ? contractID.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Contracts)) {
            return false;
        }
        Contracts other = (Contracts) object;
        if ((this.contractID == null && other.contractID != null) || (this.contractID != null && !this.contractID.equals(other.contractID))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "BeanInfo.Contracts[contractID=" + contractID + "]";
    }

}
