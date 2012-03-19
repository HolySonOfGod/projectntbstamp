/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package BeanCRUD;

import BeanInfo.Locations;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author Nhat Nguyen
 */
@Stateless
public class LocationsFacade extends AbstractFacade<Locations> {
    @PersistenceContext(unitName = "eProjectNTB-ejbPU")
    private EntityManager em;

    protected EntityManager getEntityManager() {
        return em;
    }

    public LocationsFacade() {
        super(Locations.class);
    }

}
