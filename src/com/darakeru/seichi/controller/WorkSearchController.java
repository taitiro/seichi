package com.darakeru.seichi.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

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
@WebServlet(description = "場所の検索結果をJSONで返す", urlPatterns = { "/searchwork" })
public class WorkSearchController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private JsonBuilderFactory factory = Json.createBuilderFactory(null);
    /**
     * @see HttpServlet#HttpServlet()
     */
    public WorkSearchController() {
        super();
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        EntityManagerFactory emf = Persistence.createEntityManagerFactory("Seichi");
        EntityManager em = emf.createEntityManager();
        
        JsonArrayBuilder placeJsonArrayBuilder = factory.createArrayBuilder();//作品リストのJsonArray

        // Place クラスで定義された NamedQuery を使って全場所を取得してJsonArrayに格納
        @SuppressWarnings("unchecked")
        List<Work> workList = (List<Work>) em.createNamedQuery("Work.findAll").getResultList();
        for (Work oneWork : workList) {
            JsonArrayBuilder placesArray = factory.createArrayBuilder();//作品リストのJsonArray
            for (Placework onePlace : oneWork.getPlaceworks() ){
                placesArray.add(factory.createObjectBuilder()
                        .add("id",onePlace.getPlaceworkid())
                        .add("name",onePlace.getPlace().getName()));
            }
            JsonObjectBuilder onePlaceObj = factory.createObjectBuilder()
                    .add("id",oneWork.getWorkid())
                    .add("name",oneWork.getName())
                    .add("place",placesArray)
                    .add("img",oneWork.getImg())
                    .add("comment",oneWork.getWorkdesc().replaceAll("\n|\r", ""));
            placeJsonArrayBuilder.add(onePlaceObj);
        }
        em.close();
        emf.close();
        JsonArray retJsonArray = placeJsonArrayBuilder.build();
        PrintWriter out = response.getWriter();
        try {
            JsonWriter jsonWriter = Json.createWriter(out);
            jsonWriter.writeArray(retJsonArray);
        } catch (Exception e) {
            //NOP
        }
    }
}