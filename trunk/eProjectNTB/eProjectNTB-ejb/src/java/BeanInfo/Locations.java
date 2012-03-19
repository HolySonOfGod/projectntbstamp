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
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

/**
 *
 * @author Nhat Nguyen
 */
@Entity
@Table(name = "Locations")
@NamedQueries({
    @NamedQuery(name = "Locations.findAll", query = "SELECT l FROM Locations l"),
    @NamedQuery(name = "Locations.findByLocationID", query = "SELECT l FROM Locations l WHERE l.locationID = :locationID"),
    @NamedQuery(name = "Locations.findByCityName", query = "SELECT l FROM Locations l WHERE l.cityName = :cityName"),
    @NamedQuery(name = "Locations.findByConstructPermitCost", query = "SELECT l FROM Locations l WHERE l.constructPermitCost = :constructPermitCost"),
    @NamedQuery(name = "Locations.findByOccupancyPermitCost", query = "SELECT l FROM Locations l WHERE l.occupancyPermitCost = :occupancyPermitCost")})
public class Locations implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "LocationID")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer locationID;
    @Basic(optional = false)
    @Column(name = "CityName")
    @NotNull(message = "City name can't be empty")
    @Size(max = 100, message = "City name has maximum 100 characters")
    private String cityName;
    @Basic(optional = false)
    @Column(name = "ConstructPermitCost")
    @NotNull(message = "Construct permit cost can't be empty")
    private double constructPermitCost;
    @Basic(optional = false)
    @Column(name = "OccupancyPermitCost")
    @NotNull(message = "Occupancy permit cost can't be empty")
    private double occupancyPermitCost;
    @JoinColumn(name = "CountryID", referencedColumnName = "CountryID")
    @ManyToOne
    private Countries countries;
    @OneToMany(mappedBy = "locations")
    private List<Lands> landsList;

    public Locations() {
    }

    public Locations(Integer locationID) {
        this.locationID = locationID;
    }

    public Locations(Integer locationID, String cityName, double constructPermitCost, double occupancyPermitCost) {
        this.locationID = locationID;
        this.cityName = cityName;
        this.constructPermitCost = constructPermitCost;
        this.occupancyPermitCost = occupancyPermitCost;
    }

    public Integer getLocationID() {
        return locationID;
    }

    public void setLocationID(Integer locationID) {
        this.locationID = locationID;
    }

    public String getCityName() {
        return cityName;
    }

    public void setCityName(String cityName) {
        this.cityName = cityName;
    }

    public double getConstructPermitCost() {
        return constructPermitCost;
    }

    public void setConstructPermitCost(double constructPermitCost) {
        this.constructPermitCost = constructPermitCost;
    }

    public double getOccupancyPermitCost() {
        return occupancyPermitCost;
    }

    public void setOccupancyPermitCost(double occupancyPermitCost) {
        this.occupancyPermitCost = occupancyPermitCost;
    }

    public Countries getCountries() {
        return countries;
    }

    public void setCountries(Countries countries) {
        this.countries = countries;
    }

    public List<Lands> getLandsList() {
        return landsList;
    }

    public void setLandsList(List<Lands> landsList) {
        this.landsList = landsList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (locationID != null ? locationID.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Locations)) {
            return false;
        }
        Locations other = (Locations) object;
        if ((this.locationID == null && other.locationID != null) || (this.locationID != null && !this.locationID.equals(other.locationID))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "BeanInfo.Locations[locationID=" + locationID + "]";
    }
}
