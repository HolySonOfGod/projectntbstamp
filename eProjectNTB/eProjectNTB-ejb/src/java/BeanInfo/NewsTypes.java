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
 * @author Nhat Nguyen
 */
@Entity
@Table(name = "NewsTypes")
@NamedQueries({
    @NamedQuery(name = "NewsTypes.findAll", query = "SELECT n FROM NewsTypes n"),
    @NamedQuery(name = "NewsTypes.findByNewsTypeID", query = "SELECT n FROM NewsTypes n WHERE n.newsTypeID = :newsTypeID"),
    @NamedQuery(name = "NewsTypes.findByTypeName", query = "SELECT n FROM NewsTypes n WHERE n.typeName = :typeName")})
public class NewsTypes implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "NewsTypeID")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer newsTypeID;
    @Column(name = "TypeName")
    @NotEmpty(message = "News type name can't be empty")
    @Length(max = 100, message = "News type name has maximum 100 characters")
    private String typeName;
    @OneToMany(mappedBy = "newsTypes")
    private List<News> newsList;

    public NewsTypes() {
    }

    public NewsTypes(Integer newsTypeID) {
        this.newsTypeID = newsTypeID;
    }

    public Integer getNewsTypeID() {
        return newsTypeID;
    }

    public void setNewsTypeID(Integer newsTypeID) {
        this.newsTypeID = newsTypeID;
    }

    public String getTypeName() {
        return typeName;
    }

    public void setTypeName(String typeName) {
        this.typeName = typeName;
    }

    public List<News> getNewsList() {
        return newsList;
    }

    public void setNewsList(List<News> newsList) {
        this.newsList = newsList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (newsTypeID != null ? newsTypeID.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof NewsTypes)) {
            return false;
        }
        NewsTypes other = (NewsTypes) object;
        if ((this.newsTypeID == null && other.newsTypeID != null) || (this.newsTypeID != null && !this.newsTypeID.equals(other.newsTypeID))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "BeanInfo.NewsTypes[newsTypeID=" + newsTypeID + "]";
    }
}
