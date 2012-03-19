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
import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;

/**
 *
 * @author Nhat Nguyen
 */
@Entity
@Table(name = "Feedbacks")
@NamedQueries({
    @NamedQuery(name = "Feedbacks.findAll", query = "SELECT f FROM Feedbacks f"),
    @NamedQuery(name = "Feedbacks.findByFeedbackID", query = "SELECT f FROM Feedbacks f WHERE f.feedbackID = :feedbackID"),
    @NamedQuery(name = "Feedbacks.findByFeedbackSubject", query = "SELECT f FROM Feedbacks f WHERE f.feedbackSubject = :feedbackSubject"),
    @NamedQuery(name = "Feedbacks.findByFeedbackDetail", query = "SELECT f FROM Feedbacks f WHERE f.feedbackDetail = :feedbackDetail"),
    @NamedQuery(name = "Feedbacks.findByFeedbackEmail", query = "SELECT f FROM Feedbacks f WHERE f.feedbackEmail = :feedbackEmail"),
    @NamedQuery(name = "Feedbacks.findByFeedbackAnswer", query = "SELECT f FROM Feedbacks f WHERE f.feedbackAnswer = :feedbackAnswer")})
public class Feedbacks implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "FeedbackID")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer feedbackID;
    @Basic(optional = false)
    @Column(name = "FeedbackSubject")
    @NotEmpty(message = "Subject can't be empty")
    @Length(max = 100, message = "Subject has maximum 100 charaters")
    private String feedbackSubject;
    @Basic(optional = false)
    @Column(name = "FeedbackDetail")
    @NotEmpty(message = "Content can't be empty")
    private String feedbackDetail;
    @Basic(optional = false)
    @Column(name = "FeedbackEmail")
    @NotEmpty(message = "Email can't be empty")
    @Email(message="Invalid email (eg: yourname@email.com)")
    @Length(max=100,message="Email has maximum 100 characters")
    private String feedbackEmail;
    @Column(name = "FeedbackAnswer")
    private String feedbackAnswer;

    public Feedbacks() {
    }

    public Feedbacks(Integer feedbackID) {
        this.feedbackID = feedbackID;
    }

    public Feedbacks(Integer feedbackID, String feedbackSubject, String feedbackDetail, String feedbackEmail) {
        this.feedbackID = feedbackID;
        this.feedbackSubject = feedbackSubject;
        this.feedbackDetail = feedbackDetail;
        this.feedbackEmail = feedbackEmail;
    }

    public Integer getFeedbackID() {
        return feedbackID;
    }

    public void setFeedbackID(Integer feedbackID) {
        this.feedbackID = feedbackID;
    }

    public String getFeedbackSubject() {
        return feedbackSubject;
    }

    public void setFeedbackSubject(String feedbackSubject) {
        this.feedbackSubject = feedbackSubject;
    }

    public String getFeedbackDetail() {
        return feedbackDetail;
    }

    public void setFeedbackDetail(String feedbackDetail) {
        this.feedbackDetail = feedbackDetail;
    }

    public String getFeedbackEmail() {
        return feedbackEmail;
    }

    public void setFeedbackEmail(String feedbackEmail) {
        this.feedbackEmail = feedbackEmail;
    }

    public String getFeedbackAnswer() {
        return feedbackAnswer;
    }

    public void setFeedbackAnswer(String feedbackAnswer) {
        this.feedbackAnswer = feedbackAnswer;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (feedbackID != null ? feedbackID.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Feedbacks)) {
            return false;
        }
        Feedbacks other = (Feedbacks) object;
        if ((this.feedbackID == null && other.feedbackID != null) || (this.feedbackID != null && !this.feedbackID.equals(other.feedbackID))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "BeanInfo.Feedbacks[feedbackID=" + feedbackID + "]";
    }
}
