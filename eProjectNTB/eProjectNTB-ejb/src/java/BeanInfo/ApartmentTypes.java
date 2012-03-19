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
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;

/**
 *
 * @author Hung
 */
@Entity
@Table(name = "ApartmentTypes")
@NamedQueries({
    @NamedQuery(name = "ApartmentTypes.findAll", query = "SELECT a FROM ApartmentTypes a"),
    @NamedQuery(name = "ApartmentTypes.deleteATByATID", query = "DELETE FROM ApartmentTypes a WHERE a.apartmentTypeID = :apartmentTypeID"),
    @NamedQuery(name = "ApartmentTypes.findByApartmentTypeID", query = "SELECT a FROM ApartmentTypes a WHERE a.apartmentTypeID = :apartmentTypeID"),
    @NamedQuery(name = "ApartmentTypes.findByTypeName", query = "SELECT a FROM ApartmentTypes a WHERE a.typeName = :typeName"),
    @NamedQuery(name = "ApartmentTypes.findByDescription", query = "SELECT a FROM ApartmentTypes a WHERE a.description = :description")})
public class ApartmentTypes implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "ApartmentTypeID")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer apartmentTypeID;
    @Basic(optional = false)
    @Column(name = "TypeName")
    @Length(max = 100, message = "Apartment type has maximum 100 characters")
    private String typeName;
    @Basic(optional = false)
    @Column(name = "Description")
    @Length(max = 200, message = "Description has maximum 200 characters")
    private String description;
    @OneToMany(mappedBy = "apartmentTypes")
    private List<Apartments> apartmentsList;

    public ApartmentTypes() {
    }

    public ApartmentTypes(Integer apartmentTypeID) {
        this.apartmentTypeID = apartmentTypeID;
    }

    public ApartmentTypes(Integer apartmentTypeID, String typeName, String description) {
        this.apartmentTypeID = apartmentTypeID;
        this.typeName = typeName;
        this.description = description;
    }

    public Integer getApartmentTypeID() {
        return apartmentTypeID;
    }

    public void setApartmentTypeID(Integer apartmentTypeID) {
        this.apartmentTypeID = apartmentTypeID;
    }

    public String getTypeName() {
        return typeName;
    }

    public void setTypeName(String typeName) {
        this.typeName = typeName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public List<Apartments> getApartmentsList() {
        return apartmentsList;
    }

    public void setApartmentsList(List<Apartments> apartmentsList) {
        this.apartmentsList = apartmentsList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (apartmentTypeID != null ? apartmentTypeID.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof ApartmentTypes)) {
            return false;
        }
        ApartmentTypes other = (ApartmentTypes) object;
        if ((this.apartmentTypeID == null && other.apartmentTypeID != null) || (this.apartmentTypeID != null && !this.apartmentTypeID.equals(other.apartmentTypeID))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "BeanInfo.ApartmentTypes[apartmentTypeID=" + apartmentTypeID + "]";
    }
}
