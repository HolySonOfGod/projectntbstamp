/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package BeanInfo;

import java.io.Serializable;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;

/**
 *
 * @author Nhat Nguyen
 */
@Entity
@Table(name = "PaymentModes")
@NamedQueries({
    @NamedQuery(name = "PaymentModes.findAll", query = "SELECT p FROM PaymentModes p"),
    @NamedQuery(name = "PaymentModes.deletePMByID", query = "DELETE FROM PaymentModes p WHERE p.paymentModeID = :paymentModeID"),
    @NamedQuery(name = "PaymentModes.findByPaymentModeID", query = "SELECT p FROM PaymentModes p WHERE p.paymentModeID = :paymentModeID"),
    @NamedQuery(name = "PaymentModes.findByPaymentModeName", query = "SELECT p FROM PaymentModes p WHERE p.paymentModeName = :paymentModeName"),
    @NamedQuery(name = "PaymentModes.findByInstallment", query = "SELECT p FROM PaymentModes p WHERE p.installment = :installment"),
    @NamedQuery(name = "PaymentModes.findByInterest", query = "SELECT p FROM PaymentModes p WHERE p.interest = :interest")})
    public class PaymentModes implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "PaymentModeID")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer paymentModeID;
    @Basic(optional = false)
    @Column(name = "PaymentModeName")
    @NotEmpty(message = "Payment mode name can't be empty")
    @Length(max = 100, message = "Payment mode name has maximum 100 characters")
    private String paymentModeName;
    @Basic(optional = false)
    @Column(name = "Installment")
    @NotNull(message = "Installment of Payment mode can't be empty")
    @Min(value=1)
    @Max(value=600)
    private int installment;
    @Basic(optional = false)
    @Column(name = "Interest")
    @NotNull(message = "Interest of Payment mode can't be empty")
    @Min(value=0)
    @Max(value=90)
    private double interest;
    @OneToMany(mappedBy = "paymentModes")
    private List<Contracts> contractsList;

    public PaymentModes() {
    }

    public PaymentModes(Integer paymentModeID) {
        this.paymentModeID = paymentModeID;
    }

    public PaymentModes(Integer paymentModeID, String paymentModeName, int installment, double interest) {
        this.paymentModeID = paymentModeID;
        this.paymentModeName = paymentModeName;
        this.installment = installment;
        this.interest = interest;
    }

    public Integer getPaymentModeID() {
        return paymentModeID;
    }

    public void setPaymentModeID(Integer paymentModeID) {
        this.paymentModeID = paymentModeID;
    }

    public String getPaymentModeName() {
        return paymentModeName;
    }

    public void setPaymentModeName(String paymentModeName) {
        this.paymentModeName = paymentModeName;
    }

    public int getInstallment() {
        return installment;
    }

    public void setInstallment(int installment) {
        this.installment = installment;
    }

    public double getInterest() {
        return interest;
    }

    public void setInterest(double interest) {
        this.interest = interest;
    }

    public List<Contracts> getContractsList() {
        return contractsList;
    }

    public void setContractsList(List<Contracts> contractsList) {
        this.contractsList = contractsList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (paymentModeID != null ? paymentModeID.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof PaymentModes)) {
            return false;
        }
        PaymentModes other = (PaymentModes) object;
        if ((this.paymentModeID == null && other.paymentModeID != null) || (this.paymentModeID != null && !this.paymentModeID.equals(other.paymentModeID))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "BeanInfo.PaymentModes[paymentModeID=" + paymentModeID + "]";
    }
}
