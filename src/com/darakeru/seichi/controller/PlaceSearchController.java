package com.darakeru.seichi.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.util.List;

import javax.json.Json;
import javax.json.JsonArrayBuilder;
import javax.json.JsonBuilderFactory;
import javax.json.JsonObject;
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

import com.darakeru.seichi.model.Place;
import com.darakeru.seichi.model.Placework;

/**
 * Servlet implementation class PlaceSearchController
 */
@WebServlet(description = "場所の検索結果をJSONで返す", urlPatterns = { "/search" })
public class PlaceSearchController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private JsonBuilderFactory factory = Json.createBuilderFactory(null);
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PlaceSearchController() {
        super();
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        EntityManagerFactory emf = Persistence.createEntityManagerFactory("Seichi");
        EntityManager em = emf.createEntityManager();
        

        BigDecimal latNorth = new BigDecimal(-90.000000);//最も南の緯度(比較対象だから)
        BigDecimal latSouth = new BigDecimal(90.000000);//最も東の緯度(比較対象だから)
        BigDecimal lngEast = new BigDecimal(180.000000);//最も西の緯度(比較対象だから)
        BigDecimal lngWest = new BigDecimal(-180.000000);//最も東の緯度(比較対象だから)
        JsonArrayBuilder placeJsonArrayBuilder = factory.createArrayBuilder();//場所リストのJsonArray

        // Place クラスで定義された NamedQuery を使って全場所を取得してJsonArrayに格納
        @SuppressWarnings("unchecked")
        List<Place> placeList = (List<Place>) em.createNamedQuery("Place.findAll").getResultList();
        for (Place onePlace : placeList) {
            //表示範囲の緯度・経度を計算している
            if( onePlace.getLat().doubleValue() > latNorth.doubleValue() ){
                latNorth = onePlace.getLat();
            }
            if( onePlace.getLat().doubleValue() < latSouth.doubleValue() ){
                latSouth = onePlace.getLat();
            }
            if( onePlace.getLng().doubleValue() > lngWest.doubleValue() ){
                lngWest = onePlace.getLng();
            }
            if( onePlace.getLng().doubleValue() < lngEast.doubleValue() ){
                lngEast = onePlace.getLng();
            }
            JsonArrayBuilder worksArray = factory.createArrayBuilder();//作品リストのJsonArray
            for (Placework oneWork : onePlace.getPlaceworks() ){
                worksArray.add(factory.createObjectBuilder()
                        .add("id",oneWork.getPlaceworkid())
                        .add("name",oneWork.getWork().getName()));
            }
            JsonObjectBuilder onePlaceObj = factory.createObjectBuilder().add("id",onePlace.getPlaceid())
                    .add("name",onePlace.getName())
                    .add("latlng",factory.createArrayBuilder()
                            .add(onePlace.getLat())
                            .add(onePlace.getLng()))
                    .add("work",worksArray)
                    .add("img",onePlace.getImg())
                    .add("comment",onePlace.getPlacedesc().replaceAll("\n|\r", ""));
            placeJsonArrayBuilder.add(onePlaceObj);
        }
        em.close();
        emf.close();
        JsonObject retJsonObj = factory.createObjectBuilder()//返却するJsonArray
                .add("latlngNorthEast",factory.createArrayBuilder()
                        .add(latNorth)
                        .add(lngEast))
                .add("latlngSouthWest",factory.createArrayBuilder()
                        .add(latSouth)
                        .add(lngWest))
                .add("place",placeJsonArrayBuilder).build();
        PrintWriter out = response.getWriter();
        try {
            JsonWriter jsonWriter = Json.createWriter(out);
            jsonWriter.writeObject(retJsonObj);
        } catch (Exception e) {
            //NOP
        }
    }

}
