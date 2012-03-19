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
import org.hibernate.validator.constraints.NotEmpty;

/**
 *
 * @author Nhat Nguyen
 */
@Entity
@Table(name = "Articles")
@NamedQueries({
    @NamedQuery(name = "Articles.findAll", query = "SELECT a FROM Articles a"),
    @NamedQuery(name = "Articles.findByArticleID", query = "SELECT a FROM Articles a WHERE a.articleID = :articleID"),
    @NamedQuery(name = "Articles.findByArticleTitle", query = "SELECT a FROM Articles a WHERE a.articleTitle = :articleTitle"),
    @NamedQuery(name = "Articles.findByArticleContent", query = "SELECT a FROM Articles a WHERE a.articleContent = :articleContent"),
    @NamedQuery(name = "Articles.findByDateCreate", query = "SELECT a FROM Articles a WHERE a.dateCreate = :dateCreate"),
    @NamedQuery(name = "Articles.findByStatus", query = "SELECT a FROM Articles a WHERE a.status = :status")})
public class Articles implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "ArticleID")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer articleID;
    @Basic(optional = false)
    @Column(name = "ArticleTitle")
    @NotEmpty(message = "Title can't be empty")
    @Length(max = 300, message = "Title has maximum 300 charaters")
    private String articleTitle;
    @Basic(optional = false)
    @Column(name = "ArticleContent")
    @NotEmpty(message = "Content can't be empty")
    private String articleContent;
    @Basic(optional = false)
    @Column(name = "DateCreate")
    @Temporal(TemporalType.TIMESTAMP)
    private Date dateCreate;
    @Column(name = "Status")
    private Boolean status;
    @JoinColumn(name = "ApartmentID", referencedColumnName = "ApartmentID")
    @ManyToOne
    private Apartments apartments;
    @JoinColumn(name = "Username", referencedColumnName = "Username")
    @ManyToOne
    private Accounts accounts;

    public Articles() {
    }

    public Articles(Integer articleID) {
        this.articleID = articleID;
    }

    public Articles(Integer articleID, String articleTitle, String articleContent, Date dateCreate) {
        this.articleID = articleID;
        this.articleTitle = articleTitle;
        this.articleContent = articleContent;
        this.dateCreate = dateCreate;
    }

    public Integer getArticleID() {
        return articleID;
    }

    public void setArticleID(Integer articleID) {
        this.articleID = articleID;
    }

    public String getArticleTitle() {
        return articleTitle;
    }

    public void setArticleTitle(String articleTitle) {
        this.articleTitle = articleTitle;
    }

    public String getArticleContent() {
        return articleContent;
    }

    public void setArticleContent(String articleContent) {
        this.articleContent = articleContent;
    }

    public Date getDateCreate() {
        return dateCreate;
    }

    public void setDateCreate(Date dateCreate) {
        this.dateCreate = dateCreate;
    }

    public Boolean getStatus() {
        return status;
    }

    public void setStatus(Boolean status) {
        this.status = status;
    }

    public Apartments getApartments() {
        return apartments;
    }

    public void setApartments(Apartments apartments) {
        this.apartments = apartments;
    }

    public Accounts getAccounts() {
        return accounts;
    }

    public void setAccounts(Accounts accounts) {
        this.accounts = accounts;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (articleID != null ? articleID.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Articles)) {
            return false;
        }
        Articles other = (Articles) object;
        if ((this.articleID == null && other.articleID != null) || (this.articleID != null && !this.articleID.equals(other.articleID))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "BeanInfo.Articles[articleID=" + articleID + "]";
    }
}
