/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package BeanCRUD;

import BeanInfo.Accounts;
import BeanInfo.Contracts;
import BeanInfo.PaymentModes;
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
public class ContractsFacade extends AbstractFacade<Contracts> {

    @PersistenceContext(unitName = "eProjectNTB-ejbPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public ContractsFacade() {
        super(Contracts.class);
    }

    public int deleteContractID(int conTractlID) {
        Query query = em.createNamedQuery("Contracts.deleteContractsID");
        query.setParameter("contractID", conTractlID);
        return query.executeUpdate();
    }

    public List<Contracts> findByAccounts(Accounts accounts) {
        Query q = em.createNamedQuery("Contracts.findByAccounts");
        q.setParameter("accounts", accounts);
        return q.getResultList();
    }

    public List<Contracts> findByAccountID(int contractId) {
        Query q = em.createNamedQuery("Contracts.findByContractID");
        q.setParameter("contractID", contractId);
        return q.getResultList();
    }
}
