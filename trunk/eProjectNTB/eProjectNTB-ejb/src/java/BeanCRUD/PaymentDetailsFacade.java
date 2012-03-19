/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package BeanCRUD;

import BeanInfo.Contracts;
import BeanInfo.PaymentDetails;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

/**
 *
 * @author phamdoan
 */
@Stateless
public class PaymentDetailsFacade extends AbstractFacade<PaymentDetails> {

    @PersistenceContext(unitName = "eProjectNTB-ejbPU")
    private EntityManager em;

    protected EntityManager getEntityManager() {
        return em;
    }

    public PaymentDetailsFacade() {
        super(PaymentDetails.class);
    }

    public int deletePaymentDetailID(int paymentDetailID) {
        Query query = em.createNamedQuery("PaymentDetails.deletePaymentDetailID");
        query.setParameter("paymentDetailID", paymentDetailID);
        return query.executeUpdate();
    }
    
    public List<PaymentDetails> getPaymentOfContract(Contracts contract) {
        Query query = em.createNamedQuery("PaymentDetails.findByContract");
        query.setParameter("contracts", contract);
        return query.getResultList();
    }

}
