/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package BeanCRUD;

import BeanInfo.Lands;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

/**
 *
 * @author Nhat Nguyen
 */
@Stateless
public class LandsFacade extends AbstractFacade<Lands> {

    @PersistenceContext(unitName = "eProjectNTB-ejbPU")
    private EntityManager em;

    protected EntityManager getEntityManager() {
        return em;
    }

    public LandsFacade() {
        super(Lands.class);
    }

    /**
     * Get list lands by criteria is land's location
     * @param firstName
     * @return list lands
     */
    public List<Lands> findByLocationID(int locationID) {
        if (locationID == 0) {
            return this.findAll();
        } else {
            String sql = "SELECT * FROM Lands AS la,Locations AS lo WHERE la.locationID=lo.locationID AND la.locationID=" + locationID + "";
            Query q = null;
            try {
                q = em.createNativeQuery(sql, Lands.class);
            } catch (Exception e) {
                System.out.println(e.toString());
            }
            return q.getResultList();
        }
    }
}
