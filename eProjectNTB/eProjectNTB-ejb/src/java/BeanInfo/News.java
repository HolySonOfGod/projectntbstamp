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
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;

/**
 *
 * @author Nhat Nguyen
 */
@Entity
@Table(name = "News")
@NamedQueries({
    @NamedQuery(name = "News.findAll", query = "SELECT n FROM News n ORDER BY n.newsID DESC"),
    @NamedQuery(name = "News.findByNewsID", query = "SELECT n FROM News n WHERE n.newsID = :newsID"),
    @NamedQuery(name = "News.findByNewsTitle", query = "SELECT n FROM News n WHERE n.newsTitle = :newsTitle"),
    @NamedQuery(name = "News.findByNewsQuote", query = "SELECT n FROM News n WHERE n.newsQuote = :newsQuote"),
    @NamedQuery(name = "News.findByNewsContent", query = "SELECT n FROM News n WHERE n.newsContent = :newsContent"),
    @NamedQuery(name = "News.findByNewsImage", query = "SELECT n FROM News n WHERE n.newsImage = :newsImage"),
    @NamedQuery(name = "News.findByStatus", query = "SELECT n FROM News n WHERE n.status = :status"),
    @NamedQuery(name = "News.findByNewsType", query = "SELECT n FROM News n WHERE n.newsTypes = :newsTypes ORDER BY n.newsID DESC")
})
public class News implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "NewsID")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer newsID;
    @Column(name = "NewsTitle")
    @NotEmpty(message = "Please input news title")
    @Length(max = 200, message = "News title has maximum 200 characters")
    private String newsTitle;
    @Basic(optional = false)
    @Column(name = "NewsQuote")
    @NotEmpty(message = "Please input news quote")
    //@Length(message = "Quote has maximum 500 characters")
    private String newsQuote;
    @Basic(optional = false)
    @Column(name = "NewsContent")
    @NotEmpty(message = "Please input news content")
    //@Length(message = "News content has maximum 10000 characters")
    private String newsContent;
    @Column(name = "NewsImage")
    @NotEmpty(message = "Please input path contain image")
    @Length(max = 200, message = "News title has maximum 200 characters")
    private String newsImage;
    @Column(name = "Status")
    private Boolean status;
    @JoinColumn(name = "NewsTypeID", referencedColumnName = "NewsTypeID")
    @ManyToOne
    private NewsTypes newsTypes;

    public News() {
    }

    public News(Integer newsID) {
        this.newsID = newsID;
    }

    public News(Integer newsID, String newsQuote, String newsContent) {
        this.newsID = newsID;
        this.newsQuote = newsQuote;
        this.newsContent = newsContent;
    }

    public Integer getNewsID() {
        return newsID;
    }

    public void setNewsID(Integer newsID) {
        this.newsID = newsID;
    }

    public String getNewsTitle() {
        return newsTitle;
    }

    public void setNewsTitle(String newsTitle) {
        this.newsTitle = newsTitle;
    }

    public String getNewsQuote() {
        return newsQuote;
    }

    public void setNewsQuote(String newsQuote) {
        this.newsQuote = newsQuote;
    }

    public String getNewsContent() {
        return newsContent;
    }

    public void setNewsContent(String newsContent) {
        this.newsContent = newsContent;
    }

    public String getNewsImage() {
        return newsImage;
    }

    public void setNewsImage(String newsImage) {
        this.newsImage = newsImage;
    }

    public Boolean getStatus() {
        return status;
    }

    public void setStatus(Boolean status) {
        this.status = status;
    }

    public NewsTypes getNewsTypes() {
        return newsTypes;
    }

    public void setNewsTypes(NewsTypes newsTypes) {
        this.newsTypes = newsTypes;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (newsID != null ? newsID.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof News)) {
            return false;
        }
        News other = (News) object;
        if ((this.newsID == null && other.newsID != null) || (this.newsID != null && !this.newsID.equals(other.newsID))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "BeanInfo.News[newsID=" + newsID + "]";
    }
}
