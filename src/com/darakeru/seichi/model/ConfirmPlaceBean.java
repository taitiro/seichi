package com.darakeru.seichi.model;

import java.io.IOException;
import java.io.Serializable;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.LinkedHashMap;

import javax.json.Json;
import javax.json.JsonArray;
import javax.json.JsonObject;
import javax.json.JsonReader;

import com.darakeru.seichi.Parameter;

public class ConfirmPlaceBean extends Place implements Serializable {
/**
 * Foursquareのエンドポイント
 */
    public static final String FOURSQUARE_SEARCH_URL = "https://api.foursquare.com/v2/venues/search";
    /**
     * Instagramのエンドポイント
     */
        public static final String INSTAGRAM_SEARCH_URL = "https://api.foursquare.com/v2/venues/search";
        /**
         * Facebookのエンドポイント
         */
    private static final String FACEBOOK_SEARCH_URL = "https://graph.facebook.com/search";
    
    private LinkedHashMap<Long, String> facebookids;

    private LinkedHashMap<String, String> foursquareids;

    private LinkedHashMap<Integer, String> instagramids;

    private LinkedHashMap<String, String> twitterids;

    public ConfirmPlaceBean() {
        super();
        setFacebookids(new LinkedHashMap<Long, String>());
        setFoursquareids(new LinkedHashMap<String, String>());
        setInstagramids(new LinkedHashMap<Integer, String>());
        setTwitterids(new LinkedHashMap<String, String>());
    }

    @Override
    public String toString() {
        return "Name : " + this.getName() + "\n"
                + "lat : " + this.getLat() + "\n"
                + "lng : " + this.getLng() + "\n"
                + "Address : " + this.getAddress() + "\n"
                + "Google Reference : " + this.getGoogleid() + "\n"
                + "Image URL : " + this.getImg() + "\n"
                + "Place Description : " + this.getPlacedesc() + "\n"
                + "Product ID 1 : " + this.getProductid1() + "\n"
                + "Product ID 2 : " + this.getProductid2() + "\n"
                + "Product ID 3 : " + this.getProductid3() + "\n"
                + "Product ID 4 : " + this.getProductid4() + "\n"
                + "Product ID 5 : " + this.getProductid5() + "\n"
                + "URL1 : " + this.getUrl1() + " (Name : " + this.getUrlname1() + "  \n"
                + "URL2 : " + this.getUrl2() + " (Name : " + this.getUrlname2() + "  \n"
                + "URL3 : " + this.getUrl3() + " (Name : " + this.getUrlname3() + "  \n";
    }

    public LinkedHashMap<Long, String> getFacebookids() {
        return facebookids;
    }

    public void setFacebookids(LinkedHashMap<Long, String> facebookids) {
        this.facebookids = facebookids;
    }

    public void addFacebookids(long key, String value) {
        this.facebookids.put(key, value);
    }

    public LinkedHashMap<String, String> getFoursquareids() {
        return foursquareids;
    }

    public void setFoursquareids(LinkedHashMap<String, String> foursquareids) {
        this.foursquareids = foursquareids;
    }

    public void addFoursquareids(String key, String value) {
        this.foursquareids.put(key, value);
    }

    public LinkedHashMap<Integer, String> getInstagramids() {
        return instagramids;
    }

    public void setInstagramids(LinkedHashMap<Integer, String> instagramids) {
        this.instagramids = instagramids;
    }

    public void addInstagramids(int key, String value) {
        this.instagramids.put(key, value);
    }

    public LinkedHashMap<String, String> getTwitterids() {
        return twitterids;
    }

    public void setTwitterids(LinkedHashMap<String, String> twitterids) {
        this.twitterids = twitterids;
    }

    public void addTwitterids(String key, String value) {
        this.twitterids.put(key, value);
    }

    public void setFoursquareid() throws IOException {
        URL url = new URL(FOURSQUARE_SEARCH_URL);
        HttpURLConnection con = (HttpURLConnection) url.openConnection();
        con.addRequestProperty("ll", this.getLat().toPlainString());
        con.addRequestProperty("ll", this.getLng().toPlainString());
        con.setRequestProperty("client_id", Parameter.FOURSQUARE_CLIENT_ID);
        con.setRequestProperty("client_secret", Parameter.FOURSQUARE_CLIENT_SECRET_ID);
        con.setRequestProperty("v", Parameter.VERSION_DATE);
        con.setRequestMethod("GET");
        try {
            con.connect();
            if (con.getResponseCode() == 200) {
                JsonReader jsonReader = Json.createReader(con.getInputStream());
                JsonObject object = jsonReader.readObject();
                JsonArray venues = object.getJsonObject("response").getJsonArray("venues");
                for(int i=0;i<venues.size();i++){
                    String id = venues.getJsonObject(i).getString("id");
                    String name = venues.getJsonObject(i).getString("name");
                    this.addFoursquareids(id, name);
                    if(i==0){
                        this.setFoursquareid(id);
                    }
                }
            } else {
                this.addFoursquareids("", "Error");
                this.setFoursquareid("");
            }
        } finally {
            con.disconnect();
        }
    }

    public void setInstagramid() throws IOException {
        URL url = new URL(INSTAGRAM_SEARCH_URL);
        HttpURLConnection con = (HttpURLConnection) url.openConnection();
        con.setRequestProperty("lat", this.getLat().toPlainString());
        con.setRequestProperty("lng", this.getLng().toPlainString());
        con.setRequestProperty("client_id", Parameter.INSTAGRAM_CLIENT_ID);
        con.setRequestMethod("GET");
        try {
            con.connect();
            if (con.getResponseCode() == 200) {
                JsonReader jsonReader = Json.createReader(con.getInputStream());
                JsonObject object = jsonReader.readObject();
                JsonArray datas = object.getJsonArray("data");
                for(int i=0;i<datas.size();i++){
                    int id = datas.getJsonObject(i).getInt("id");
                    String name = datas.getJsonObject(i).getString("name");
                    this.addInstagramids(id, name);
                    if(i==0){
                        this.setInstagramid(id);
                    }
                }
            } else {
                this.addInstagramids(0, "Error");
                this.setInstagramid(0);
            }
        } finally {
            con.disconnect();
        }
    }

    public void setFacebookid() throws IOException{
        URL url = new URL(FACEBOOK_SEARCH_URL);
        HttpURLConnection con = (HttpURLConnection) url.openConnection();
        con.setRequestProperty("type", "place");
        con.addRequestProperty("center", this.getLat().toPlainString());
        con.addRequestProperty("center", this.getLng().toPlainString());
        con.setRequestProperty("access_token", Parameter.FACEBOOK_TOKEN);
        con.setRequestMethod("GET");
        try {
            con.connect();
            if (con.getResponseCode() == 200) {
                JsonReader jsonReader = Json.createReader(con.getInputStream());
                JsonObject object = jsonReader.readObject();
                JsonArray datas = object.getJsonArray("data");
                for(int i=0;i<datas.size();i++){
                    long id = datas.getJsonObject(i).getJsonNumber("id").longValue();
                    String name = datas.getJsonObject(i).getString("name");
                    this.addFacebookids(id, name);
                    if(i==0){
                        this.setFacebookid(id);
                    }
                }
            } else {
                this.addFacebookids(0, "Error");
                this.setFacebookid(0);
            }
        } finally {
            con.disconnect();
        }

    }

    public void setTwitterid() {
        // TODO 自動生成されたメソッド・スタブ

    }
}