/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package BeanCRUD;

import BeanInfo.FAQs;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author Nhat Nguyen
 */
@Stateless
public class FAQsFacade extends AbstractFacade<FAQs> {
    @PersistenceContext(unitName = "eProjectNTB-ejbPU")
    private EntityManager em;

    protected EntityManager getEntityManager() {
        return em;
    }

    public FAQsFacade() {
        super(FAQs.class);
    }

}
