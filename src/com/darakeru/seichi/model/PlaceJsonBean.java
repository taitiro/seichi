package com.darakeru.seichi.model;
import java.io.Serializable;
import java.math.BigDecimal;
import java.util.List;

import javax.json.Json;
import javax.json.JsonArrayBuilder;
import javax.json.JsonBuilderFactory;
import javax.json.JsonObjectBuilder;


/**
 * Session Bean implementation class PlaceJsonBean
 */
public class PlaceJsonBean implements Serializable {
    private List<Place> placeList = null;
    private String jsonData = "";
    /**
     * Default constructor. 
     */
    public PlaceJsonBean() {
    }
    
    public PlaceJsonBean(List<Place> placeList) {
        setPlaceList(placeList);
    }
    public String getJsonData() {
        return jsonData;
    }
    public void setJsonData(String jsonData) {
        this.jsonData = jsonData;
    }

    public List<Place> getPlaceList() {
        return placeList;
    }

    public void setPlaceList(List<Place> placeList) {
        this.placeList = placeList;
        JsonBuilderFactory jsonFactory = Json.createBuilderFactory(null);
        JsonObjectBuilder objectBuilder = jsonFactory.createObjectBuilder();
        JsonArrayBuilder arrayBuilder = jsonFactory.createArrayBuilder();
        BigDecimal latNorth = new BigDecimal(-90.000000);//最も南の緯度(比較対象だから)
        BigDecimal latSouth = new BigDecimal(90.000000);//最も東の緯度(比較対象だから)
        BigDecimal lngEast = new BigDecimal(180.000000);//最も西の緯度(比較対象だから)
        BigDecimal lngWest = new BigDecimal(-180.000000);//最も東の緯度(比較対象だから)
        for(Place onePlace : placeList){
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
            JsonArrayBuilder worksArray = jsonFactory.createArrayBuilder();//作品リストのJsonArray
            for (Placework oneWork : onePlace.getPlaceworks() ){
                worksArray.add(jsonFactory.createObjectBuilder()
                        .add("id",oneWork.getWork().getWorkid())
                        .add("name",oneWork.getWork().getName()));
            }
            JsonObjectBuilder onePlaceObj = jsonFactory.createObjectBuilder().add("id",onePlace.getPlaceid())
                    .add("name",onePlace.getName())
                    .add("latlng",jsonFactory.createArrayBuilder()
                            .add(onePlace.getLat())
                            .add(onePlace.getLng()))
                    .add("work",worksArray)
                    .add("img",onePlace.getImg())
                    .add("comment",onePlace.getPlacedesc().replaceAll("\n|\r", ""));
            arrayBuilder.add(onePlaceObj);
        }
        objectBuilder//返却するJsonArray
                .add("latlngNorthEast",jsonFactory.createArrayBuilder()
                        .add(latNorth)
                        .add(lngEast))
                .add("latlngSouthWest",jsonFactory.createArrayBuilder()
                        .add(latSouth)
                        .add(lngWest))
                .add("place",arrayBuilder);
        this.jsonData = objectBuilder.build().toString();
    }

}
