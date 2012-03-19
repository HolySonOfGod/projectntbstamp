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
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import org.hibernate.validator.constraints.NotEmpty;

/**
 *
 * @author Hung
 */
@Entity
@Table(name = "Apartments")
@NamedQueries({
    @NamedQuery(name = "Apartments.findAll", query = "SELECT a FROM Apartments a"),
    @NamedQuery(name = "Apartments.findByApartmentID", query = "SELECT a FROM Apartments a WHERE a.apartmentID = :apartmentID"),
    @NamedQuery(name = "Apartments.findByArea", query = "SELECT a FROM Apartments a WHERE a.area = :area"),
    @NamedQuery(name = "Apartments.findByGreaterArea", query = "SELECT a FROM Apartments a WHERE a.area > :area"),
    @NamedQuery(name = "Apartments.findBySmallerArea", query = "SELECT a FROM Apartments a WHERE a.area < :area"),
    @NamedQuery(name = "Apartments.findByRangeArea", query = "SELECT a FROM Apartments a WHERE a.area >= :fromArea AND a.area <= :toArea"),
    @NamedQuery(name = "Apartments.findBySittingRoom", query = "SELECT a FROM Apartments a WHERE a.sittingRoom = :sittingRoom"),
    @NamedQuery(name = "Apartments.findByBedRoom", query = "SELECT a FROM Apartments a WHERE a.bedRoom = :bedRoom"),
    @NamedQuery(name = "Apartments.findByBathRoom", query = "SELECT a FROM Apartments a WHERE a.bathRoom = :bathRoom"),
    @NamedQuery(name = "Apartments.findByKitchen", query = "SELECT a FROM Apartments a WHERE a.kitchen = :kitchen"),
    @NamedQuery(name = "Apartments.findByToilet", query = "SELECT a FROM Apartments a WHERE a.toilet = :toilet"),
    @NamedQuery(name = "Apartments.getApartmentsOfFloor", query = "SELECT a FROM Apartments a WHERE a.floors = :floors"),
    @NamedQuery(name = "Apartments.getApartmentsOfType", query = "SELECT a FROM Apartments a WHERE a.apartmentTypes = :apartmentTypes"),
    @NamedQuery(name = "Apartments.findByOtherProperties", query = "SELECT a FROM Apartments a WHERE a.otherProperties = :otherProperties"),
    @NamedQuery(name = "Apartments.findByStatus", query = "SELECT a FROM Apartments a WHERE a.status = :status"),
    @NamedQuery(name = "Apartments.updateStatus", query = "UPDATE Apartments a SET a.status = 'false'  WHERE a.apartmentID = :apartmentID"),
    @NamedQuery(name = "Apartments.updateStatusTrue", query = "UPDATE Apartments a SET a.status = 'true'  WHERE a.apartmentID = :apartmentID"),
    @NamedQuery(name = "Apartments.findByapartmentTypes", query = "SELECT n FROM Apartments n WHERE n.apartmentTypes = :apartmentTypes")
})
public class Apartments implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "ApartmentID")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer apartmentID;
    @Basic(optional = false)
    @Column(name = "Area")
    private double area;
    @Column(name = "SittingRoom")
    private Integer sittingRoom;
    @Column(name = "BedRoom")
    private Integer bedRoom;
    @Column(name = "BathRoom")
    private Integer bathRoom;
    @Column(name = "Kitchen")
    private Integer kitchen;
    @Column(name = "Toilet")
    private Integer toilet;
    @Column(name = "OtherProperties")
    private String otherProperties;
    @Column(name = "Status")
    private Boolean status;
    @OneToOne(mappedBy = "apartments")
    private Contracts contracts;
    @OneToMany(mappedBy = "apartments")
    private List<Articles> articlesList;
    @JoinColumn(name = "FloorID", referencedColumnName = "FloorID")
    @ManyToOne
    private Floors floors;
    @JoinColumn(name = "ApartmentTypeID", referencedColumnName = "ApartmentTypeID")
    @ManyToOne
    private ApartmentTypes apartmentTypes;
    @OneToMany(mappedBy = "apartments")
    private List<ImageLists> imageListsList;

    public Apartments() {
    }

    public Apartments(Integer apartmentID) {
        this.apartmentID = apartmentID;
    }

    public Apartments(Integer apartmentID, double area) {
        this.apartmentID = apartmentID;
        this.area = area;
    }

    public Integer getApartmentID() {
        return apartmentID;
    }

    public void setApartmentID(Integer apartmentID) {
        this.apartmentID = apartmentID;
    }

    public double getArea() {
        return area;
    }

    public void setArea(double area) {
        this.area = area;
    }

    public Integer getSittingRoom() {
        return sittingRoom;
    }

    public void setSittingRoom(Integer sittingRoom) {
        this.sittingRoom = sittingRoom;
    }

    public Integer getBedRoom() {
        return bedRoom;
    }

    public void setBedRoom(Integer bedRoom) {
        this.bedRoom = bedRoom;
    }

    public Integer getBathRoom() {
        return bathRoom;
    }

    public void setBathRoom(Integer bathRoom) {
        this.bathRoom = bathRoom;
    }

    public Integer getKitchen() {
        return kitchen;
    }

    public void setKitchen(Integer kitchen) {
        this.kitchen = kitchen;
    }

    public Integer getToilet() {
        return toilet;
    }

    public void setToilet(Integer toilet) {
        this.toilet = toilet;
    }

    public String getOtherProperties() {
        return otherProperties;
    }

    public void setOtherProperties(String otherProperties) {
        this.otherProperties = otherProperties;
    }

    public Boolean getStatus() {
        return status;
    }

    public void setStatus(Boolean status) {
        this.status = status;
    }

    public Contracts getContracts() {
        return contracts;
    }

    public void setContracts(Contracts contracts) {
        this.contracts = contracts;
    }

    public List<Articles> getArticlesList() {
        return articlesList;
    }

    public void setArticlesList(List<Articles> articlesList) {
        this.articlesList = articlesList;
    }

    public Floors getFloors() {
        return floors;
    }

    public void setFloors(Floors floors) {
        this.floors = floors;
    }

    public ApartmentTypes getApartmentTypes() {
        return apartmentTypes;
    }

    public void setApartmentTypes(ApartmentTypes apartmentTypes) {
        this.apartmentTypes = apartmentTypes;
    }

    public List<ImageLists> getImageListsList() {
        return imageListsList;
    }

    public void setImageListsList(List<ImageLists> imageListsList) {
        this.imageListsList = imageListsList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (apartmentID != null ? apartmentID.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Apartments)) {
            return false;
        }
        Apartments other = (Apartments) object;
        if ((this.apartmentID == null && other.apartmentID != null) || (this.apartmentID != null && !this.apartmentID.equals(other.apartmentID))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "BeanInfo.Apartments[apartmentID=" + apartmentID + "]";
    }
}
