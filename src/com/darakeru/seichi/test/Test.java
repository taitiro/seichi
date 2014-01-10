package com.darakeru.seichi.test;

import java.util.List;

import javax.persistence.*;

import com.darakeru.seichi.model.Work;


public class Test {

    public static void main(String[] args) {
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("Seichi");
        EntityManager em = emf.createEntityManager();
        Work testWork = new Work();
        testWork.setName("test2");
        testWork.setWorkdesc("testDesc2");
        // トランザクションを開始して 1 つの User Entity を作成
        em.getTransaction().begin();
        em.persist(testWork);
        em.getTransaction().commit();

        // Work クラスで定義された NamedQuery を使って全ユーザーを取得して表示
        @SuppressWarnings("unchecked")
        List<Work> uu = (List<Work>) em.createNamedQuery("Work.findAll").getResultList();
        System.out.println("--- Work list ---");
        for (Work u : uu) {
            System.out.println(" - " + u.getName() + " (id: " + u.getWorkid() + ")");
        }

        em.close();
        emf.close();

    }

}
