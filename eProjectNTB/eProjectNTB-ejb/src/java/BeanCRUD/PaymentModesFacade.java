/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package BeanCRUD;

import BeanInfo.PaymentModes;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

/**
 *
 * @author phamdoan
 */
@Stateless
public class PaymentModesFacade extends AbstractFacade<PaymentModes> {

    @PersistenceContext(unitName = "eProjectNTB-ejbPU")
    private EntityManager em;

    protected EntityManager getEntityManager() {
        return em;
    }

    public PaymentModesFacade() {
        super(PaymentModes.class);
    }

    public boolean checkName(String name) {
        int total = 0;

        Query q = em.createNamedQuery("PaymentModes.findByPaymentModeName");
        q.setParameter("paymentModeName", name);
        total = q.getResultList().size();
        if (total > 0) {
            return false;
        }
        return true;
    }

    public int deletePaymentMode(int paymentModeID) {
        Query query = em.createNamedQuery("PaymentModes.deletePMByID");
        query.setParameter("paymentModeID", paymentModeID);
        return query.executeUpdate();
    }
}
