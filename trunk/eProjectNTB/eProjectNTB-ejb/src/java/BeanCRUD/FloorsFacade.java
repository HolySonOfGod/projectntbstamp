/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package BeanCRUD;

import BeanInfo.Buildings;
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
public class FloorsFacade extends AbstractFacade<Floors> {
    @PersistenceContext(unitName = "eProjectNTB-ejbPU")
    private EntityManager em;

    protected EntityManager getEntityManager() {
        return em;
    }

    public FloorsFacade() {
        super(Floors.class);
    }
    
    public Floors getFloor(int floorID){
        Floors f;
        Query query = em.createNamedQuery("Floors.findByFloorID");
        query.setParameter("floorID",floorID);
        f = (Floors) query.getResultList().get(0);
        return f;
    }

    //method for deleting floor
    public int deleteFloor(int floorID){
        Query query = em.createNamedQuery("Floors.deleteFloorByID");
        query.setParameter("floorID",floorID);
        return query.executeUpdate();
    }

    //method to get floors of the building
    public List<Floors> getFloorOfBuilding(Buildings building) {
        List<Floors> floorList = new ArrayList();
        Query query = em.createNamedQuery("Floors.findByBuildingID");
        query.setParameter("buildings",building);
        floorList = (List<Floors>) query.getResultList();
        return floorList;
    }

    //method to get floors by number
     public List<Floors> getFloorByNumber(int floorNumber) {
        List<Floors> floorList = new ArrayList();
        Query query = em.createNamedQuery("Floors.findByFloorNumber");
        query.setParameter("floorNumber",floorNumber);
        floorList = (List<Floors>) query.getResultList();
        return floorList;
    }

     //method to get floors by number of apartments
      public List<Floors> getFloorByNOA(int NOA) {
        List<Floors> floorList = new ArrayList();
        Query query = em.createNamedQuery("Floors.findByNumberOfApartment");
        query.setParameter("numberOfApartment",NOA);
        floorList = (List<Floors>) query.getResultList();
        return floorList;
    }

      //method to get floors by price
       public List<Floors> getFloorByPrice(double price) {
        List<Floors> floorList = new ArrayList();
        Query query = em.createNamedQuery("Floors.findByPrice");
        query.setParameter("price",price);
        floorList = (List<Floors>) query.getResultList();
        return floorList;
    }

       //method to get floors by price
       public List<Floors> findByGreaterPrice(double price) {
        List<Floors> floorList = new ArrayList();
        Query query = em.createNamedQuery("Floors.findByGreaterPrice");
        query.setParameter("price",price);
        floorList = (List<Floors>) query.getResultList();
        return floorList;
    }

       //method to get floors by price
    public List<Floors> findBySmallerPrice(double price) {
        List<Floors> floorList = new ArrayList();
        Query query = em.createNamedQuery("Floors.findBySmallerPrice");
        query.setParameter("price",price);
        floorList = (List<Floors>) query.getResultList();
        return floorList;
    }

    //method to get floors by price
    public List<Floors> findByRangePrice(double fromPrice,double toPrice) {
        List<Floors> floorList = new ArrayList();
        Query query = em.createNamedQuery("Floors.findByRangePrice");
        query.setParameter("fromPrice", fromPrice);
        query.setParameter("toPrice", toPrice);
        floorList = (List<Floors>) query.getResultList();
        return floorList;
    }

}
