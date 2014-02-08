package com.darakeru.apiClient.twitter;

import java.io.IOException;
import java.io.Serializable;
import java.math.BigDecimal;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;

import javax.json.Json;
import javax.json.JsonArray;
import javax.json.JsonObject;
import javax.json.JsonReader;

import com.darakeru.seichi.Parameter;

public class GeoTweetBean implements Serializable {

    /** Twitter Search REST API Endpoint */
    public static final String ENDPOINT_URL = "https://api.twitter.com/1.1/search/tweets.json?";
    /** 検索の際の半径．
     * とりあえず1kmで．
     */
    private static final String RADIUS = "1km";
    private static final String AUTH = Parameter.TWITTER_TOKEN;
    /** 緯度 */
    private BigDecimal lat;
    /** 経度 */
    private BigDecimal lng;
    /** 個々のtweet */
    private ArrayList<OneTweet> tweetArray;

    public GeoTweetBean(BigDecimal lat, BigDecimal lng) {
        this.setLat(lat);
        this.setLng(lng);
        try {
            if (this.fetchData()) {
                //NOP
            } else {
                this.setTweetArray(new ArrayList<OneTweet>());
            }
        } catch (Exception e) {
            e.printStackTrace();
            this.setTweetArray(new ArrayList<OneTweet>());
        }
    }

    private boolean fetchData() throws IOException {
        ArrayList<OneTweet> tweetArray = new ArrayList<>();
        String urlStr = ENDPOINT_URL;
        urlStr += ("geocode=" + this.getLat().toPlainString() + "," + this.getLng().toPlainString() + "," + RADIUS);
        URL url = new URL(urlStr);
        HttpURLConnection con = (HttpURLConnection) url.openConnection();
        con.setRequestProperty("Authorization", AUTH);
        con.setRequestMethod("GET");
        try {
            con.connect();
            if (con.getResponseCode() == 200) {
                JsonReader jsonReader = Json.createReader(con.getInputStream());
                JsonObject object = jsonReader.readObject();
                JsonArray datas = object.getJsonArray("statuses");
                for (int i = 0; i < datas.size(); i++) {
                    OneTweet thisTweet = new OneTweet();
                    thisTweet.setComment(datas.getJsonObject(i).getString("text"));
                    thisTweet.setName(datas.getJsonObject(i).getJsonObject("user").getString("screen_name"));
                    thisTweet.setUrl("https://twitter.com/" +thisTweet.getName() +"/status/" + datas.getJsonObject(i).getString("id_str"));
                    tweetArray.add(thisTweet);
                }
            } else {
                //System.out.println(con.getResponseCode() + " : " + con.getResponseMessage());
                return false;
            }
        } finally {
            con.disconnect();
        }
        this.setTweetArray(tweetArray);
        return true;
    }


    public BigDecimal getLat() {
        return lat;
    }

    public void setLat(BigDecimal lat) {
        this.lat = lat;
    }

    public BigDecimal getLng() {
        return lng;
    }

    public void setLng(BigDecimal lng) {
        this.lng = lng;
    }

    public ArrayList<OneTweet> getTweetArray() {
        return tweetArray;
    }

    public void setTweetArray(ArrayList<OneTweet> tweetArray) {
        this.tweetArray = tweetArray;
    }

}
