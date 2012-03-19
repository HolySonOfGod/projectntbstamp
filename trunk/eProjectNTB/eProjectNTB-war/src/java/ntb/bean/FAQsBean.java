/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package ntb.bean;
import BeanCRUD.FAQsFacade;
import BeanInfo.FAQs;
import Helpers.Messages;
import Helpers.ThaoTacSession;
import java.util.List;
import javax.ejb.EJB;
import javax.faces.application.FacesMessage;

/**
 *
 * @author Nhat Nguyen
 */
public class FAQsBean {

    @EJB
    private FAQsFacade faqsFacade;
    private FAQs faq = new FAQs();
    private int errors = 1;
    /** Creates a new instance of FAQsBean */
    public FAQsBean() {
    }

    public List<FAQs> getListFAQ() {
        return this.faqsFacade.findAll();
    }

    public void setFAQToSession() {
        ThaoTacSession.duaGTLenSession("FAQs", this.faq);
    }

    public void setFAQIDToSession() {
        ThaoTacSession.duaGTLenSession("FAQsID", this.faq.getFAQsID());
    }
    
    public void createFAQ() {
        this.faqsFacade.create(getFAQ());
        Messages.taoTB(FacesMessage.SEVERITY_INFO, "New FAQ have been created successully", "Finish!");
        this.setErrors(0);
    }

    public void updateFAQ() {
        this.getFAQ().setFAQsID(Integer.parseInt(ThaoTacSession.layXuong("FAQsID").toString()));
        ThaoTacSession.xoaGT("FAQsID");
        this.faqsFacade.edit(getFAQ());
        Messages.taoTB(FacesMessage.SEVERITY_INFO, "The FAQ updated successfully", "Finish!");
        this.setErrors(0);
    }

    public void deleteFAQ() {
        this.setFAQ((FAQs) ThaoTacSession.layXuong("FAQs"));
        ThaoTacSession.xoaGT("FAQs");
        this.faqsFacade.remove(getFAQ());
        Messages.taoTB(FacesMessage.SEVERITY_INFO, "You deleted FAQ", "Finish!");
        this.setErrors(0);
    }
    

    /**
     * @return the faq
     */
    public FAQs getFAQ() {
        return faq;
    }

    /**
     * @param faq the faq to set
     */
    public void setFAQ(FAQs faq) {
        this.faq = faq;
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
