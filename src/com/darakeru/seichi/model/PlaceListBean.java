package com.darakeru.seichi.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.LinkedHashMap;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

public class PlaceListBean implements Serializable {
    private static final long serialVersionUID = 1L;

    @SuppressWarnings("unchecked")
    public PlaceListBean(){
        placeList = new LinkedHashMap<>();
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("Seichi");
        EntityManager em = emf.createEntityManager();
        ArrayList<Place> tempPlaceList = (ArrayList<Place>) em.createNamedQuery("Place.findAll").getResultList();
        for(Place onePlace : tempPlaceList ){
            this.addPlaceList(onePlace.getPlaceid(), onePlace.getName());
        }
    }
    private LinkedHashMap<Integer,String> placeList;

    public LinkedHashMap<Integer,String> getPlaceList() {
        return this.placeList;
    }

    public void setPlaceList(LinkedHashMap<Integer,String> placeList) {
        this.placeList = placeList;
    }

    public void addPlaceList(int id, String name) {
        this.placeList.put(id, name);
    }
}