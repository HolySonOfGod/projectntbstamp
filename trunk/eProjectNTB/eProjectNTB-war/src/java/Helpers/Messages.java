/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package Helpers;

import javax.faces.application.FacesMessage;
import javax.faces.application.FacesMessage.Severity;
import javax.faces.context.FacesContext;

/**
 *
 * @author PEHA
 */
public class Messages {
    public static void taoTB(Severity s, String tieuDe, String noiDung){
        FacesContext context=FacesContext.getCurrentInstance();
        context.addMessage(null, new FacesMessage(s, tieuDe, noiDung));
    }

}
