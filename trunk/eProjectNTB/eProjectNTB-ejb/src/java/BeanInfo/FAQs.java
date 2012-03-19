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
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import org.hibernate.validator.constraints.NotEmpty;

/**
 *
 * @author Nhat Nguyen
 */
@Entity
@Table(name = "FAQs")
@NamedQueries({
    @NamedQuery(name = "FAQs.findAll", query = "SELECT f FROM FAQs f"),
    @NamedQuery(name = "FAQs.findByFAQsID", query = "SELECT f FROM FAQs f WHERE f.fAQsID = :fAQsID"),
    @NamedQuery(name = "FAQs.findByQuestion", query = "SELECT f FROM FAQs f WHERE f.question = :question"),
    @NamedQuery(name = "FAQs.findByAnswer", query = "SELECT f FROM FAQs f WHERE f.answer = :answer")})
public class FAQs implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "FAQsID")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer fAQsID;
    @Basic(optional = false)
    @Column(name = "Question")
    @NotEmpty(message = "Please input your question")
    private String question;
    @Column(name = "Answer")
    private String answer;

    public FAQs() {
    }

    public FAQs(Integer fAQsID) {
        this.fAQsID = fAQsID;
    }

    public FAQs(Integer fAQsID, String question) {
        this.fAQsID = fAQsID;
        this.question = question;
    }

    public Integer getFAQsID() {
        return fAQsID;
    }

    public void setFAQsID(Integer fAQsID) {
        this.fAQsID = fAQsID;
    }

    public String getQuestion() {
        return question;
    }

    public void setQuestion(String question) {
        this.question = question;
    }

    public String getAnswer() {
        return answer;
    }

    public void setAnswer(String answer) {
        this.answer = answer;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (fAQsID != null ? fAQsID.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof FAQs)) {
            return false;
        }
        FAQs other = (FAQs) object;
        if ((this.fAQsID == null && other.fAQsID != null) || (this.fAQsID != null && !this.fAQsID.equals(other.fAQsID))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "BeanInfo.FAQs[fAQsID=" + fAQsID + "]";
    }
}
