package com.darakeru.seichi.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.darakeru.seichi.model.Place;
import com.darakeru.seichi.model.PlaceJsonBean;

/**
 * Servlet implementation class PlaceSearchController
 */
@WebServlet(description = "場所の検索結果をJSONで返す", urlPatterns = { "/api/search" })
public class PlaceSearchServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    /**
     * 作品の検索結果を表示する最大件数
     */
    private static final int LIMIT_NUM = 50;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public PlaceSearchServlet() {
        super();
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    @SuppressWarnings("unchecked")
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        EntityManagerFactory emf = Persistence.createEntityManagerFactory("Seichi");
        EntityManager em = emf.createEntityManager();
        ArrayList<Place> placeList = null;
        PlaceJsonBean thisPlaceJsonBean = null;
        try {
            // Place クラスで定義された NamedQuery を使って全場所を取得してJsonArrayに格納
            if (request.getParameter("name") != null && !request.getParameter("name").equals("")) {
                // Work クラスで定義された NamedQuery を使って合致する場所を取得してJsonArrayに格納
                placeList = (ArrayList<Place>) em.createNamedQuery("Place.findByName").setParameter("name", "%" + request.getParameter("name") + "%")
                        .setMaxResults(LIMIT_NUM).getResultList();
            } else {
                // Work クラスで定義された NamedQuery を使って全場所を取得してJsonArrayに格納
                placeList = (ArrayList<Place>) em.createNamedQuery("Place.findAll").setMaxResults(LIMIT_NUM).getResultList();
            }
            thisPlaceJsonBean = new PlaceJsonBean(placeList);
        } catch (Exception e) {
            e.printStackTrace();
            placeList = null;
            thisPlaceJsonBean = new PlaceJsonBean();
        } finally {
            em.close();
            emf.close();
        }
        response.getWriter().print(thisPlaceJsonBean.getJsonData());
    }
}
