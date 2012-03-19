/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package ntb.bean;

import BeanCRUD.FeedbacksFacade;
import BeanInfo.Feedbacks;
import Helpers.Messages;
import Helpers.ThaoTacSession;
import Helpers.sendEmail;
import java.util.List;
import javax.ejb.EJB;
import javax.faces.application.FacesMessage;

/**
 *
 * @author Nhat Nguyen
 */
public class FeedbackBean {

    @EJB
    private FeedbacksFacade feedbacksFacade;
    private Feedbacks feedback = new Feedbacks();
    private int errors = 1;

    /** Creates a new instance of FeedbackBean */
    public FeedbackBean() {
    }

    public List<Feedbacks> getListFeedback() {
        return this.feedbacksFacade.findAll();
    }

    public void contactus() {
        sendEmail.sendMail_contact(getFeedback().getFeedbackSubject(),getFeedback().getFeedbackDetail(),getFeedback().getFeedbackEmail());
        this.setErrors(0);
    }
    public void createFeedback() {
        this.feedbacksFacade.create(getFeedback());
        Messages.taoTB(FacesMessage.SEVERITY_INFO, "New feedback have been created successully", "Finish!");
        this.setErrors(0);
    }

    public void updateFeedback() {
        this.getFeedback().setFeedbackID(Integer.parseInt(ThaoTacSession.layXuong("feedbackID").toString()));
        ThaoTacSession.xoaGT("feedbackID");
        sendEmail.sendMail_FeedBack(getFeedback().getFeedbackSubject(),getFeedback().getFeedbackDetail(),getFeedback().getFeedbackAnswer(),getFeedback().getFeedbackEmail());
        this.feedbacksFacade.edit(getFeedback());
        Messages.taoTB(FacesMessage.SEVERITY_INFO, "The feedback updated successfully", "Finish!");
        this.setErrors(0);
    }

    public void deleteFeedback() {
        this.setFeedback((Feedbacks) ThaoTacSession.layXuong("feedback"));
        ThaoTacSession.xoaGT("feedback");
        this.feedbacksFacade.remove(getFeedback());
        Messages.taoTB(FacesMessage.SEVERITY_INFO, "You deleted feedback", "Finish!");
        this.setErrors(0);
    }

    public void setFeedbackToSession() {
        ThaoTacSession.duaGTLenSession("feedback", this.feedback);
    }

    public void setFeedbackIDToSession() {
        ThaoTacSession.duaGTLenSession("feedbackID", this.feedback.getFeedbackID());
    }

    /**
     * @return the feedback
     */
    public Feedbacks getFeedback() {
        return feedback;
    }

    /**
     * @param feeback the feedback to set
     */
    public void setFeedback(Feedbacks feedback) {
        this.feedback = feedback;
    }

    /**
     * @return the errors
     */
    public int getErrors() {
        return errors;
    }

    /**
     * @param errors the errors to set
     */
    public void setErrors(int errors) {
        this.errors = errors;
    }
}
