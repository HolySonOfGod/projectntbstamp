/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package ntb.bean;
import BeanCRUD.NewsTypesFacade;
import BeanInfo.NewsTypes;
import Helpers.Messages;
import Helpers.ThaoTacSession;
import java.util.List;
import javax.ejb.EJB;
import javax.faces.application.FacesMessage;

/**
 *
 * @author Nhat Nguyen
 */
public class NewsTypeBean {

    @EJB
    private NewsTypesFacade newsTypesFacade;
    private NewsTypes newsType = new NewsTypes();
    private int errors = 1;
    /** Creates a new instance of NewsTypeBean */
    public NewsTypeBean() {
    }

    public List<NewsTypes> getListNewsType() {
        return this.newsTypesFacade.findAll();
    }

    public void createNewsType() {
        this.newsTypesFacade.create(getNewsType());
        Messages.taoTB(FacesMessage.SEVERITY_INFO, "New news type '" + getNewsType().getTypeName()
                + "' have been created successully", "Finish!");
        this.setErrors(0);
    }

    public void updateNewsType() {
        this.getNewsType().setNewsTypeID(Integer.parseInt(ThaoTacSession.layXuong("newsTypeID").toString()));
        ThaoTacSession.xoaGT("newsTypeID");
        this.newsTypesFacade.edit(getNewsType());
        Messages.taoTB(FacesMessage.SEVERITY_INFO, "The news type '" + getNewsType().getTypeName()
                + "' updated successfully", "Finish!");
        this.setErrors(0);
    }

    public void deleteNewsType() {
        this.setNewsType((NewsTypes) ThaoTacSession.layXuong("newsType"));
        ThaoTacSession.xoaGT("newsType");
        this.newsTypesFacade.remove(getNewsType());
        Messages.taoTB(FacesMessage.SEVERITY_INFO, "You deleted NewsType '" + getNewsType().getTypeName() + "'", "Finish!");
        this.setErrors(0);
    }

    public void setNewsTypeToSession() {
        ThaoTacSession.duaGTLenSession("newsType", this.newsType);
    }

    public void setNewsTypeIDToSession() {
        ThaoTacSession.duaGTLenSession("newsTypeID", this.newsType.getNewsTypeID());
    }


    /**
     * @return the newsType
     */
    public NewsTypes getNewsType() {
        return newsType;
    }

    /**
     * @param newsType the newsType to set
     */
    public void setNewsType(NewsTypes newsType) {
        this.newsType = newsType;
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
