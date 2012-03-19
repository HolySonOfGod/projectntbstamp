/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package BeanCRUD;

import BeanInfo.ImageLists;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
/**
 *
 * @author Hung
 */
@Stateless
public class ImageListsFacade extends AbstractFacade<ImageLists> {
    @PersistenceContext(unitName = "eProjectNTB-ejbPU")
    private EntityManager em;

    protected EntityManager getEntityManager() {
        return em;
    }

    public ImageListsFacade() {
        super(ImageLists.class);
    }

    public int deleteImage(int listID){
        Query query = em.createNamedQuery("ImageLists.deleteImage");
        query.setParameter("listID",listID);
        return query.executeUpdate();
    }
}
