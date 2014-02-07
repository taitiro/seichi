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
        try {
            ArrayList<Place> placeList = null;
            PlaceJsonBean thisPlaceJsonBean = null;
            // Place クラスで定義された NamedQuery を使って全場所を取得してJsonArrayに格納
            if (request.getParameter("place") != null && !request.getParameter("place").equals("")) {
                // Place クラスで定義された NamedQuery を使って合致する場所を取得してJsonArrayに格納
                placeList = (ArrayList<Place>) em.createNamedQuery("Place.findByName").setParameter("name", "%" + request.getParameter("place") + "%")
                        .setMaxResults(LIMIT_NUM).getResultList();
                System.out.println("test");
            } else {
                // Place クラスで定義された NamedQuery を使って全場所を取得してJsonArrayに格納
                placeList = (ArrayList<Place>) em.createNamedQuery("Place.findAll").setMaxResults(LIMIT_NUM).getResultList();
            }
            if(placeList.isEmpty()){
                response.sendError(404, "検索結果は存在しません");
            }else{
                thisPlaceJsonBean = new PlaceJsonBean(placeList);
                response.getWriter().print(thisPlaceJsonBean.getJsonData());
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(500, "サーバー内部のエラーです");
        } finally {
            em.close();
            emf.close();
        }
    }
}
