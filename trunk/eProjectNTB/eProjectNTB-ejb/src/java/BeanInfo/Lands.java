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
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;

/**
 *
 * @author Nhat Nguyen
 */
@Entity
@Table(name = "Lands")
@NamedQueries({
    @NamedQuery(name = "Lands.findAll", query = "SELECT l FROM Lands l"),
    @NamedQuery(name = "Lands.findByLandID", query = "SELECT l FROM Lands l WHERE l.landID = :landID"),
    @NamedQuery(name = "Lands.findByAddress", query = "SELECT l FROM Lands l WHERE l.address = :address"),
    @NamedQuery(name = "Lands.findByArea", query = "SELECT l FROM Lands l WHERE l.area = :area"),
    @NamedQuery(name = "Lands.findByNearByLandmark", query = "SELECT l FROM Lands l WHERE l.nearByLandmark = :nearByLandmark"),
    @NamedQuery(name = "Lands.findByPurchasedCost", query = "SELECT l FROM Lands l WHERE l.purchasedCost = :purchasedCost"),
    @NamedQuery(name = "Lands.findByPresentCost", query = "SELECT l FROM Lands l WHERE l.presentCost = :presentCost"),
    @NamedQuery(name = "Lands.findByPurchasedDate", query = "SELECT l FROM Lands l WHERE l.purchasedDate = :purchasedDate")})
public class Lands implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "LandID")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer landID;
    @Basic(optional = false)
    @Column(name = "Address")
    @NotEmpty(message = "Address can't be empty")
    @Length(max = 200, message = "Address has maximum 200 characters")
    private String address;
    @Basic(optional = false)
    @Column(name = "Area")
    @NotNull(message = "Please input land's area")
    private double area;
    @Basic(optional = false)
    @Column(name = "NearByLandmark")
    @NotEmpty(message = "Please input benefit of land's position")
    private String nearByLandmark;
    @Basic(optional = false)
    @Column(name = "PurchasedCost")
    @NotNull(message = "Please input land's purchased cost")
    private double purchasedCost;
    @Basic(optional = false)
    @NotNull(message = "Please input land's present cost")
    @Column(name = "PresentCost")
    private double presentCost;
    @Column(name = "PurchasedDate")
    @Temporal(TemporalType.TIMESTAMP)
    private Date purchasedDate;
    @OneToMany(mappedBy = "lands")
    private List<Buildings> buildingsList;
    @OneToMany(mappedBy = "lands")
    private List<Permits> permitsList;
    @JoinColumn(name = "LocationID", referencedColumnName = "LocationID")
    @ManyToOne
    private Locations locations;

    public Lands() {
    }

    public Lands(Integer landID) {
        this.landID = landID;
    }

    public Lands(Integer landID, String address, double area, String nearByLandmark, double purchasedCost, double presentCost) {
        this.landID = landID;
        this.address = address;
        this.area = area;
        this.nearByLandmark = nearByLandmark;
        this.purchasedCost = purchasedCost;
        this.presentCost = presentCost;
    }

    public Integer getLandID() {
        return landID;
    }

    public void setLandID(Integer landID) {
        this.landID = landID;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public double getArea() {
        return area;
    }

    public void setArea(double area) {
        this.area = area;
    }

    public String getNearByLandmark() {
        return nearByLandmark;
    }

    public void setNearByLandmark(String nearByLandmark) {
        this.nearByLandmark = nearByLandmark;
    }

    public double getPurchasedCost() {
        return purchasedCost;
    }

    public void setPurchasedCost(double purchasedCost) {
        this.purchasedCost = purchasedCost;
    }

    public double getPresentCost() {
        return presentCost;
    }

    public void setPresentCost(double presentCost) {
        this.presentCost = presentCost;
    }

    public Date getPurchasedDate() {
        return purchasedDate;
    }

    public void setPurchasedDate(Date purchasedDate) {
        this.purchasedDate = purchasedDate;
    }

    public List<Buildings> getBuildingsList() {
        return buildingsList;
    }

    public void setBuildingsList(List<Buildings> buildingsList) {
        this.buildingsList = buildingsList;
    }

    public List<Permits> getPermitsList() {
        return permitsList;
    }

    public void setPermitsList(List<Permits> permitsList) {
        this.permitsList = permitsList;
    }

    public Locations getLocations() {
        return locations;
    }

    public void setLocations(Locations locations) {
        this.locations = locations;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (landID != null ? landID.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Lands)) {
            return false;
        }
        Lands other = (Lands) object;
        if ((this.landID == null && other.landID != null) || (this.landID != null && !this.landID.equals(other.landID))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "BeanInfo.Lands[landID=" + landID + "]";
    }
}
