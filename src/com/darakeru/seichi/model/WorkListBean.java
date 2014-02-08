package com.darakeru.seichi.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.LinkedHashMap;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

public class WorkListBean implements Serializable {
    private static final long serialVersionUID = 1L;

    @SuppressWarnings("unchecked")
    public WorkListBean(){
        workList = new LinkedHashMap<>();
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("Seichi");
        EntityManager em = emf.createEntityManager();
        ArrayList<Work> tempWorkList = (ArrayList<Work>) em.createNamedQuery("Work.findAll").getResultList();
        for(Work oneWork : tempWorkList ){
            this.addWorkList(oneWork.getWorkid(), oneWork.getName());
        }
    }
    private LinkedHashMap<Integer,String> workList;

    public LinkedHashMap<Integer,String> getWorkList() {
        return workList;
    }

    public void setWorkList(LinkedHashMap<Integer,String> workList) {
        this.workList = workList;
    }

    public void addWorkList(int id, String name) {
        this.workList.put(id, name);
    }
}
