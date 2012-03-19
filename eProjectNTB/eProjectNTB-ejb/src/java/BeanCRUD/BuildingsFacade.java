/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package BeanCRUD;

import BeanInfo.Buildings;
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
public class BuildingsFacade extends AbstractFacade<Buildings> {

    @PersistenceContext(unitName = "eProjectNTB-ejbPU")
    private EntityManager em;

    protected EntityManager getEntityManager() {
        return em;
    }

    public BuildingsFacade() {
        super(Buildings.class);
    }

    /**
     * Get list buildings by criteria is building's name
     * @param buildingName
     * @return list buildings
     */
    public List<Buildings> findByBuildingName(String buildingName) {
        if (buildingName == null || buildingName.isEmpty()) {
            return this.findAll();
        } else {
            Query q = em.createNamedQuery("Buildings.findByBuildingName");
            buildingName = "%" + buildingName + "%";
            q.setParameter("buildingName", buildingName);
            return q.getResultList();
        }
    }

    /**
     *  Get list buildings by criteria is building's id
     * @param buildID
     * @return
     */
    public List<Buildings> findByBuldID(Integer buildID) {
        return this.em.createNamedQuery("Buildings.findByBuildingID").setParameter("buildingID", buildID).getResultList();
    }

    public Buildings getBuildingByID(int buildingID) {
        Buildings b;
        Query query = em.createNamedQuery("Buildings.findByBuildingID");
        query.setParameter("buildingID", buildingID);
        b = (Buildings) query.getResultList().get(0);
        return b;
    }

    public Buildings getBuildingByBuildingName(String buildingName) {

        Buildings b = new Buildings();
        Query query = em.createNamedQuery("Buildings.findByBuildingName");
        query.setParameter("buildingName", buildingName);
        try {
            b = (Buildings) (query.getResultList().get(0));
        } catch (Exception e) {
        }
        return b;

    }

    
}
