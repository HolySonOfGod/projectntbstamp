/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package BeanCRUD;

import BeanInfo.Permits;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author Nhat Nguyen
 */
@Stateless
public class PermitsFacade extends AbstractFacade<Permits> {
    @PersistenceContext(unitName = "eProjectNTB-ejbPU")
    private EntityManager em;

    protected EntityManager getEntityManager() {
        return em;
    }

    public PermitsFacade() {
        super(Permits.class);
    }

}
