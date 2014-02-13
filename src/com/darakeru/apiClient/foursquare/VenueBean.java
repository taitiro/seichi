package com.darakeru.apiClient.foursquare;

import java.io.IOException;
import java.io.Serializable;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;

import javax.json.Json;
import javax.json.JsonArray;
import javax.json.JsonObject;
import javax.json.JsonReader;

import com.darakeru.seichi.Parameter;

public class VenueBean implements Serializable {

    private static final long serialVersionUID = 1L;
    /** Foursquare Client ID */
    private final String CLIENT_ID = Parameter.FOURSQUARE_CLIENT_ID;
    /** Foursquare Client Secret ID */
    private final String CLIENT_SECRET_ID = Parameter.FOURSQUARE_CLIENT_SECRET_ID;
    /** foursquare venue Endpoint*/
    public static final String ENDPOINT_URL = "https://api.foursquare.com/v2/venues/";
    /** this module's version date */
    private static final String VERSION_DATE = "20140208";

    /** Foursauare Venue ID*/
    private String id;
    
    /** Foursauare Venue URL*/
    private String urlStr;

    /** それぞれのmedia情報 */
    private ArrayList<OneTips> tipsArray;

    public VenueBean(String id) {
        this.setId(id);
        try {
            if (this.fetchData()) {
                //NOP
            } else {
                this.setTipsArray(new ArrayList<OneTips>());
            }
        } catch (Exception e) {
            e.printStackTrace();
            this.setTipsArray(new ArrayList<OneTips>());
        }
    }

    public String getId() {
        return id;
    }

    private void setId(String id) {
        this.id = id;
    }

    public ArrayList<OneTips> getTipsArray() {
        return tipsArray;
    }

    public void setTipsArray(ArrayList<OneTips> tipsArray) {
        this.tipsArray = tipsArray;
    }

    public boolean fetchData() throws IOException {
        ArrayList<OneTips> tipsArray = new ArrayList<>();
        String urlStr = ENDPOINT_URL;
        urlStr += id;
        urlStr += ("?client_id=" + CLIENT_ID);
        urlStr += ("&client_secret=" + CLIENT_SECRET_ID);
        urlStr += ("&v=" + VERSION_DATE);
        //System.out.println(urlStr);
        URL url = new URL(urlStr);
        HttpURLConnection con = (HttpURLConnection) url.openConnection();
        con.setRequestMethod("GET");
        try {
            con.connect();
            if (con.getResponseCode() == 200) {
                JsonReader jsonReader = Json.createReader(con.getInputStream());
                JsonObject object = jsonReader.readObject();
                this.setUrlStr(object.getJsonObject("response").getJsonObject("venue").getString("canonicalUrl"));
                JsonArray tips = object.getJsonObject("response").getJsonObject("venue").getJsonObject("tips").getJsonArray("groups");
                for (int i = 0; i < tips.size(); i++) {
                    //今のところothersのTipsのみ対応
                    if (tips.getJsonObject(i).getString("type").equals("others")) {
                        JsonArray datas = tips.getJsonObject(i).getJsonArray("items");
                        for (int j = 0; j < datas.size(); j++) {
                            OneTips thisTips = new OneTips();
                            thisTips.setUrl(datas.getJsonObject(j).getString("canonicalUrl"));
                            thisTips.setName(datas.getJsonObject(j).getJsonObject("user").getString("firstName"));
                            thisTips.setComment(datas.getJsonObject(j).getString("text"));
                            if (datas.getJsonObject(j).containsKey("photourl")) {
                                thisTips.setImage(datas.getJsonObject(j).getString("photourl"));
                            } else {
                                thisTips.setImage("");
                            }
                            tipsArray.add(thisTips);
                        }
                    }
                }
            } else {
                //System.out.println(con.getResponseCode() + " : " + con.getResponseMessage());
                return false;
            }
        } finally {
            con.disconnect();
        }
        this.setTipsArray(tipsArray);
        return true;
    }

    public String getUrlStr() {
        return urlStr;
    }

    public void setUrlStr(String urlStr) {
        this.urlStr = urlStr;
    }

}
