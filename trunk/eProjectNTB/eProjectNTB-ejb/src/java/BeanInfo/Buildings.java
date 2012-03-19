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
@Table(name = "Buildings")
@NamedQueries({
    @NamedQuery(name = "Buildings.findAll", query = "SELECT b FROM Buildings b"),
    @NamedQuery(name = "Buildings.findByBuildingID", query = "SELECT b FROM Buildings b WHERE b.buildingID = :buildingID"),
    @NamedQuery(name = "Buildings.findByBuildingName", query = "SELECT b FROM Buildings b WHERE b.buildingName LIKE :buildingName"),
    @NamedQuery(name = "Buildings.findByArea", query = "SELECT b FROM Buildings b WHERE b.area = :area"),
    @NamedQuery(name = "Buildings.findByNumberOfFloor", query = "SELECT b FROM Buildings b WHERE b.numberOfFloor = :numberOfFloor"),
    @NamedQuery(name = "Buildings.findByDateOfCommencement", query = "SELECT b FROM Buildings b WHERE b.dateOfCommencement = :dateOfCommencement"),
    @NamedQuery(name = "Buildings.findByDateOfCompletion", query = "SELECT b FROM Buildings b WHERE b.dateOfCompletion = :dateOfCompletion"),
    @NamedQuery(name = "Buildings.findByStatus", query = "SELECT b FROM Buildings b WHERE b.status = :status")})
public class Buildings implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "BuildingID")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer buildingID;
    @Basic(optional = false)
    @Column(name = "BuildingName")
    @NotEmpty(message = "Building name can't be empty")
    @Length(max = 100, message = "Building name has maximum 100 characters")
    private String buildingName;
    @Basic(optional = false)
    @Column(name = "Area")
    @NotNull(message = "Please input building's area")
    private double area;
    @Basic(optional = false)
    @Column(name = "NumberOfFloor")
    @NotNull(message = "Please input number of floors of building")
    private int numberOfFloor;
    @Column(name = "DateOfCommencement")
    @Temporal(TemporalType.TIMESTAMP)
    private Date dateOfCommencement;
    @Column(name = "DateOfCompletion")
    @Temporal(TemporalType.TIMESTAMP)
    private Date dateOfCompletion;
    @Basic(optional = false)
    @Column(name = "Status")
    private String status;
    @OneToMany(mappedBy = "buildings")
    private List<Floors> floorsList;
    @JoinColumn(name = "LandID", referencedColumnName = "LandID")
    @ManyToOne
    private Lands lands;

    public Buildings() {
    }

    public Buildings(Integer buildingID) {
        this.buildingID = buildingID;
    }

    public Buildings(Integer buildingID, String buildingName, double area, int numberOfFloor, String status) {
        this.buildingID = buildingID;
        this.buildingName = buildingName;
        this.area = area;
        this.numberOfFloor = numberOfFloor;
        this.status = status;
    }

    public Integer getBuildingID() {
        return buildingID;
    }

    public void setBuildingID(Integer buildingID) {
        this.buildingID = buildingID;
    }

    public String getBuildingName() {
        return buildingName;
    }

    public void setBuildingName(String buildingName) {
        this.buildingName = buildingName;
    }

    public double getArea() {
        return area;
    }

    public void setArea(double area) {
        this.area = area;
    }

    public int getNumberOfFloor() {
        return numberOfFloor;
    }

    public void setNumberOfFloor(int numberOfFloor) {
        this.numberOfFloor = numberOfFloor;
    }

    public Date getDateOfCommencement() {
        return dateOfCommencement;
    }

    public void setDateOfCommencement(Date dateOfCommencement) {
        this.dateOfCommencement = dateOfCommencement;
    }

    public Date getDateOfCompletion() {
        return dateOfCompletion;
    }

    public void setDateOfCompletion(Date dateOfCompletion) {
        this.dateOfCompletion = dateOfCompletion;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public List<Floors> getFloorsList() {
        return floorsList;
    }

    public void setFloorsList(List<Floors> floorsList) {
        this.floorsList = floorsList;
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
        hash += (buildingID != null ? buildingID.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Buildings)) {
            return false;
        }
        Buildings other = (Buildings) object;
        if ((this.buildingID == null && other.buildingID != null) || (this.buildingID != null && !this.buildingID.equals(other.buildingID))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "BeanInfo.Buildings[buildingID=" + buildingID + "]";
    }
}
