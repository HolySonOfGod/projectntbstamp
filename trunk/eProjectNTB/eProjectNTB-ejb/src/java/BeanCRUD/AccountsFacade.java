/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package BeanCRUD;

import BeanInfo.Accounts;
import BeanInfo.Roles;
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
public class AccountsFacade extends AbstractFacade<Accounts> {

    @PersistenceContext(unitName = "eProjectNTB-ejbPU")
    private EntityManager em;

    protected EntityManager getEntityManager() {
        return em;
    }

    public AccountsFacade() {
        super(Accounts.class);
    }

    /**
     * Get only one account to check data is true or not
     * @param username
     * @param password
     * @return
     */
    public List<Accounts> findToLogin(String username, String password) {
        Query q = em.createNamedQuery("Accounts.findToLogin");
        q.setParameter("username", username);
        q.setParameter("password", password);
        return q.getResultList();
    }

    /**
     * Get list accounts by criteria is account's first name
     * @param firstName
     * @return list accounts
     */
    public List<Accounts> findByFirstName(String firstName) {
        if (firstName == null || firstName.isEmpty()) {
            return this.findAll();
        } else {
            Query q = em.createNamedQuery("Accounts.findByFirstName");
            firstName = "%" + firstName + "%";
            q.setParameter("firstName", firstName);
            return q.getResultList();
        }
    }

    public List<Accounts> findToRecovery(String username, String email) {
        Query q = em.createNamedQuery("Accounts.findToRecovery");
        q.setParameter("username", username);
        q.setParameter("email", email);
        return q.getResultList();
    }

    public List<Accounts> findByUsername(String username) {
        Query q = em.createNamedQuery("Accounts.findByUsername");
        q.setParameter("username", username);
        return q.getResultList();
    }
    
    public List<Accounts> getAccountOfCustomer(Roles roles){
        Query query = em.createNamedQuery("Accounts.findContract");
       query.setParameter("roles", roles);
       return  query.getResultList();

    }
}
