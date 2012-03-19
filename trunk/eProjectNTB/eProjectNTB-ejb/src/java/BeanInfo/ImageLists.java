/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package BeanInfo;

import java.io.Serializable;
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
import org.hibernate.validator.constraints.NotEmpty;

/**
 *
 * @author Hung
 */
@Entity
@Table(name = "ImageLists")
@NamedQueries({
    @NamedQuery(name = "ImageLists.findAll", query = "SELECT i FROM ImageLists i"),
    @NamedQuery(name = "ImageLists.findByListID", query = "SELECT i FROM ImageLists i WHERE i.listID = :listID"),
    @NamedQuery(name = "ImageLists.deleteImage", query = "DELETE FROM ImageLists i WHERE i.listID = :listID"),
    @NamedQuery(name = "ImageLists.findByImageList", query = "SELECT i FROM ImageLists i WHERE i.imageList = :imageList")})
public class ImageLists implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "ListID")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer listID;
    @Basic(optional = false)
    @Column(name = "ImageList")
    @NotEmpty(message = "Please input the path to image list")
    private String imageList;
    @JoinColumn(name = "ApartmentID", referencedColumnName = "ApartmentID")
    @ManyToOne
    private Apartments apartments;

    public ImageLists() {
    }

    public ImageLists(Integer listID) {
        this.listID = listID;
    }

    public ImageLists(Integer listID, String imageList) {
        this.listID = listID;
        this.imageList = imageList;
    }

    public Integer getListID() {
        return listID;
    }

    public void setListID(Integer listID) {
        this.listID = listID;
    }

    public String getImageList() {
        return imageList;
    }

    public void setImageList(String imageList) {
        this.imageList = imageList;
    }

    public Apartments getApartments() {
        return apartments;
    }

    public void setApartments(Apartments apartments) {
        this.apartments = apartments;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (listID != null ? listID.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof ImageLists)) {
            return false;
        }
        ImageLists other = (ImageLists) object;
        if ((this.listID == null && other.listID != null) || (this.listID != null && !this.listID.equals(other.listID))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "BeanInfo.ImageLists[listID=" + listID + "]";
    }
}
