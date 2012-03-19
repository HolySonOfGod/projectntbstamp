/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package BeanCRUD;

import BeanInfo.NewsTypes;
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
public class NewsTypesFacade extends AbstractFacade<NewsTypes> {
    @PersistenceContext(unitName = "eProjectNTB-ejbPU")
    private EntityManager em;

    protected EntityManager getEntityManager() {
        return em;
    }

    public NewsTypesFacade() {
        super(NewsTypes.class);
    }

    public List<NewsTypes> findByNewsTypeID(NewsTypes newsType) {
        Query q = em.createNamedQuery("News.findByNewsTypeID");
        q.setParameter("newsTypeID", newsType);
        return q.getResultList();
    }

}
