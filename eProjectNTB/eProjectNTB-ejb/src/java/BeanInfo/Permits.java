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
import org.hibernate.validator.constraints.Length;

/**
 *
 * @author Nhat Nguyen
 */
@Entity
@Table(name = "Permits")
@NamedQueries({
    @NamedQuery(name = "Permits.findAll", query = "SELECT p FROM Permits p"),
    @NamedQuery(name = "Permits.findByPermitID", query = "SELECT p FROM Permits p WHERE p.permitID = :permitID"),
    @NamedQuery(name = "Permits.findByDateIssued", query = "SELECT p FROM Permits p WHERE p.dateIssued = :dateIssued"),
    @NamedQuery(name = "Permits.findByIssuer", query = "SELECT p FROM Permits p WHERE p.issuer = :issuer"),
    @NamedQuery(name = "Permits.findBySignerName", query = "SELECT p FROM Permits p WHERE p.signerName = :signerName"),
    @NamedQuery(name = "Permits.findByNumberOfDecisions", query = "SELECT p FROM Permits p WHERE p.numberOfDecisions = :numberOfDecisions"),
    @NamedQuery(name = "Permits.findByStatus", query = "SELECT p FROM Permits p WHERE p.status = :status"),
    @NamedQuery(name = "Permits.findByDescription", query = "SELECT p FROM Permits p WHERE p.description = :description")})
public class Permits implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "PermitID")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer permitID;
    @Column(name = "DateIssued")
    @Temporal(TemporalType.TIMESTAMP)
    private Date dateIssued;
    @Column(name = "Issuer")
    @Length(max = 100, message = "Issuer has maximum 100 characters")
    private String issuer;
    @Column(name = "SignerName")
    @Length(max = 100, message = "Signer name has maximum 100 characters")
    private String signerName;
    @Column(name = "NumberOfDecisions")
    @Length(max = 30, message = "Number of decisions has maximum 100 characters")
    private String numberOfDecisions;
    @Column(name = "Status")
    private String status;
    @Column(name = "Description")
    private String description;
    @JoinColumn(name = "LandID", referencedColumnName = "LandID")
    @ManyToOne
    private Lands lands;

    public Permits() {
    }

    public Permits(Integer permitID) {
        this.permitID = permitID;
    }

    public Integer getPermitID() {
        return permitID;
    }

    public void setPermitID(Integer permitID) {
        this.permitID = permitID;
    }

    public Date getDateIssued() {
        return dateIssued;
    }

    public void setDateIssued(Date dateIssued) {
        this.dateIssued = dateIssued;
    }

    public String getIssuer() {
        return issuer;
    }

    public void setIssuer(String issuer) {
        this.issuer = issuer;
    }

    public String getSignerName() {
        return signerName;
    }

    public void setSignerName(String signerName) {
        this.signerName = signerName;
    }

    public String getNumberOfDecisions() {
        return numberOfDecisions;
    }

    public void setNumberOfDecisions(String numberOfDecisions) {
        this.numberOfDecisions = numberOfDecisions;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Lands getLands() {
        return lands;
    }

    public void setLands(Lands lands) {
        this.lands = lands;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (permitID != null ? permitID.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Permits)) {
            return false;
        }
        Permits other = (Permits) object;
        if ((this.permitID == null && other.permitID != null) || (this.permitID != null && !this.permitID.equals(other.permitID))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "BeanInfo.Permits[permitID=" + permitID + "]";
    }
}
