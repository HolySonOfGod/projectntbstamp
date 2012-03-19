/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package BeanCRUD;

import BeanInfo.ApartmentTypes;
import java.util.ArrayList;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

/**
 *
 * @author Hung
 */
@Stateless
public class ApartmentTypesFacade extends AbstractFacade<ApartmentTypes> {

    @PersistenceContext(unitName = "eProjectNTB-ejbPU")
    private EntityManager em;

    protected EntityManager getEntityManager() {
        return em;
    }

    public ApartmentTypesFacade() {
        super(ApartmentTypes.class);
    }

    public int deleteApartmentType(int apartmentTypeID) {
        Query query = em.createNamedQuery("ApartmentTypes.deleteATByATID");
        query.setParameter("apartmentTypeID", apartmentTypeID);
        return query.executeUpdate();
    }

    public ApartmentTypes getApartmentTypeByName(String apartmentTypeName) {
        ApartmentTypes apartmentType = new ApartmentTypes();
        try {
            Query query = em.createNamedQuery("ApartmentTypes.findByTypeName");
            query.setParameter("typeName", apartmentTypeName);
            apartmentType = (ApartmentTypes) query.getResultList().get(0);
        } catch (Exception e) {
        }
        return apartmentType;
    }
}
