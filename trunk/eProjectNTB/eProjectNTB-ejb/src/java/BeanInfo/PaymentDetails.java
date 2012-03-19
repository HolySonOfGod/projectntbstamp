/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package BeanInfo;

import java.io.Serializable;
import java.util.Date;
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
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.*;

/**
 *
 * @author Nhat Nguyen
 */
@Entity
@Table(name = "PaymentDetails")
@NamedQueries({
    @NamedQuery(name = "PaymentDetails.findAll", query = "SELECT p FROM PaymentDetails p"),
    @NamedQuery(name = "PaymentDetails.deletePaymentDetailID", query = "DELETE FROM PaymentDetails p WHERE p.paymentDetailID = :paymentDetailID"),
    @NamedQuery(name = "PaymentDetails.findByPaymentDetailID", query = "SELECT p FROM PaymentDetails p WHERE p.paymentDetailID = :paymentDetailID"),
    @NamedQuery(name = "PaymentDetails.findByAmountPaidPerInstallment", query = "SELECT p FROM PaymentDetails p WHERE p.amountPaidPerInstallment = :amountPaidPerInstallment"),
    @NamedQuery(name = "PaymentDetails.findByInstallmentNo", query = "SELECT p FROM PaymentDetails p WHERE p.installmentNo = :installmentNo"),
    @NamedQuery(name = "PaymentDetails.findByPayDate", query = "SELECT p FROM PaymentDetails p WHERE p.payDate = :payDate"),
    @NamedQuery(name = "PaymentDetails.findByAmountPaid", query = "SELECT p FROM PaymentDetails p WHERE p.amountPaid = :amountPaid"),
    @NamedQuery(name = "PaymentDetails.findByAmountOwed", query = "SELECT p FROM PaymentDetails p WHERE p.amountOwed = :amountOwed"),
    @NamedQuery(name = "PaymentDetails.findByDateEnd", query = "SELECT p FROM PaymentDetails p WHERE p.dateEnd = :dateEnd"),
    @NamedQuery(name = "PaymentDetails.findByContract", query = "SELECT p FROM PaymentDetails p WHERE p.contracts = :contracts"),
    @NamedQuery(name = "PaymentDetails.findByOtherCost", query = "SELECT p FROM PaymentDetails p WHERE p.otherCost = :otherCost")})
public class PaymentDetails implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "PaymentDetailID")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer paymentDetailID;
    @Basic(optional = false)
    @Column(name = "AmountPaidPerInstallment")
    @Min(value = 1000)
    @Max(value = 50000000)
    private double amountPaidPerInstallment;
    @Column(name = "InstallmentNo")
    @Min(value = 1)
    @Max(value = 360)
    private Integer installmentNo;
    @Basic(optional = false)
    @Column(name = "PayDate")
    @Temporal(TemporalType.TIMESTAMP)
    private Date payDate;
    @Basic(optional = false)
    @Column(name = "AmountPaid")
    private double amountPaid;
    @Basic(optional = false)
    @Column(name = "AmountOwed")
    private double amountOwed;
    @Basic(optional = false)
    @Column(name = "DateEnd")
    @Temporal(TemporalType.TIMESTAMP)
    private Date dateEnd;
    @Column(name = "OtherCost")
    private Double otherCost;
    @JoinColumn(name = "ContractID", referencedColumnName = "ContractID")
    @ManyToOne
    private Contracts contracts;

    public PaymentDetails() {
    }

    public PaymentDetails(Integer paymentDetailID) {
        this.paymentDetailID = paymentDetailID;
    }

    public PaymentDetails(Integer paymentDetailID, double amountPaidPerInstallment, Date payDate, double amountPaid, double amountOwed, Date dateEnd) {
        this.paymentDetailID = paymentDetailID;
        this.amountPaidPerInstallment = amountPaidPerInstallment;
        this.payDate = payDate;
        this.amountPaid = amountPaid;
        this.amountOwed = amountOwed;
        this.dateEnd = dateEnd;
    }

    public Integer getPaymentDetailID() {
        return paymentDetailID;
    }

    public void setPaymentDetailID(Integer paymentDetailID) {
        this.paymentDetailID = paymentDetailID;
    }

    public double getAmountPaidPerInstallment() {
        return amountPaidPerInstallment;
    }

    public void setAmountPaidPerInstallment(double amountPaidPerInstallment) {
        this.amountPaidPerInstallment = amountPaidPerInstallment;
    }

    public Integer getInstallmentNo() {
        return installmentNo;
    }

    public void setInstallmentNo(Integer installmentNo) {
        this.installmentNo = installmentNo;
    }

    public Date getPayDate() {
        return payDate;
    }

    public void setPayDate(Date payDate) {
        this.payDate = payDate;
    }

    public double getAmountPaid() {
        return amountPaid;
    }

    public void setAmountPaid(double amountPaid) {
        this.amountPaid = amountPaid;
    }

    public double getAmountOwed() {
        return amountOwed;
    }

    public void setAmountOwed(double amountOwed) {
        this.amountOwed = amountOwed;
    }

    public Date getDateEnd() {
        return dateEnd;
    }

    public void setDateEnd(Date dateEnd) {
        this.dateEnd = dateEnd;
    }

    public Double getOtherCost() {
        return otherCost;
    }

    public void setOtherCost(Double otherCost) {
        this.otherCost = otherCost;
    }

    public Contracts getContracts() {
        return contracts;
    }

    public void setContracts(Contracts contracts) {
        this.contracts = contracts;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (paymentDetailID != null ? paymentDetailID.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof PaymentDetails)) {
            return false;
        }
        PaymentDetails other = (PaymentDetails) object;
        if ((this.paymentDetailID == null && other.paymentDetailID != null) || (this.paymentDetailID != null && !this.paymentDetailID.equals(other.paymentDetailID))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "BeanInfo.PaymentDetails[paymentDetailID=" + paymentDetailID + "]";
    }

}
