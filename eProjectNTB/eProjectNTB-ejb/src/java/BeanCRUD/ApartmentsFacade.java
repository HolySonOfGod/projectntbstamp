/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package BeanCRUD;

import BeanInfo.ApartmentTypes;
import BeanInfo.Apartments;
import BeanInfo.Floors;
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
public class ApartmentsFacade extends AbstractFacade<Apartments> {

    @PersistenceContext(unitName = "eProjectNTB-ejbPU")
    private EntityManager em;

    protected EntityManager getEntityManager() {
        return em;
    }

    public ApartmentsFacade() {
        super(Apartments.class);
    }

    //method to get apartments of the floor
    public List<Apartments> getApartmentOfFloor(Floors floor) {
        List<Apartments> apartmentList = new ArrayList();
        Query query = em.createNamedQuery("Apartments.getApartmentsOfFloor");
        query.setParameter("floors", floor);
        apartmentList = (List<Apartments>) query.getResultList();
        return apartmentList;
    }

    //method to get apartments of the apartment type
    public List<Apartments> getApartmentOfType(ApartmentTypes apartmentType) {
        List<Apartments> apartmentList = new ArrayList();
        Query query = em.createNamedQuery("Apartments.getApartmentsOfType");
        query.setParameter("apartmentTypes", apartmentType);
        apartmentList = (List<Apartments>) query.getResultList();
        return apartmentList;
    }

    public List<Apartments> getlistApartID(boolean status) {
        return this.em.createNamedQuery("Apartments.findByStatus").setParameter("status", status).getResultList();
    }

    public List<Apartments> findByApartmentTypeID(ApartmentTypes apartType) {
        Query q = em.createNamedQuery("Apartments.findByapartmentTypes");
        q.setParameter("apartmentTypes", apartType);
        return q.getResultList();
    }

    public List<Apartments> fibdByFloorsID(Floors floor) {
        Query q = em.createNamedQuery("Floors.findFloorByIDUser");
        q.setParameter("floorID", floor);
        return q.getResultList();
    }

    //method to update apartment status
    public void updateStatus(int apartmentID) {
        Query q = em.createNamedQuery("Apartments.updateStatus");
        q.setParameter("apartmentID", apartmentID);
        q.executeUpdate();
    }

    //method to update apartment status
    public void updateStatusTrue(int apartmentID) {
        Query q = em.createNamedQuery("Apartments.updateStatusTrue");
        q.setParameter("apartmentID", apartmentID);
        q.executeUpdate();
    }

    public List<Apartments> findByGreaterArea(double area) {
        Query q = em.createNamedQuery("Apartments.findByGreaterArea");
        q.setParameter("area", area);
        return q.getResultList();
    }

    public List<Apartments> findBySmallerArea(double area) {
        Query q = em.createNamedQuery("Apartments.findBySmallerArea");
        q.setParameter("area", area);
        return q.getResultList();
    }

    public List<Apartments> findByArea(double area) {
        Query q = em.createNamedQuery("Apartments.findByArea");
        q.setParameter("area", area);
        return q.getResultList();
    }

    public List<Apartments> findByRangeArea(double fromArea, double toArea) {
        Query q = em.createNamedQuery("Apartments.findByRangeArea");
        q.setParameter("fromArea", fromArea);
        q.setParameter("toArea", toArea);
        return q.getResultList();
    }
}
