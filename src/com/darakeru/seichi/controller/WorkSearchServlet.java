package com.darakeru.seichi.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.json.Json;
import javax.json.JsonArray;
import javax.json.JsonArrayBuilder;
import javax.json.JsonBuilderFactory;
import javax.json.JsonObjectBuilder;
import javax.json.JsonWriter;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.darakeru.seichi.model.Placework;
import com.darakeru.seichi.model.Work;

/**
 * Servlet implementation class PlaceSearchController
 */
@WebServlet(description = "作品の検索結果をJSONで返す", urlPatterns = { "/api/searchwork" })
public class WorkSearchServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    /**
     * 作品の検索結果を表示する最大件数
     */
    private static final int LIMIT_NUM = 50;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public WorkSearchServlet() {
        super();
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    @SuppressWarnings("unchecked")
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        JsonBuilderFactory factory = Json.createBuilderFactory(null);
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("Seichi");
        EntityManager em = emf.createEntityManager();
        JsonArray retJsonArray = null;
        try {
            ArrayList<Work> workList = null;
            JsonArrayBuilder placeJsonArrayBuilder = factory.createArrayBuilder();
            if (request.getParameter("name") != null && !request.getParameter("name").equals("")) {
                // Work クラスで定義された NamedQuery を使って合致する場所を取得してJsonArrayに格納
                workList = (ArrayList<Work>) em.createNamedQuery("Work.findByName").setParameter("name", "%" + request.getParameter("name") + "%")
                        .setMaxResults(LIMIT_NUM).getResultList();
            } else {
                // Work クラスで定義された NamedQuery を使って全場所を取得してJsonArrayに格納
                workList = (ArrayList<Work>) em.createNamedQuery("Work.findAll").setMaxResults(LIMIT_NUM).getResultList();
            }
            if(workList.isEmpty()){
                response.sendError(404, "検索結果は見つかりませんでした");
            }
            for (Work oneWork : workList) {
                JsonArrayBuilder placesArray = factory.createArrayBuilder();//作品リストのJsonArray
                for (Placework onePlace : oneWork.getPlaceworks()) {
                    placesArray.add(factory.createObjectBuilder()
                            .add("id", onePlace.getPlace().getPlaceid())
                            .add("name", onePlace.getPlace().getName()));
                }
                JsonObjectBuilder onePlaceObj = factory.createObjectBuilder()
                        .add("id", oneWork.getWorkid())
                        .add("name", oneWork.getName())
                        .add("place", placesArray)
                        .add("img", oneWork.getImg())
                        .add("comment", oneWork.getWorkdesc().replaceAll("\n|\r", ""));
                placeJsonArrayBuilder.add(onePlaceObj);
            }
            retJsonArray = placeJsonArrayBuilder.build();
            PrintWriter out = response.getWriter();
            JsonWriter jsonWriter = Json.createWriter(out);
            jsonWriter.writeArray(retJsonArray);
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(500, "サーバーでエラーが発生しました");
        } finally {
            em.close();
            emf.close();
        }
    }
}