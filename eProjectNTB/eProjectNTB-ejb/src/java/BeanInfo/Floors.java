/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package BeanInfo;

import BeanCRUD.FloorsFacade;
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
import javax.persistence.Table;
import javax.validation.constraints.*;

/**
 *
 * @author Hung
 */
@Entity
@Table(name = "Floors")
@NamedQueries({
    @NamedQuery(name = "Floors.findAll", query = "SELECT f FROM Floors f"),
    @NamedQuery(name = "Floors.findByBuildingID", query = "SELECT f FROM Floors f WHERE f.buildings = :buildings"),
    @NamedQuery(name = "Floors.findByFloorID", query = "SELECT f FROM Floors f WHERE f.floorID = :floorID"),
    @NamedQuery(name = "Floors.findByFloorNumber", query = "SELECT f FROM Floors f WHERE f.floorNumber = :floorNumber"),
    @NamedQuery(name = "Floors.findByNumberOfApartment", query = "SELECT f FROM Floors f WHERE f.numberOfApartment = :numberOfApartment"),
    @NamedQuery(name = "Floors.findByPrice", query = "SELECT f FROM Floors f WHERE f.price = :price"),
    @NamedQuery(name = "Floors.findByGreaterPrice", query = "SELECT f FROM Floors f WHERE f.price > :price"),
    @NamedQuery(name = "Floors.findBySmallerPrice", query = "SELECT f FROM Floors f WHERE f.price < :price"),
    @NamedQuery(name = "Floors.findByRangePrice", query = "SELECT f FROM Floors f WHERE f.price >= :fromPrice AND f.price <= :toPrice"),
    @NamedQuery(name = "Floors.findByGreaterNOA", query = "SELECT f FROM Floors f WHERE f.numberOfApartment > :numberOfApartment"),
    @NamedQuery(name = "Floors.deleteFloorByID", query = "DELETE FROM Floors f WHERE f.floorID = :floorID")
    })

public class Floors implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "FloorID")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer floorID;
    @Basic(optional = false)
    @Column(name = "FloorNumber")
    @Min(value = 1)
    private int floorNumber;
    @Basic(optional = false)
    @Column(name = "NumberOfApartment")
    @Min(value = 1)
    private int numberOfApartment;
    @Basic(optional = false)
    @Column(name = "Price")
    @Min(value = 1)
    private double price;
    @JoinColumn(name = "BuildingID", referencedColumnName = "BuildingID")
    @ManyToOne
    private Buildings buildings;
    @OneToMany(mappedBy = "floors")
    private List<Apartments> apartmentsList;

    public Floors() {
    }

    public Floors(Integer floorID) {
        this.floorID = floorID;
    }

    public Floors(Integer floorID, int floorNumber, int numberOfApartment, double price) {
        this.floorID = floorID;
        this.floorNumber = floorNumber;
        this.numberOfApartment = numberOfApartment;
        this.price = price;

    }

    public Integer getFloorID() {
        return floorID;
    }

    public void setFloorID(Integer floorID) {
        this.floorID = floorID;
    }

    public int getFloorNumber() {
        return floorNumber;
    }

    public void setFloorNumber(int floorNumber) {
        this.floorNumber = floorNumber;
    }

    public int getNumberOfApartment() {
        return numberOfApartment;
    }

    public void setNumberOfApartment(int numberOfApartment) {
        this.numberOfApartment = numberOfApartment;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public Buildings getBuildings() {
        return buildings;
    }

    public void setBuildings(Buildings buildings) {
        this.buildings = buildings;
    }

    public List<Apartments> getApartmentsList() {
        return apartmentsList;
    }

    public void setApartmentsList(List<Apartments> apartmentsList) {
        this.apartmentsList = apartmentsList;
    }

    @Override
    public int hashCode() {
        return floorID != null ? this.getClass().hashCode() + floorID.hashCode() : super.hashCode();
    }
    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set

      if (!(object instanceof Floors)) {
            return false;
        }
        Floors other = (Floors) object;
        this.setFloorID(other.getFloorID());
        if ((this.floorID == null && other.floorID != null) || (this.floorID != null && !this.floorID.equals(other.floorID))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "BeanInfo.Floors[floorID=" + floorID + "]";
    }
}
